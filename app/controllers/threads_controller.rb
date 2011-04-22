class ThreadsController < ApplicationController
	before_filter :change_board

	def create
		return not_found if not request.post?
		params[:r_thread].merge!({
			ip: 				request.remote_ip,
			_id: 				Ids.get_id(@board[:alias]),
			bump: 			Time.now,
			board_id: 	@board.id,
			file_info: 	Hash.new,
			author_id: 	1
		})
		thread = RThread.create params[:r_thread]
		if params[:goto] == 'thread'
			redirect_to action: 'show', id: thread._id
		else
			redirect_to controller: 'boards', action: 'index', alias: @board[:alias]
		end
	end

	def show
		@thread = RThread.find_by__id params[:id].to_i
	end

	def update
		return not_found if not request.post?
	end
end
