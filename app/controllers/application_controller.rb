class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  def not_found_hack
  	return not_found
  end

  private
  def not_found
  	return render template: 'not_found'
  end

  def change_board
  	if params[:alias]
      al = params[:alias]
	  	if RThread.use_board(al)
        if @board = Board.find_by_alias(al)
	  		  Post.use_board al
        else
          return not_found
        end
	  	else
	  		return not_found
	  	end
	  end
  end

  def get_next_id
    @ids_record = Ids.first
    if not @ids_record.ids.has_key? @board.alias
      @ids_record.ids[@board.alias] = 0
    end
    @ids_record.ids[@board.alias] += 1
    @ids_record.total += 1
    return @ids_record.ids[@board.alias]
  end

  def confirm_id
    @ids_record.save
  end

  def admin_only
    # placeholder
    return not_found if not true
  end

  def parse(text)
    text.strip!
    puts text.inspect
    text.gsub!('&', '&amp;')
    text.gsub!('<', '&lt;') 
    text.gsub! '>', '&gt;'
    text.gsub! /\*\*(.+?)\*\*/, bold('\1')
    text.gsub! /\*(.+?)\*/,     italic('1')
    text.gsub! /__(.+?)__/,     underline('\1')
    text.gsub! /%%(.+?)%%/,     spoiler('\1')
    text.gsub! /\r\n(\r\n)+/,   '<br /><br />'
    text.gsub! /\r\n/,          '<br />'
    @id_counter = 0
    text.gsub! /&gt;&gt;(\d+)/ do |idd|    
      if @id_counter < 10
        @id_counter += 1
        id      = idd[8..idd.length].to_i
        post    = Post.find_by__id id
        thread  = RThread.find_by__id(id) if not post
        if post
          thread_id = post.thread_id
          anchor    = post._id
        elsif thread
          thread_id = thread._id
          anchor    = nil
        end
        if post or thread
          u = url_for(
            format:     'html',
            controller: 'threads', 
            action:     'show',
            alias:      @board.alias,
            id:         thread_id,
            anchor:     anchor
          )
          "<div class='post_link'><a href='#{u}'>#{idd}</a></div>"
        else
          idd
        end         
      else
        idd
      end
    end
    text.gsub! /^&gt;(.+)$/,    quote('\0')
    text
  end
end
