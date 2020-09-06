class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:format])
  end

  def new
    @transaction = UserTransaction.new
    @item = Item.find(params[:format])
  end

  def create
    @transaction = UserTransaction.new(price: transaction_params[:price])
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
    params.require(:user_transaction).permit(:price, :token, :postal_code, :prefecture, :city, :house_number, :building_name, :tle_number,)
  end

  def pay_item
    @item = Item.find(params[:format])
    Payjp.api_key = "sk_test_aec3073dee408e1dea803b7c"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: transaction_params[:price],  # 商品の値段
      card: transaction_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end