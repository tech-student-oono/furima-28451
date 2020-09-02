class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
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

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_price, :category_id, :status_id, :fee_id, :prefecture_id, :scheduled_id).merge(user_id: current_user.id, user_nickname: current_user.nickname)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
