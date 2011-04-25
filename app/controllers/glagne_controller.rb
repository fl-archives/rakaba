class GlagneController < ApplicationController
	def index
		@ids 		= Ids.first
		@motd		= Motd.last
		@boards = Board.all
	end
end
