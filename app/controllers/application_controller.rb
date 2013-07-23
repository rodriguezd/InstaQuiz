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
  	@current_user ||= User.find(session[:user_id])
  end

	helper_method :current_user

  # def can_current_user?(action, object)
  # 	if object.editable_by? current_user
  # 		redirect_to login_path, :notice => "Your are not authorized" and return
  # 	else
  # 		return true
  # 	end
  # end

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:notice] = "Access denied!"
  #   redirect_to quizzes_url
  # end

end
