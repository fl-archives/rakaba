class Ban < ActiveRecord::Base
	has_one :ip
	has_one :user
end
