class PurchaseController < ApplicationController
  require 'payjp'

  def index
    @purchase = Purchase.where(user_id: 1).first
    if @credit.blank?
      redirect_to controller: "credit", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @default_card_information = customer.cards.retrieve(@credit.card_id)
    end
  end


  def pay
    @credit = Credit.where(user_id: 1).first
    Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
    Payjp::Charge.create(
    :amount => 123456, 
    :customer => @credit.customer_id, 
    :currency => 'jpy',
    )
  redirect_to action: 'done' 
  end

  

  def done
    
  end

  def new
  end

end
