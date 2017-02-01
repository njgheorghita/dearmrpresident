class PurchasesController < ApplicationController
  def new
    @letter = Letter.find(params[:letter_id])
    @purchase = Purchase.new
  end

  def create
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
end