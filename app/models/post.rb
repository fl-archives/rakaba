class Post < ActiveRecord::Base
	belongs_to :r_thread
	validates_length_of :title, 	maximum: 200
	validates_length_of :message,	maximum: 3000

	def self.use_board(board_alias)
		Post.table_name = board_alias + '_posts' 
		return Post.table_exists?
	end
end
