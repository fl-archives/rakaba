class PostsController < ApplicationController
	def create
		return not_found if not request.post?
	end

	def update
		return not_found if not request.post?
	end
end
