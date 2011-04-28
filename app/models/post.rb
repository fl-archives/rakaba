class Post < ActiveRecord::Base
	belongs_to 	:r_thread

	before_create do
		self.rid				= Ids.get_next_id(self.board)
	end

	def self.use_board(board_alias)
		Post.table_name = board_alias + '_posts' 
		return Post.table_exists?
	end

	def self.current_board
		return Post.table_name.gsub('_posts', '')
	end

	def self.get(id, board)
		return Post.where(rid: id, board: board).first
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
end
