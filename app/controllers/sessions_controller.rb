class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    
    if (not user.nil?) && 
      user.valid_password?(params[:password]) &&
      user.is_active
      
      session[:token] = user.reset_token
      redirect_to user_url(user)
    else
      flash[:error] = "Email and or password error"
      render :new
    end
  end

  def destroy
    session[:token] = nil
    current_user.reset_token if logged_in?
    redirect_to root_url
  end
end
