class ItemsController < ApplicationController
  # before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    else
      @item = Item.new.includes(:user)
      render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, 
    :category_id, :status_id, :delivery_price_id, :prefecture_id, 
    :delivery_time_id, :price).merge(user_id: current_user.id)
  end


  
end
