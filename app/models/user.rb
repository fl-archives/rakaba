class User < ActiveRecord::Base
	belongs_to 	:ban
	has_many 		:sessions
	serialize :settings, 	Hash
	serialize :seen,			Hash

	before_create do 
		self.settings = Hash.new
	end
end
