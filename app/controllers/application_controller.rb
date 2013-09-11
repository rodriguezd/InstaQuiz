class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_required

  def login_required
  	redirect_to(login_path, :notice => "You must login") if !logged_in?
  end

  def logged_in?
  	!!current_user
  end

  def home
  	render :text => "You are logged in as <%= User.find(session[:id]) %>"
  end

  def login(user)
    session[:user_id] = user.id
  	@current_user = user
  end

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logo_link
    if (session[:user_id] != nil) && logged_in?
      dashboard_user_path(current_user)
    else
      "/"
    end
  end

	helper_method :current_user
  helper_method :logo_link

end
