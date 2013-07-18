class SessionsController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]

  def new
  end

  def create
  	user = User.where(:email => params[:email]).first
  	if user && user.authenticate(params[:password])
  		login(user)
  		redirect_to '/users/1/dashboard'
  	else
  		flash[:notice] = "Could not find you."
  		render :new
  	end
  end

  def destroy
  	reset_session
  end
end
