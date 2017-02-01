class PurchasesController < ApplicationController
  def new
    @letter = Letter.find(params[:letter_id])
    @purchase = Purchase.new
  end

  def create
    purchase = Purchase.create(purchase_params)
    redirect_to new_charge_path(:purchase => purchase)
    # @letter = Letter.find(purchase.letter_id)
    # if order_letter(purchase)
    #   @letter.status = "en route"
    #   @letter.save
    #   redirect_to root_path
    # else
    #   flash[:danger] = "unsuccessful transaction"
    #   redirect_to new_purchase(:letter_id => @letter.id)
    # end
  end

  def order_letter(purchase)
    politician = Politician.new.donald_trump
    lob.letters.create(
      description: purchase.description, 
      to: {
        name:             politician[:name], 
        address_line1:    politician[:address_line], 
        address_state:    politician[:address_state],
        address_city:     politician[:address_city],
        address_country:  politician[:address_country],
        address_zip:      politician[:address_zip]
      }, 
      from: {
        name:             purchase.from_name,
        address_line1:    purchase.from_address_line,
        address_state:    purchase.from_address_state,
        address_city:     purchase.from_address_city,
        address_country:  purchase.from_address_country,
        address_zip:      purchase.from_address_zip
      },
      file: purchase.file ,
      data: {
        email: purchase.data
      },
      color: purchase.color 
    )
  end

  private 

  def purchase_params
    params.require(:purchase).permit(:id,
                                      :letter_id,
                                      :description,
                                      :from_name,
                                      :from_address_line,
                                      :from_address_city,
                                      :from_address_state,
                                      :from_address_country,
                                      :from_address_zip,
                                      :file,
                                      :data,
                                      :color )
  end
end