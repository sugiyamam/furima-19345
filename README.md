# furima-19345 DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nick name|string|null :false|
|mail address|string|null: false|
|password|string|null: false|
|name|string|null :false|
|kananame|string|null :false|
|date of birth|string|null :false|

### Association
- has_many :items
- has_many :buys

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item name|string|null :false|
|item description|text|null :false|
|item category(active_hash)|string|null :false|
|item stasus(active_hash)|string|null :false|
|delivery price(active_hash)|integer|null: false|
|ship-from address(active_hash)|string|null: false|
|delivery time(active_hash)|integer|null: false|
|item price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user

## buysテーブル
|Column|Type|Options|
|------|----|-------|
|item name|string|null :false|
|item price|integer|null: false|
|payment amount|string|null: false|


### Association
- belongs_to :user
- has_one :delivery

## deliverysテーブル
|Column|Type|Options|
|------|----|-------|
|postal code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|house number|string|null: false|
|building name|string||
|phone number|string|null: false|
|buy_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :buy