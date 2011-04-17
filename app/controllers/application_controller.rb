class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found_hack
  	return not_found
  end

  private
  def not_found
  	return render :template => 'not_found'
  end
end
