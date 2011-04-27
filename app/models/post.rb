class Post < ActiveRecord::Base
	belongs_to 	:r_thread
	serialize		:file_info, Hash
	has_attached_file		:file, 		styles: {thumb: "200x200>"}
	validates_size_of		:message,	maximum: 3000

	before_create do
		self.file_info 	= Hash.new
		self._id				= Ids.get_next_id(Post.current_board)
	end

	def self.use_board(board_alias)
		Post.table_name = board_alias + '_posts' 
		return Post.table_exists?
	end

	def self.current_board
		return Post.table_name.gsub('_posts', '')
	end
end
