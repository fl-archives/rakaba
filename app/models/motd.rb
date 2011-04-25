class Motd < ActiveRecord::Base
	include ApplicationHelper
	
	before_create do 
		self.message = parse self.message
	end
end
