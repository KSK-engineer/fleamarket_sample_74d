class Item < ApplicationRecord
  enum condition: {"選択してください": 0, "新品・未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6 }, _prefix: true 
  enum category_id: {
    "選択して下さい": 0,"レディース": 1,"メンズ": 2,"ベビー・キッズ": 3,"インテリア・住まい・小物": 4,
    "本・音楽・ゲーム": 5,"おもちゃ・ホビー・グッズ": 6,"コスメ・香水・美容": 7,"家電・スマホ・カメラ": 8,
    "スポーツ・レジャー": 9,"ハンドメイド": 10,"チケット": 11,"自動車・オートバイ": 12,"その他": 13
  }, _prefix: true 
  enum delivery_fee: {"選択してください": 0, "送料込み（出品者負担）": 1, "着払い（購入者負担）": 2}, _prefix: true
  enum delivery_day: {"選択してください": 0, "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}, _prefix: true

  has_many :images, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :brand
end
