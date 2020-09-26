class UserOrder
  include ActiveModel::Model
  attr_accessor :domicile_id, :order_id, :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number

  with_options presence: true do
    validates :token, :city, :addresses
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は半角のハイフン(-)を挿入してください" }
    validates :phone_number,length: { maximum: 11, message: "は11字まで登録できます"}
    validates :prefecture_id, numericality: { other_than: 0, message: "を入力してください" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    domicile = Domicile.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number)
  end
end
