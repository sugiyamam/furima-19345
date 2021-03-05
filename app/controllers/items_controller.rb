class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order(:id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    return redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description,
                                 :category_id, :status_id, :delivery_price_id, :prefecture_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end