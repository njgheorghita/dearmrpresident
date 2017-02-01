class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find_by(uid: session[:user_id]) if session[:user_id]
  end

  def lob
    Lob::Client.new(api_key: ENV["LOB_KEY"])
  end
  
  helper_method :current_user, :lob
end
