class PostsController < ApplicationController
  before_filter :check_board

  def create
    return not_found if not request.post?
    if not thread = RThread.get(params[:id].to_i, @board.alias)
      return render(text: t('errors.thread_not_found'))
    end
    permission = get_write_permission
    if permission != true
      return render(text: permission)
    end
    if @level == 1
      @ip = Ip.get(request.remote_ip)
      params[:post][:ip_id] = @ip.id
      if @ip.last_post
        delta = (Time.now - @ip.last_post).to_i
        if delta < 1
          return render(text: t('error.too_fast'))
        end
      end
    end
    params[:post][:thread_id] = thread.rid
    params[:post][:r_thread_id] = thread.id
    params[:post][:user_id] = @user.id if not anonymous?
    params[:post][:board] = @board.alias
    post = Post.new(params[:post])

    if post.valid?
      if post.message.empty? and not params[:file]
        return render(text: t('errors.no_content'))
      else
        file_result = process_file
        if file_result.kind_of? Hash
          post.file_name = file_result[:file_name]
          post.file_size = file_result[:file_size]
          post.file_type = file_result[:file_type]
        elsif file_result.kind_of? String
          return render(text: file_result)
        end
        post.message = parse(post.message)
        post.save
        expire_fragment("#{@board.alias}_#{thread.rid}")
        expire_board
        if @level == 1 
          @ip.last_post = post.created_at
        end
        thread.bump = post.created_at if not post.sage
        thread.replies_count += 1
        thread.save
        url = thread_url(thread.rid, post.rid)
        if params[:goto] == 'thread'
          if params[:from] == 'board'
            return render(text: url)
          else
            return render(partial: 'posts/post', object: post)
          end
        else
          if params[:from] == 'thread'
            return render(text: board_url)
          else
            return render(partial: 'posts/post', object: post)
          end
        end
      end
    else
      return render(text: post.errors.to_a.join('<br />'))
    end
  end

  def update
    admin_only
    # post administration logic
  end

  def delete
    # nothing to see here
  end
end
