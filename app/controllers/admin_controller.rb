class AdminController < ApplicationController
	before_filter :admin_only

	def logs
		@logs = AdminLogEntry.all
	end

	def boards
		admin_only 
		# show boards
	end

	def motd
		admin_only
		if request.post?
			params[:motd][:user_id] = @user.id
			motd = Motd.create(params[:motd])
			motd.message = parse(motd.message)
			redirect_to(controller: 'glagne', action: 'index')
		else
			# this will show all motds in future
			return not_found
		end
	end
end
