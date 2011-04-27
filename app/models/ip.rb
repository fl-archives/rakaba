class Ip < ActiveRecord::Base
	belongs_to :ban

	def self.get(ip)
		record = Ip.find_by_ip(ip)
		if not record
			record = Ip.create(ip: ip)
		end
		return record
	end
end
