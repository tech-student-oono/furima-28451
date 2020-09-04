class TransactionsController < ApplicationController

  def index
    @transaction = UserTransaction.new
  end

  def new
    @transaction = UserTransaction.new
  end

  def create
    @transaction = UserTransaction.new(transaction_params[:id])
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
   #「住所」「カード情報」のキーも追加
   params.require(:item_transaction).permit(:token, :postal_code, :prefecture, :city, :house_number, :building_name, :tle_number).merge(user_id: current_user.id, item_id: item.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_aec3073dee408e1dea803b7c"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end