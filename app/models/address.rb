<<<<<< 出品機能実装
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :prefecture, presence: true
end
======
class Address < ApplicationRecord
  belongs_to :user

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :postcode,   presence: true, format: { with: VALID_POSTAL_CODE_REGEX }

  VALID_PREFECTURE_REGEX = /\A.{2,3}?[都道府県]\z/
  validates :prefecture, presence: true, format: { with: VALID_PREFECTURE_REGEX }

  VALID_CITY_REGEX = /\A(.+?市.+?区|.+?[市区町村])(.+)\z/
  validates :city,       presence: true, format: { with: VALID_CITY_REGEX }

  validates :block,      presence: true

  VALID_TELNUMBER_REGEX = /\A(\d{2,3}-\d{1,4}-\d{4})?\z/
  validates :phone_number, format: { with: VALID_TELNUMBER_REGEX }
end
>>>>>> master
