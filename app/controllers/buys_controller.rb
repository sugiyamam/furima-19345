class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_buys, only: [:index, :create]

  def index
    @buy = BuysForm.new
  end

  def create
    @buy = BuysForm.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_buys
    return redirect_to root_path if @item.buy.present? || current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

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
