class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(name: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    unless session[:user_id]
      render file: "public/404.html" and return
    end
  end
end
