class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled

  validates :image, :item_name, :item_info, :item_price, :category_id, :status_id, :fee_id, :prefecture_id, :scheduled_id, presence: true

  validates :category_id, :status_id, :fee_id, :scheduled_id, numericality: { other_than: 1 }

  validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
