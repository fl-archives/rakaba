class ThreadsController < ApplicationController
	before_filter :change_board

	def create
		return not_found if not request.post?
		thread = RThread.create({
			message: 		params[:message],
			ip: 				request.remote_ip,
			_id:				Ids.get_id(@board[:alias]),
			bump:				Time.now,
			board_id:		@board.id,
			replies_count: 0,
			# placeholders
			author_id:	1,
			title:			'test test',
			sticky:			false,
			hidden:			false
		})
		redirect_to action: 'show', id: thread._id
	end

	def show
		@thread = RThread.find_by__id params[:id].to_i
	end

	def update
		return not_found if not request.post?
	end
end
