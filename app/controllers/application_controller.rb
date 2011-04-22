class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found_hack
  	return not_found
  end

  private
  def not_found
  	return render template: 'not_found'
  end

  def change_board
  	if params[:alias]
      al = params[:alias]
	  	if RThread.use_board(al)
        if @board = Board.find_by_alias(al)
	  		  Post.use_board al
        else
          return not_found
        end
	  	else
	  		return not_found
	  	end
	  end
  end
end
