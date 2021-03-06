class SessionsController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]

  def new
  end

  def create
  	user = User.where(:email => params[:email]).first
  	if user && user.authenticate(params[:password])
  		login(user)
  		redirect_to dashboard_user_path(current_user)
  	else
  		flash[:notice] = "Could not find you."
  		render :new
  	end
  end

  def destroy
  	reset_session
    redirect_to '/'
  end
end
