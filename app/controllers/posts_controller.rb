class PostsController < ApplicationController
	before_filter :check_board

	def create
		return not_found if not request.post?
		if not thread = RThread.find_by__id(params[:id].to_i)
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
				if delta < 10
					return render(text: t('error.too_fast'))
				end
			end
		end
		params[:post][:thread_id] = thread._id
		params[:post][:r_thread_id] = thread.id
		params[:post][:user_id] = @user.id if not anonymous?
		params[:post][:board] = @board.alias
		post = Post.new(params[:post])

		if post.valid?
			if post.message.empty? and not post.file?
				return render(text: t('errors.no_content'))
			else
				post.message = parse(post.message)
				post.save
				expire_fragment(
					controller: 		'threads',
					action: 				'show',
					action_suffix: 	"#{@board.alias}_#{thread._id}"
				)
				expire_fragment(
					controller: 		'boards',
					action: 				'index',
					action_suffix: 	"#{@board.alias}_front_page"
				)
				if not anonymous?
					@user.last_post = post.created_at
				end
				if @level == 1 
					@ip.last_post = post.created_at
				end
				if post.file?
					post.file_file_name = post.file_file_name.force_encoding('utf-8')
				end
				thread.bump = post.created_at if not post.sage
				thread.replies_count += 1
				thread.save
				url = thread_url(thread._id, post._id)
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
