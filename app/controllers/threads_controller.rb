class ThreadsController < ApplicationController
  before_filter :check_board

  def create
    return not_found if not request.post?
    if anonymous?
      if not captcha_correct?
        return render(text: t('errors.captcha'))
      end
    end
    permission = get_write_permission
    if permission != true
      return render(text: permission)
    end
    if @level == 1
      ip = Ip.get(request.remote_ip)
      params[:r_thread][:ip_id]   = ip.id
    end
    params[:r_thread][:user_id] = @user.id if not anonymous?
    params[:r_thread][:board] = @board.alias
    
    thread = RThread.new(params[:r_thread])
    if thread.valid?
      file_result = process_file
      if file_result.kind_of? Hash
        thread.file_name = file_result[:file_name]
        thread.file_size = file_result[:file_size]
        thread.file_type = file_result[:file_type]
        thread.message = parse(thread.message)
        thread.save
        puts 'okay'
        if params[:goto] == 'thread'
          return render(text: thread_url(thread.rid))
        else
          return render(text: board_url)
        end
      elsif file_result.kind_of? String
        return render(text: file_result)
      elsif file_result == nil
        return render(text: t('errors.no_picture'))
      end
    else
      errors = thread.errors.to_a.join('<br />')
      return render(text: errors)
    end
  end

  def show
    @thread = RThread.get(params[:id].to_i, @board.alias)
    return not_found if not @thread
  end

  def update
    admin_only
    # i fuck dogs
  end
end
