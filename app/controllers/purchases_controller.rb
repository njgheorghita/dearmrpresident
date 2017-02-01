class PurchasesController < ApplicationController
  def new
    @letter = Letter.find(params[:letter_id])
    @purchase = Purchase.new
  end

  def create
    purchase = Purchase.create(purchase_params)
    redirect_to preview_path(purchase.id)
    # lob.postcards.create(
    #   description: , 
    #   to: {
    #     name: , 
    #     address_line1: , 
    #     address_state: ,
    #     address_country: ,
    #     address_zip: 
    #   }, 
    #   from: {
    #     name: ,
    #     address_line1: ,
    #     address_state: ,
    #     address_country: ,
    #     address_zip: 
    #   },
    #   file: ,
    #   data: {

    #   },
    #   color: 
    # )
  end

  def preview
    @purchase = Purchase.find(params["id"])
    @letter   = Letter.find(@purchase.letter_id)
    render :layout => false
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