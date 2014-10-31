class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def current_user
    nil || User.find_by(session_token: session[:session_token])
  end
  
  def logged_in?
    !!current_user
  end
  
  def present_user_cannot_access_page
    if logged_in?
      redirect_to user_url(current_user)
    end
  end
end
