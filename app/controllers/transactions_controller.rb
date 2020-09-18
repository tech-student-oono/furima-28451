class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index

  def index
    @transaction = UserTransaction.new
    @item = Item.find(params[:item_id])
    @items = Item.includes(:user)
  end

  def new
    @transaction = UserTransaction.new
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = UserTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def transaction_params
    params.require(:user_transaction).permit(:token, :domicile_id, :transaction_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = 'sk_test_0c9a909a9b03ef70896b5e04' # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: transaction_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end