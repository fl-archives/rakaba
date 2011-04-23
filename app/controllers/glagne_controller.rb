class GlagneController < ApplicationController
	def index
		@ids 		= Ids.first.ids
		@motd		= Motd.last
		@boards = Board.all
		puts @ids.inspect
	end
end
