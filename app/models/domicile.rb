class Domicile < ApplicationRecord
  belongs_to :order
  # belongs_to :item
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
end