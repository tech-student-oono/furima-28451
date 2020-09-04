class TransactionsController < ApplicationController

  def index
    @transaction = ItemTransaction.all
  end
  
  def new
    @transaction = ItemTransaction.new
  end

  def create
    @transaction = ItemTransaction.new(transaction_params)
    @transaction.save
  end

  private

  def transaction_params
   #「住所」「寄付金」のキーも追加
   params.require(:item_transaction).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tle_number, :user_id, :item_id)
  end
end