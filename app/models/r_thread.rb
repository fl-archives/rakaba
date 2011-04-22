class RThread < ActiveRecord::Base
	include ApplicationHelper
	
	has_many 		:posts, :foreign_key => :thread_id
	belongs_to 	:board
	serialize		:file_info, Hash
	validates_length_of :title, 	maximum: 	250
	validates_length_of :message,	maximum: 	3000
	has_attached_file		:file, 		styles: {thumb: "200x200>"}

	before_create do 
		self.message 	= parse self.message
	end

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
