class HomeController < ApplicationController
  def index
    @letters = Letter.where(user_uid: current_user.uid) unless current_user.nil?
  end
end