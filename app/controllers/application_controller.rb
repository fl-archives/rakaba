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

  def get_next_id
    @ids_record = Ids.first
    if not @ids_record.ids.has_key? @board.alias
      @ids_record.ids[@board.alias] = 0
    end
    @ids_record.ids[@board.alias] += 1
    @ids_record.total += 1
    return @ids_record.ids[@board.alias]
  end

  def confirm_id
    @ids_record.save
  end

  def admin_only
    # placeholder
    return not_found if not true
  end
end
