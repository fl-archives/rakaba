class RThread < ActiveRecord::Base
	include ApplicationHelper
	
	has_many 		:posts
	validates_length_of :title, 	maximum: 	250
	validates_length_of :message,	maximum: 	3000

	before_create do 
		self.bump 			= Time.now
		self.rid				= Ids.get_next_id(self.board)
	end

	def has_file?
		return self.file_name != nil
	end

	def file_url 
		path = "/images/#{self.board}/#{self.file_name}"
		return path + ".#{self.file_type}"
	end

	def thumb_url
		path = "/images/#{self.board}/thumbs/#{self.file_name}"
		return path + ".#{self.file_type}"
	end

	def self.get(rid, board)
		return RThread.where(rid: rid, board: board).first
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