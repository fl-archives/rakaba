class ThreadsController < ApplicationController
	def create
		if request.post?
			# thread creation logic
		else
			# display template
		end
	end

	def show
	end

	def update
		return not_found if not request.post?
	end
end
