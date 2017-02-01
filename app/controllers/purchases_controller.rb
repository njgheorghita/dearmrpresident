class PurchasesController < ApplicationController
  def new
    @letter = Letter.find(params[:letter_id])
    @purchase = Purchase.new
  end

  def create
    purchase = Purchase.create(purchase_params)
    @letter = Letter.find(purchase.letter_id)
    if order_letter(purchase)
      @letter.status = "en route"
      @letter.save
      redirect_to root_path
    else
      redirect_to new_purchase(:letter_id => @letter.id)
      # flash[:failure] = "unsuccessful transaction"
    end
  end

  def order_letter(purchase)
    lob.letters.create(
      description: purchase.description, 
      to: {
        name: purchase.to_name, 
        address_line1: purchase.to_address_line, 
        address_state: purchase.to_address_state,
        address_city: purchase.to_address_city,
        address_country: purchase.to_address_country,
        address_zip: purchase.to_address_zip
      }, 
      from: {
        name: purchase.from_name,
        address_line1: purchase.from_address_line,
        address_state: purchase.from_address_state,
        address_city: purchase.from_address_city,
        address_country: purchase.from_address_country,
        address_zip: purchase.from_address_zip
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
                                      :data,
                                      :color )
  end
end