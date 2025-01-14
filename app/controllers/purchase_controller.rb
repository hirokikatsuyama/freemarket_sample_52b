class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:done, :show, :pay]

  def pay
    price = @item.price
    @credit = Credit.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
    Payjp::Charge.create(
      amount: price,
      customer: @credit.customer_id,
      currency: 'jpy',
    )
    @item.update(status: 2)
    @transactions = Transaction.where(item_id: @item.id)
    @transactions.update(buyer_id: current_user.id, status: 2)

    customer = Payjp::Customer.retrieve(@credit.customer_id)
    @default_card_information = customer.cards.retrieve(@credit.card_id)
    render :done
  end

  def done
  end

  def show
    @credit = Credit.where(user_id: current_user.id).first
    if @credit.blank?
      redirect_to new_credit_path(user_id: current_user.id)
    else
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @default_card_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
