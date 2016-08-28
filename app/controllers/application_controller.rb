class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= find_or_create_session_user
  end

  private

  def find_or_create_session_user
    if session[:session_user_id]
      SessionUser.find session[:session_user_id]
    else
      user = SessionUser.create
      session[:session_user_id] = user.id
      user
    end
  end
end
