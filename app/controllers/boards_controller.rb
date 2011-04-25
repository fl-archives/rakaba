class BoardsController < ApplicationController
	before_filter :change_board	
	
	def index
		@threads = RThread.get_page 1
	end

	def page 
		page = params[:page].to_i
		if [0, 1].include? page
			return redirect_to action: 'index', trailing_slash: true
		else
			@threads = RThread.get_page page
			if @threads.empty?
				return not_found
			else
				render template: 'boards/index'
			end
		end
	end

	def create
		admin_only
		# board creation logic
	end
end
