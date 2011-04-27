class PostsController < ApplicationController
	before_filter :change_board

	def create
		return not_found if not request.post?
		if not thread = RThread.find_by__id(params[:id].to_i)
			return render(text: t('errors.thread_not_found'))
		end
		ip = Ip.get(request.remote_ip)
		params[:post][:ip_id] = ip.id if @level == 1
		params[:post][:thread_id] = thread._id
		params[:post][:user_id] = @user.id if not anonymous?
		post = Post.new(params[:post])
		if post.valid?
			if post.message.empty? and not post.file?
				return render(text: t('errors.no_content'))
			else
				post.message = parse(post.message)
				post.save
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
