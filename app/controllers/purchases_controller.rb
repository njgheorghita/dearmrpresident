class PurchasesController < ApplicationController
  def new
    @letter = Letter.find(params[:letter_id])
    @purchase = Purchase.new
  end
end