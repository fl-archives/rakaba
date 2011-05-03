class ApplicationController < ActionController::Base
  before_filter :authenticate
  after_filter  :save_changes
  protect_from_forgery
  include ApplicationHelper

  def not_found_hack
    return not_found
  end

  def banned
  end

  private
  def expire_board
    (1..10).each do |page|
      expire_fragment("#{@board.alias}_page_#{page}")
    end
  end

  def get_write_permission
    url = url_for(controller: 'application', action: 'banned')
    if @level > 1
      if @user.ban
        return url
      else
        return true
      end
    else
      if Ip.get(request.remote_ip).ban
        return url
      else
        return true
      end
    end
  end

  def anonymous?
    @user == 'anonymous'
  end
  
  def authenticate
    @user   = 'anonymous'
    @level  = 1
    if cookies.include?('rakaba_session')
      @session = Session.get(cookies['rakaba_session'])
      if @session
        @user   = @session.user
        @level  = @session.user.level
        delta = (Time.new - @session.updated_at).to_i
        if delta > 1800
          @session.updated_at = Time.new
          @session.save
        end
      else
        cookies.delete(:rakaba_session)
      end
    end
  end

  def not_found
    return render(template: 'not_found')
  end

  def check_board
    if params[:alias]
      board = params[:alias]
      if @board = Board.find_by_alias(board)
        if @level < @board.level
          if anonymous?
            return redirect_to(register_path + '/');
          else
            return redirect_to(:root)
          end
        end
      else
        return not_found
      end
    end
  end

  def admin_only
    return not_found if @level != 4
  end

  def parse(text)
    text.strip!
    text.gsub!('&', '&amp;')
    text.gsub!('<', '&lt;') 
    text.gsub! '>', '&gt;'
    text.gsub! /\*\*(.+?)\*\*/, bold('\1')
    text.gsub! /\*(.+?)\*/,     italic('\1')
    text.gsub! /__(.+?)__/,     underline('\1')
    text.gsub! /%%(.+?)%%/,     spoiler('\1')
    @id_counter = 0
    text.gsub! /&gt;&gt;(\d+)/ do |idd|    
      if @id_counter < 10
        @id_counter += 1
        id      = idd[8..idd.length].to_i
        post    = Post.get(id, @board.alias)
        thread  = RThread.get(id, @board.alias) if not post
        if post
          thread_id = post.thread_id
          anchor    = post.rid
        elsif thread
          thread_id = thread.rid
          anchor    = nil
        end
        if post or thread
          u = thread_url thread_id, anchor
          "<div class='post_link'><a href='#{u}'>#{idd}</a></div>"
        else
          idd
        end         
      else
        idd
      end
    end
    text.gsub! /^&gt;(.+)$/,    quote('\1')
    text.gsub! /\r\n(\r\n)+/,   '<br /><br />'
    text.gsub! /\r\n/,          '<br />'
    text
  end

  def thread_url(id, anchor=nil)
    return url_for(
      controller: 'threads',
      action:     'show',
      alias:      @board.alias,
      id:         id,
      anchor:     anchor,
      format:     'html'
    )
  end

  def board_url
    return url_for(
      controller: 'boards',
      alias:      @board.alias,
      action:     'index',
      trailing_slash: true
    )
  end

  def save_changes
    if not anonymous?
      @user.save if @user.changed?
    end
    if @ip
      @ip.save if @ip.changed?
    end
  end

  def process_file
    if params[:file]
      max_size = @board.settings[:max_file_size]
      types = @board.settings[:allowed_file_types]
      if params[:file].tempfile.size > max_size
        return t('error.file_size_should_be') + " #{max_size / 1024}kb"
      end
      if not types.include? params[:file].content_type
        allowed = Array.new
        types.each do |type|
          allowed << type.split('/')[1]
        end
        return t('error.file_type_sould_be') + ' ' + allowed.join(', ')
      end
      tempfile = params[:file].tempfile
      hash = Digest::MD5.hexdigest(tempfile.read)
      hash_record = RFile.where(board: @board.alias, hash: hash).first
      if hash_record
        return {
          file_name: hash_record.name,
          file_type: params[:file].content_type.split('/')[1],
          file_size: tempfile.size
        }
      else
        if not File.directory?("#{RAILS_ROOT}/public/images")
          Dir::mkdir("#{RAILS_ROOT}/public/images")
        end
        path = "#{RAILS_ROOT}/public/images/#{@board.alias}"
        thumb_path = path + "/thumbs"
        type = params[:file].content_type.split('/')[1]
        Dir::mkdir(path) if not File.directory?(path)
        Dir::mkdir(thumb_path) if not File.directory?(thumb_path)
        file_index = "#{Time.now.to_i}#{100 + rand(899)}"
        file_name = "#{file_index}.#{type}"
        path += "/#{file_name}"
        thumb_path += "/#{file_name}"
        FileUtils.copy(tempfile.path, path)
        thumb = Magick::ImageList.new(path)[0]
        if thumb.columns > 200 or thumb.rows > 200
          thumb.resize_to_fit!(200, 200)
        end
        thumb.write(thumb_path)
        RFile.create(hash: hash, board: @board.alias, name: file_index)
        return {
          file_name: file_index,
          file_type: type,
          file_size: tempfile.size
        }
      end
    else
      return nil
    end
  end
end
