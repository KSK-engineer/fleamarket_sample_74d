class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :item
  belongs_to :card

  validates :buyer_id, :item_id, :card_id, :status, presence: true
end
