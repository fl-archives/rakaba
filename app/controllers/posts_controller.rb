class PostsController < ApplicationController
	before_filter :change_board

	def create
		return not_found if not request.post?
		if not thread = RThread.find_by__id(params[:id].to_i)
			return render text: t('errors.thread_not_found')
		end
		params[:post].merge!({
			ip: 				request.remote_ip,
			_id: 				get_next_id,
			thread_id: 	thread._id,
			file_info: 	Hash.new,
		})
		post = Post.new params[:post]
		if post.valid?
			if post.message.empty? and not post.file?
				return render text: t('errors.no_content')
			else
				post.save
				confirm_id
				if post.file?
					post.file_file_name = post.file_file_name.force_encoding('utf-8')
				end
				thread.bump = post.created_at if not post.sage
				thread.replies_count += 1
				thread.save
				url = url_for(
					controller: 'threads', 
					action: 		'show',
					format: 		'html',
					id: 				thread._id,
					anchor: 		post._id
				)
				if params[:goto] == 'thread'
					if params[:from] == 'board'
						return render text: url
					else
						return render partial: 'posts/post', object: post
					end
				else
					if params[:from] == 'thread'
						return render text: url_for(:back)
					else
						return render partial: 'posts/post', object: post
					end
				end
			end
		else
			return render text: post.errors.to_a.join('<br />')
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
