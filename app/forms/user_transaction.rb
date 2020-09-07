class UserTransaction

  include ActiveModel::Model
  attr_accessor :token, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :tle_number

  def save
    user = User.create(name: name, nickname: nickname)
    # カード決済の情報を保存
    Transaction.create(:token, user_id: user.id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, tle_number: tle_number, user_id: user.id)
  end
end