class RThread < ActiveRecord::Base
	include ApplicationHelper
	
	has_many 		:posts, foreign_key: :thread_id
	serialize		:file_info, Hash
	validates_length_of :title, 	maximum: 	250
	validates_length_of :message,	maximum: 	3000
	has_attached_file		:file, 		styles: {thumb: "200x200>"}

	before_create do 
		self.bump 			= Time.now
		self.file_info	= Hash.new
		self._id				= Ids.get_next_id(RThread.current_board)
	end

	def self.use_board(board_alias)
		RThread.table_name = board_alias + '_threads' 
		return RThread.table_exists?
	end

	def self.get_page(page_number)
		return RThread.where(hidden: false).order('bump DESC').paginate(
			per_page: 	10,
			page: 			page_number,
		)
	end

	def self.current_board
		return RThread.table_name.gsub '_threads', ''
	end

	def replies
		Post.where(hidden: false, thread_id: self._id).to_a
	end
end