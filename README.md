#  Furima テーブル設計

## users テーブル

| Column               | Type     | Options                   |
| -------------------- | -------- | ------------------------- |
| nickname             | string   | null: false               |
| name_kanji           | string   | null: false               |
| name_hiragana        | string   | null: false               |
| email                | string   | null: false, unique: true |
| password             | string   | null: false               |
| birth_date           | string   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| name         | string        | null: false                    |
| description  | string        | null: false                    |
| category     | string        | null: false                    |
| condition    | string        | null: false                    |
| ship_fee     | string        | null: false                    |
| ship_area    | string        | null: false                    |
| ship_date    | string        | null: false                    |
| sales_price  | integer       | null: false                    |
| sales_fee    | integer       | null: false                    |
| cost         | integer       | null: false                    |
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
- has_one :deliver_address

## deliver_address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :order