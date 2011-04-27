class ThreadsController < ApplicationController
  before_filter :change_board

  def create
    return not_found if not request.post?
    ip = Ip.get(request.remote_ip)
    params[:r_thread][:ip_id]   = ip.id if level == 1
    params[:r_thread][:user_id] = @user.id if not anonymous?
    thread = RThread.new(params[:r_thread])
    if thread.valid?
      if thread.file?
        thread.message = parse(thread.message)
        thread.save
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
