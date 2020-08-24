class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :fee, :prefecture, :scheduled
end