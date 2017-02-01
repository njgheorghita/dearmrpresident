class LettersController < ApplicationController

  def new
    @letter = Letter.new
  end

  def create
    Letter.create(letter_params)
    redirect_to root_path
  end

  private
  def letter_params
    params.require(:letter).permit(:letter_body, :status, :user_uid)
  end
end