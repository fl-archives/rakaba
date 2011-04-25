class GlagneController < ApplicationController
	def index
		@ids 		= Ids.get_record.ids
		@motd		= Motd.last
		@boards = Board.all
		puts @ids.inspect
	end
end
