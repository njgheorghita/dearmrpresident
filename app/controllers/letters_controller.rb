class LettersController < ApplicationController
  
  def new
    @letter = Letter.new
    @maximum_length = Letter.validators_on( :letter_body ).first.options[:maximum]
  end

  def create
    letter = Letter.new(letter_params)
    if letter.save
      redirect_to root_path
    else 
      flash[:danger] = "Please make sure letter is less than 500 chars"
      redirect_to new_letter_path
    end
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