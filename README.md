# fleamarket-74d DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false,unique:true|
|password|string|null:false,unique:true| 
|familyname_kanji|string|null:false|
|firstname_kanji|string|null:false|
|familyname_kana|string|null:false|
|firstname_kana|string|null:false|
|birthday_year|integer|null:false|
|birthday_month|integer|null:false|
|birthday_day|integer|null:false|
### Association
- has_one :address, :dependent => :destroy
- has_one :credit_card(PAY.jp), :dependent => :destroy
- has_many :items, :dependent => :destroy
- has_many :likes(中間), :dependent => :destroy
- has_many :comments(中間), :dependent => :destroy

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|condition|string|null:false|
|delivery_fee|string|null:false|
|delivery_area|string|null:false|
|delivery_days|string|null:false|
|price|integer|null:false|
|status|enum|null:false|
|user_id|references|null:false, foreign_key:true|
|brand_id|references|null:false, foreign_key:true|
|category_id|references|null:false, foreign_key:true|
### Association
- belongs_to :user
- belongs_to :category, 
- belongs_to :brand, 
- has_many :images, :dependent => :destroy
- has_many :likes, :dependent => :destroy
- has_many :comments, :dependent => :destroy

## likes(中間)テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|item_id|references|null:false, foreign_key:true|
### Association
- belongs_to :user
- belongs_to :item


## comments(中間)テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|item_id|references|null:false, foreign_key:true|
|comment|text|null:false|
### Association
- belongs_to :user
- belongs_to :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key:true|
|url|string|null:false|
### Association
- belongs_to :item


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|postcode|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|block|string|null:false|
|building|string|
|phone_number|integer|
### Association
- belongs_to :user

## credit_cards(PAY.jp)テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|card_number|integer|null:false|
|valid_date|integer|null:false|
### Association
- belongs_to :user

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|
### Association
- has_many :items
