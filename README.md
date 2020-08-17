# README
# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_FURIGANA | string | null: false |
| first_name_FURIGANA  | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------  | ----------- |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false |
| image           | string     | null: false |
| text            | text       | null: false |
| price           | integer    | null: false |
| comments        | text       | null: false |

### Association

- belongs_to :user
- has_many :buys

## commentsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| text   | text       | null: false |

### Association

- belongs_to :user
- belomgs_to :item

## buys テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : delivery_address

## delivery_address テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| buy             | references | null: false, foreign_key: true |
| postal_code     | string | null: false |
| address         | string | null: false |
| phone_number    | string | null: false |
| delivery_fee    | string | null: false |
| shipping_origin | string | null: false |
| date_and_time   | string | null: false |

### Association

- belongs_to :buy