class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :token, presence: true
end