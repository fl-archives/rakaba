class GlagneController < ApplicationController
	def index
		@boards = Board.all
	end
end
