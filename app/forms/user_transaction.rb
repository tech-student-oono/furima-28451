class UserTransaction
  include ActiveModel::Model
  attr_accessor :token, :item_price, :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number

  def save
    # カード決済の情報を保存
    Transaction.create(token: token, item_price: item_price, user_id: user.id, item_id: item.id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, user_id: user.id)
  end
end