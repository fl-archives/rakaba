class Post < ActiveRecord::Base
	include ApplicationHelper
	belongs_to 	:r_thread
	serialize		:file_info, Hash
	has_attached_file		:file, 		styles: {thumb: "200x200>"}

	def self.use_board(board_alias)
		Post.table_name = board_alias + '_posts' 
		return Post.table_exists?
	end

	before_create do 
		self.message = parse self.message
	end
end
