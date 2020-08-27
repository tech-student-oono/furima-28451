class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_price, :category_id, :status_id, :fee_id, :prefecture_id, :scheduled_id).merge(user_id: current_user.id)
  end

end