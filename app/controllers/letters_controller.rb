class LettersController < ApplicationController
  def new
    @letter = Letter.new
  end

  def create
    redirect_to root_path
  end
end