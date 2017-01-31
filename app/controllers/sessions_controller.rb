class SessionsController < ApplicationController
  
  def new
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.uid
    redirect_to new_user_path
  end

  def create

  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end