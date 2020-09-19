class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index

  def index
    @order = UserOrder.new
    @item = Item.find(params[:item_id])
    @items = Item.includes(:user)
  end

  def new
    @order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:token, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = 'sk_test_0c9a909a9b03ef70896b5e04' # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end