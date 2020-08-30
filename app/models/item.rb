class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_image, :item_name, :item_info, :item_price, :category_id, :status_id, :fee_id, :prefecture_id, :scheduled_id, presence: true

  validates :category_id, :status_id, :fee_id, :scheduled_id, numericality: { other_than: 1 }

  validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
