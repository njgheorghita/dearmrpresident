class ChargesController < ApplicationController

  def new
    @purchase = Purchase.find(params[:purchase])
  end

  def create
    @amount = 100
    
    customer = Stripe::Customer.create(
      :email  => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer     => customer.id,
      :amount       => @amount,
      :description  => "Purchase ID: ",
      :currency     => 'usd'
    )

    if charge.status == "succeeded"
      purchase = Purchase.find(params[:purchase_id])
      purchase.update_attributes(payment_status: "paid")
      Letter.find(purchase.letter_id).update_attributes(status: "en route")
      politician = Politician.new.donald_trump
      purchase.order_letter(lob, politician)
    end

    rescue Stripe::CardError => e 
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end 