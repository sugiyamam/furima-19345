# furima-19345 DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name|string|null :false|
|mail_address|string|null: false|
|encrypted_password|string|null: false|
|family_name|string|null :false|
|first_name|string|null :false|
|kana_family_name|string|null :false|
|kana_first_name|string|null :false|
|date_of_birth|date|null :false|

### Association
- has_many :items
- has_many :buys


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|description|text|null :false|
|category_id|integer|null :false|
|stasus_id|integer|null :false|
|delivery_price_id|integer|null: false|
|ship-from_address_id|integer|null: false|
|delivery_time_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :buy


## buysテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null :false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliverysテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|municipality|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string|null: false|
|buy_id|references|null: false, foreign_key: true|

### Association
- belongs_to :buy