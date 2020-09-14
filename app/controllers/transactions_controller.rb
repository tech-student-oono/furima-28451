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
    @transaction = UserTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path(@item)
    else
      @items = Item.includes(:user)
      render :index
    end
  end

  private

  def transaction_params
    # 「住所」「カード情報」のキーも追加
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = 'sk_test_0c9a909a9b03ef70896b5e04' # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: transaction_params[:price],  # 商品の値段
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