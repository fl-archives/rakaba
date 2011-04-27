class ThreadsController < ApplicationController
  before_filter :check_board

  def create
    return not_found if not request.post?
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
      if thread.file?
        thread.message = parse(thread.message)
        thread.save
        expire_fragment(
          controller:     'boards',
          action:         'index', 
          action_suffix:  "#{@board_alias}_front_page"
        )
        if params[:goto] == 'thread'
          return render(text: thread_url(thread._id))
        else
          return render(text: board_url)
        end
      else
        return render(text: t('errors.no_picture'))
      end
    else
      errors = thread.errors.to_a.join('<br />')
      return render(text: errors)
    end
  end

  def show
    @thread = RThread.find_by__id(params[:id].to_i)
    return not_found if not @thread
  end

  def update
    admin_only
    # i fuck dogs
  end
end
