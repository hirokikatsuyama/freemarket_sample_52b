# DB設計

## users table
|Column|type|Options|
|------|----|-------|
|nickname|string|null: false|
|avater_image|text|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
### Association
-has_one :address
-has_many :items
-has_many :likes
-has_many :comments
-has_many :transactions
-has_many :evaluations
ーhas_one :credit

## profiles table
|Column|type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|introduction|text|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|bithday_day|integer|null: false|
|user_id|references|null:false, foreign_key:true|
### Association
-belongs_to :user


## address table
|Column|type|Options|
|------|----|-------|
|postal|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|phone|integer|
|user_id|references|null:false, foreign_key:true|
### Association
-belongs_to :user


## items table
|Column|type|Options|
|------|----|-------|
|name|string|null: false|
|detail|string|null: false|
|condition|string|null: false|
|shipping_cost|string|null: false|
|shipping_method|string|null: false|
|shipping_source|string|null: false|
|delivery_date|string|null: false|
|shopping_status|string|null: false|
|price|integer|null: false|
|tax|integer|null: false|
|profit|integer|null: false|
|status|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|small_category_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|

### Association
-belongs_to :user
-belongs_to :brand
-belongs_to :small_category
-belongs_to :size
-has_many :likes
-has_many :comments
-has_many :images
-has_many :transactions


### comments table
|Column|type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|
### Association
-belongs_to :user
-belongs_to :item


### evaluations table
|Column|type|Options|
|------|----|-------|
|evaluation|string|null: false|
|date|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|transaction_id|references|null: false,foreign_key: true|
### Association
-belongs_to :user
-belongs_to :tansaction


### transactions table
|Column|type|Options|
|------|----|-------|
|item_id|references|null: false,foreign_key: true|
|buyer_id|references|null: false,foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
### Association
-belongs_to :user
-belongs_to :item


### likes table
|Column|type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
-belongs_to :user
-belongs_to :item



### credits table
|Column|type|Options|
|------|----|-------|
|card_number|string|null: false|
|expiration_date_month|string|null: false|
|expiration_date_year|string|null: false|
|security_code|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
-belongs_to :user


### images table
|Column|type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
-belongs_to :item


### brands_group table
|Column|type|Options|
|------|----|-------|
|name|string|null: false|
### Association
-has_many :brands

### brands table
|Column|type|Options|
|------|----|-------|
|name|string|null: false|
|brands_group_id|references|null: false, foreign_key: true|
### Association
-belongs_to :brands_group
-has_many :items

### categories table
|Column|type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|references|null: false, foreign_key: true|
### Association
-belongs_to :parent, class_name: :"Category"
-has_many :children, class_name: :"Category"
-has_many :items


### sizes table
|Column|type|Options|
|------|----|-------|
|name|string|null: false|
### Association
-has_many :items
