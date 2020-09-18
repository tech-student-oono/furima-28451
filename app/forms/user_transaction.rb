class UserTransaction
  include ActiveModel::Model
  attr_accessor :token, :domicile_id, :transaction_id, :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number

  with_options presence: true do
    validates :token, :postal_code, :prefecture_id, :city, :addresses, :phone_number, presence: true
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    transaction = Transaction.create(user_id: user_id, item_id: item_id)
    domicile = Domicile.create(transaction_id: transaction.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number)
    
  end
end