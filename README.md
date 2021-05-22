#  Furima テーブル設計

## users テーブル

| Column               | Type     | Options                   |
| -------------------- | -------- | ------------------------- |
| nickname             | string   | null: false               |
| name_kanji_last      | string   | null: false               |
| name_kanji_first     | string   | null: false               |
| name_furigana_last   | string   | null: false               |
| name_furigana_first  | string   | null: false               |
| email                | string   | null: false, unique: true |
| encrypted_password   | string   | null: false               |
| birth_date           | date     | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| name         | string        | null: false                    |
| description  | text          | null: false                    |
| category_id  | integer       | null: false                    |
| condition_id | integer       | null: false                    |
| ship_fee_id  | integer       | null: false                    |
| ship_area_id | integer       | null: false                    |
| ship_date_id | integer       | null: false                    |
| sales_price  | integer       | null: false                    |
| user         | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :deliver_location

## deliver_locations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order