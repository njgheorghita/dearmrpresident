class PurchasesController < ApplicationController
  before_action :require_purchase, only: [:show]
  before_action :require_creator, only: [:new]

  def new
    @letter     = Letter.find(params[:letter_id])
    @purchase   = Purchase.new
    @politician = Politician.new.donald_trump
  end

  def create
    if Purchase.find_by(letter_id: purchase_params[:letter_id]) && Purchase.find_by(letter_id: purchase_params[:letter_id]).payment_status == "paid"
      flash[:danger] = "You've already sent this letter"
      redirect_to root_path
    else
      purchase = Purchase.new(purchase_params)
      if purchase.save
        purchase.update_attributes(file: purchase.generate_letter)
        redirect_to new_charge_path(:purchase => purchase)
      else
        flash[:danger] = "all fields must be filled out"
        redirect_to new_purchase_path(:letter_id => params[:purchase][:letter_id])
      end
    end
  end

  def show
    # use description to find card
    @purchase = Purchase.find(params[:id])
    @letter = @purchase.letter
  end

  private 

  def require_purchase
    if current_user.nil? || current_user.uid != Purchase.find(params[:id]).letter.user_uid
      flash[:danger] = "you can only view your own letters"
      redirect_to root_path
    end
  end

  def require_creator
    if current_user.nil? || current_user.uid != Letter.find(params[:letter_id]).user_uid
      flash[:danger] = "you can only view your own letters"
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:purchase).permit(:id, :letter_id, :description,
                                      :to_name, :to_address_line, :to_address_city, :to_address_state, :to_address_country, :to_address_zip,
                                      :from_name, :from_address_line, :from_address_city, :from_address_state, :from_address_country, :from_address_zip,
                                      :file, :payment_status, :data, :color )
  end
end