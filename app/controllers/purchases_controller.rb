class PurchasesController < ApplicationController

  def new
    @letter     = Letter.find(params[:letter_id])
    @purchase   = Purchase.new
    @politician = Politician.new.donald_trump
  end

  def create
    if Purchase.find_by(letter_id: purchase_params[:letter_id])
      purchase = Purchase.find_by(letter_id: purchase_params[:letter_id])
      flash[:danger] = "You've already sent this letter"
      redirect_to root_path
    else
      purchase = Purchase.create(purchase_params)
      redirect_to new_charge_path(:purchase => purchase)
    end
  end

  def show
    # use description to find card
    @purchase = Purchase.find(params[:id])
    @letter = @purchase.letter
  end

  private 

  def purchase_params
    params.require(:purchase).permit(:id,
                                      :letter_id,
                                      :description,
                                      :to_name,
                                      :to_address_line,
                                      :to_address_city,
                                      :to_address_state,
                                      :to_address_country,
                                      :to_address_zip,
                                      :from_name,
                                      :from_address_line,
                                      :from_address_city,
                                      :from_address_state,
                                      :from_address_country,
                                      :from_address_zip,
                                      :file,
                                      :payment_status,
                                      :data,
                                      :color )
  end
end