class ApplicationController < ActionController::Base
  protect_from_forgery
  def landing
  	render "views/dashboard"
  end
end
