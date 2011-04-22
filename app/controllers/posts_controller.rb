class PostsController < ApplicationController
	before_filter :change_board

	def create
		return not_found if not request.post?
		if not thread = RThread.find_by__id(params[:id].to_i)
			return not_found
		end
		params[:post].merge!({
			ip: 				request.remote_ip,
			_id: 				Ids.get_id(@board[:alias]),
			thread_id: 	thread._id,
			file_info: 	Hash.new,
			author_id: 	1,
		})
		post = Post.create params[:post]
		thread.bump = post.created_at
		thread.replies_count += 1
		thread.save
		redirect_to url_for(
			controller: 'threads', 
			action: 		'show',
			id: 				params[:id],
			anchor:			post._id,	
		)
	end

	def update
		return not_found if not request.post?
	end
end
