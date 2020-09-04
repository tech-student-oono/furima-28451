class ItemTransaction

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :tle_number, :user_id, :item_id

  def save
    # カード決済の情報を保存
    Buy.create(user_id: user.id, item_id: item.id)
    # 住所の情報を保存
    Delivery_Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, tle_number: tle_number, buy_id: buy.id)
  end
end