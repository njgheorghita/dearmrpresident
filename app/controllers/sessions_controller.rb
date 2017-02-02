class SessionsController < ApplicationController
  
  def new
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.uid
    if user.address && user.state && user.zipcode
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def create

  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end