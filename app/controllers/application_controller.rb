class ApplicationController < ActionController::Base
  # protect_from_forgery

  helper_method :logged_in?
  helper_method :current_user

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def authorize
    logged_in? && current_user.is_admin == 't'
    flash[:error] = "Unauthorized request"
    redirect_to :back, :status => :forbidden
  end

  def authenticate
    unless logged_in?
      redirect_to new_session_url, :status => :forbidden
    end
  end
end
