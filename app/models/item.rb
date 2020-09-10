class Item < ApplicationRecord
  enum condition: {"選択してください": 0, "新品・未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6 }, _prefix: true 
  enum delivery_fee: {"選択してください": 0, "送料込み（出品者負担）": 1, "着払い（購入者負担）": 2}, _prefix: true
  enum delivery_day: {"選択してください": 0, "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}, _prefix: true

  has_many :images, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_nested_attributes_for :category
  accepts_nested_attributes_for :brand
end
