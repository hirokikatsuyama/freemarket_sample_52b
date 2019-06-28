class CreditsController < ApplicationController
  protect_from_forgery except: :pay
  require "payjp"

  def new
    @credit = current_user.credit
  end

  def pay 
    Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
    if params[:pay_id].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params[:pay_id],
      metadata: {user_id: 1}
      )
      #payjpに登録
      @credit = current_user.credit.new(customer_id: customer.id, card_id: customer.default_card)
      #dbに登録
      if @credit.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def delete 
    @credit = current_user.credit
    if @credit.present?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      customer = Payjp::Customer.retrieve(credit.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def index
  end

  def show 
    @credit = current_user.credit
    if @credit.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @default_card_information = customer.cards.retrieve(@credit.card_id)
      redirect_to action:index
    end
  end

end

