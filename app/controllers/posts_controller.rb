class PostsController < ApplicationController
	before_filter :change_board

	def create
		return not_found if not request.post?
		if not thread = RThread.find_by__id(params[:id].to_i)
			return not_found
		end

		post = Post.create({
			message: 		params[:message],
			ip: 				request.remote_ip,
			_id:				Ids.get_id(@board[:alias]),
			thread_id:	thread._id,
			# placeholders
			author_id:	1,
			title:			'test test',
			sage:				false,
			hidden:			false
		})
		thread.bump = post.created_at
		thread.replies_count += 1
		thread.save
		redirect_to url_for(controller: 'threads', 
												action: 		'show',
												id: 				params[:id])
	end

	def update
		return not_found if not request.post?
	end
end
