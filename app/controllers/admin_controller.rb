class AdminController < ApplicationController
	before_filter :admin_only

	def post
		post = Post.find_by__id params[:id].to_i
		post = RThread.find_by__id params[:id].to_i if not post
		return not_found if not post
		if request.post?
			# post modification
		else
			post = @post
		end
	end

	def logs
		@logs = AdminLogEntry.all
	end

	def motd
		# change message of the day
	end

	private
	def admin_only
		# placeholder
	end
end
