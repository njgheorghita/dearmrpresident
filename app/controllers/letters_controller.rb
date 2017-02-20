class LettersController < ApplicationController
  
  def new
    @letter = Letter.new
  end

  def create
    Letter.create(letter_params)
    redirect_to root_path
  end

  def destroy
    letter = Letter.find(params[:id])
    letter.destroy
    redirect_to root_path
  end

  private
  def letter_params
    params.require(:letter).permit(:id, :letter_body, :status, :user_uid, :picture_url)
  end
end