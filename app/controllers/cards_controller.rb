class CardsController < ApplicationController
  require 'payjp'

 def new
   card = Card.find_by(user_id: current_user.id)
   #redirect_to card_path(current_user.id) if card.exists?
 end

 def create
    Payjp.api_key =  ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      flash[:notice] = 'カードが削除されました'
      redirect_to root_path
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

end