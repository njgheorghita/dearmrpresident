class UserController < ApplicationController
  def new
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :address, :state, :zipcode)
  end
end