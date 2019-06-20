class CreditController < ApplicationController
  require "payjp"
  def new
    @credit = Credit.where(user_id: 1)
    redirect_to action: "show" if @credit.exists?
  end

  def pay
    Payjp.api_key = ENV["pk_test_a8d83b01f25e72078fc1e347"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  # def create
  #   @credit = Credit.new
  #   redirect_to action: "show" if @credit.exists?
  #   # redirect_to root_path
  # end

  def delete 
    # @credit = Credit.where(user_id: current_user.id).first
    # if card.blank?
    # else
    #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #   customer = Payjp::Customer.retrieve(card.customer_id)
    #   customer.delete
    #   card.delete
    # end
    #   redirect_to action: "new"
  end


  def index
  end

  def show
    @credit = Credit.where(user_id: 1).first
    if @credit.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["pk_test_a8d83b01f25e72078fc1e347"]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

end
