class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :fee, :prefecture, :scheduled

  validates :item_image, :item_name, :item_info, :item_price, :category_id, :status_id, :fee_id, :prefecture_id, :scheduled_id, presence: true

  validates :category_id, :status_id, :fee_id, :scheduled_id, numericality: { other_than: 1 }
end