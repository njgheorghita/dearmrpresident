class HomeController < ApplicationController
  def index
    @letters = Letter.where(user_uid: current_user.uid)
  end
end