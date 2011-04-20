class Post < ActiveRecord::Base
	belongs_to :r_thread

	def self.use_board(board_alias)
		Post.table_name = board_alias + '_posts' 
		return Post.table_exists?
	end
end
