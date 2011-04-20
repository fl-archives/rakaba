class Ids < ActiveRecord::Base
	serialize :ids, Hash

	def self.get_id(board_alias)
		record = self.first
		if not record
			record = Ids.create(:ids => {board_alias => 0})
		end
		if not record.ids.has_key? board_alias
			record.ids[board_alias] = 0
		end
		record.ids[board_alias] += 1
		record.save
		return record.ids[board_alias]
	end
end
