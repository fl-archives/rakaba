class RThread < ActiveRecord::Base
	has_many 		:posts, :foreign_key => :thread_id
	belongs_to 	:board

	def self.use_board(board_alias)
		RThread.table_name = board_alias + '_threads' 
		return RThread.table_exists?
	end

	def self.get_page(page_number)
		return RThread.order('bump DESC')
	end

	def replies
		Post.where(:thread_id => self._id).to_a
	end
end
