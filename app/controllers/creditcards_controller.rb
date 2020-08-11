class CreditcardsController < ApplicationController
  require "payjp"
  
  before_action :set_item, only:[:show, :pay]
  before_action :take_card, only:[:show, :pay]
  before_action :set_api_key

  def index
    if @card
      set_customer
      set_card_infomation
    end
  end
  
  def new
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Creditcards.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash[:notice] = 'カード情報を登録しました'
        redirect_to "/"
      else
        flash[:alert] = 'カード情報を登録できませんでした'
        redirect_to action: "new"
      end
    end
  end

  def show
    if @card.blank?
      flash[:alert] = 'カード情報を登録してください'
      redirect_to creditcards_path
    else
      set_customer
      set_card_infomation
    end

    if current_user.address == nil
      flash[:alert] = '住所を登録したください'
      redirect_to new_address_path
    end
  end

  def destroy
    set_customer
    @customer.delete
    if @card.destroy
      flash[:notice2] = '削除しました'
      redirect_to action: "index"
    else
      flash[:alert2] = '削除できませんでした'
      redirect_to action: "index"
    end
  end

  def pay
    @item.update(buyer_id: current_user.id)
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )
    redirect_to item_purchase_index_path(@item.id) #購入確認画面へ遷移
  end

  private

  def set_api_key
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
  end
  
  def set_item
    @item = Item.find(params[:id])
    @address = Address.find_by(user_id: current_user.id)
  end

  def set_customer
    @customer = Payjp::Customer.retrive(@cars.customer_id)
  end

  def set_card_infomation
    @card_infomation = @customer.cards.retrive(@card.card_id)
  end

  def take_card
    @card = Creditcard.find_by(user_id: current_user.id)
  end



end