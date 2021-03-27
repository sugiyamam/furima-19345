class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @buy = BuysForm.new
  end

  def create
    @buy = BuysForm.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buys_form).permit(:postal_code,
                                :prefecture_id, :municipality, :house_number, 
                                :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
