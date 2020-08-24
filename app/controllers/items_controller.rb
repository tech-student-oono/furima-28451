class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_category, :item_sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery, :item_price,)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end