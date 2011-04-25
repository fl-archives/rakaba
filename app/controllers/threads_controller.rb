class ThreadsController < ApplicationController
  before_filter :change_board

  def create
    return not_found if not request.post?
    params[:r_thread].merge!({
      ip:         request.remote_ip,
      _id:        get_next_id,
      bump:       Time.now,
      board_id:   @board.id,
      file_info:  Hash.new,
      author_id:  1
    })
    thread = RThread.new params[:r_thread]
    if thread.valid?
      if thread.file?
        thread.save
        confirm_id
        if thread.file?
          thread.file_file_name = thread.file_file_name.force_encoding('utf-8')
        end
        if params[:goto] == 'thread'
          return render text: url_for(
            action:     'show', 
            id:         thread._id, 
            format:     'html'
          )
        else
          return render text: url_for(
            controller: 'boards', 
            action:     'index', 
            alias:      @board.alias
          )
        end
      else
        return render text: t('errors.no_picture')
      end
    else
      return thread.errors.to_a.join '<br />'
    end
  end

  def show
    @thread = RThread.find_by__id params[:id].to_i
    return not_found if not @thread
  end

  def update
    admin_only
    # i fuck dogs
  end
end
