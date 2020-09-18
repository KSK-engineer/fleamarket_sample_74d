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
|birthday|date|null:false|
### Association
- has_one :address, :dependent => :destroy
- has_one :card, :dependent => :destroy
- has_many :items, :dependent => :destroy
- has_many :transactions, :dependent => :destroy

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|condition(active_hash)|string|null:false|
|delivery_fee|string|null:false|
|delivery_area|string|null:false|
|delivery_days|string|null:false|
|price|integer|null:false|
|status|enum|null:false|
|seller_id|references|null:false, foreign_key:true|
|buyer_id|references|null:false, foreign_key:true|
|brand_id|references|null:false, foreign_key:true|
|category_id|references|null:false, foreign_key:true|
### Association
- belongs_to :user
- belongs_to :category, 
- belongs_to :brand, 
- has_many :images, :dependent => :destroy


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key:true|
|src|string|null:false|
### Association
- belongs_to :item


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key: true|
|postcode|integer|null:false|
|prefecture_id(acitve_hash)|integer|null: false|
|city|string|null:false|
|block|string|null:false|
|building|string|
|phone_number|integer|
|phone_number|integer|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|customer_id|string|null:false|
|card_id|string|null:false|
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


## Transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|status|integer||
|card_id|string|null:false, foreign_key:true|
|buyer_id|string|null:false, foreign_key:true|
|item_id|string|null:false, foreign_key:true|
### Association
- belongs_tp :card
- belongs_tp :user
- belongs_tp :item
