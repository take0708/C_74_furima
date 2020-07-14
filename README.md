## usersテーブル
|Column|Type|Options|
|———-|——-|———-|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_one :user_detail, dependent: :destroy
- has_one :sns_approval, dependent: :destroy
- has_one :shipping_info, dependent: :destroy
- has_many :todo_list
- has_one :point
- has_one :creditcard, dependent: :destroy
- has_many :comment
- has_many :favo
- has_many :evaluation
- has_many :seller_items, foreign_key: “seller_id”, class_name: “items”
- has_many :buy_items, foreign_key: “buyer_id”, class_name: “items”

## user_detailテーブル
|Column|Type|Options|
|———-|——-|———-|
|family_name|string|null: false|
|first_name|string|null: false, unique: true|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|introduce|text||
|icon|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## shipping_infoテーブル
|Column|Type|Options|
|———-|——-|———-|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postcode|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string|null: false|
|phone_number|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## todo_listテーブル
|Column|Type|Options|
|———-|——-|———-|
|todo_list|string||
|user_id|references|null: false, unique: true|

### Association
- belongs_to :user

## creditcardテーブル
|Column|Type|Options|
|———-|——-|———-|
|card_number|bigint|null: false, foreign_key: true|
|year|integer|null: false|
|month|integer|null: false|
|sequrity_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to user

## commentsテーブル
|Column|Type|Options|
|———-|——-|———-|
|comment|text|null: false|
|user_id|references|null: false, unique: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## favosテーブル
|Column|Type|Options|
|———-|——-|———-|
|user_id|references|null: false, unique: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belong_to :item

## evaluationsテーブル
|Column|Type|Options|
|———-|——-|———-|
|evaluation_text|text|null: false|
|evaluation|enum|null: false|
|user_id|references|null: false, unique: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belong_to :item

## itemsテーブル
|Column|Type|Options|
|———-|——-|———-|
|item|string|null: false|
|item_explanation|text|null: false|
|price|integer|null: false|
|dealing|enum|null: false|
|shipping_area|integer|null: false|
|item_img_id|string|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|shipping_method_id|references|null: false, foreign_key: true|
|shipping_cost_id|references|null: false, foreign_key: true|
|shipping_day_id|references|null: false, foreign_key: true|
|item_size_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- has_many :item_img, dependent: :destroy
- has_many :comment, dependent: :destroy
- has_many :favo
- has_many :evaluation
- belongs_to :brand
- belongs_to :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :shipping_method
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :item_size
- belongs_to :seller, class_name: “user”
- belongs_to :buyer, class_name: “user”

## brandsテーブル
|Column|Type|Options|
|———-|——-|———-|
|brand|string||

### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|———-|——-|———-|
|category|string|null: false|
|anecetry|string|null: false|

### Association
- has_many :items

## item_conditionsテーブル
|Column|Type|Options|
|———-|——-|———-|
|condition|string|null: false|

### Association
- has_many :items

## shipping_methodsテーブル
|Column|Type|Options|
|———-|——-|———-|
|method|string|null: false|

### Association
- has_many :items

## shipping_costsテーブル
|Column|Type|Options|
|———-|——-|———-|
|cost|string|null: false|

### Association
- has_many :items

## shipping_daysテーブル
|Column|Type|Options|
|———-|——-|———-|
|day|string|null: false|

### Association
- has_many :items

## item_sizesテーブル
|Column|Type|Options|
|———-|——-|———-|
|size|string|null: false|

### Association
- has_many :items