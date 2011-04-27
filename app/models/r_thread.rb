class RThread < ActiveRecord::Base
	include ApplicationHelper
	
	has_many 		:posts
	serialize		:file_info, Hash
	validates_length_of :title, 	maximum: 	250
	validates_length_of :message,	maximum: 	3000
	has_attached_file		:file, 		styles: {thumb: "200x200>"}

	before_create do 
		self.bump 			= Time.now
		self.file_info	= Hash.new
		self._id				= Ids.get_next_id(self.board)
	end

	def self.get_page(page_number, board_alias)
		puts RThread.table_name
		return RThread.where(
			hidden: false, 
			board: 	board_alias
		).order('bump DESC').paginate(
			per_page: 	10,
			page: 			page_number,
		)
	end

	def replies
		return self.posts.where(hidden: false).to_a
	end

	def last_replies(amount)
		return self.posts
			.where(hidden: false)
			.order('created_at DESC')
			.limit(amount)
			.to_a.reverse
	end
end