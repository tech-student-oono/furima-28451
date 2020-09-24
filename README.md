#9/23 追加実装「エラー文を英語から日本語にする」の要件定義提出

# 8/20ファイル名を変更

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
| birth_date           | date   | null: false |

### Association

- has_many :items
- has_many :orders
- has_one :domicile

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------  | ----------- |
| user                 | references | null: false, foreign_key: true |
| item_name            | string     | null: false |
| item_image           | string     | null: false |
# | item_sales_status    | integer    | null: false |
| item_price           | integer    | null: false |
| item_info            | text       | null: false |
# | shipping_fee_status  | integer    | null: false |
# | prefecture           | integer    | null: false |
# | scheduled_delivery   | integer    | null: false |
# | item_category        | integer    | null: false |

### Association

- belongs_to :user
- has_one :orders

## commentsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| text   | text       | null: false |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : domicile

## domicile テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| user             | references | null: false, foreign_key: true |
| postal_code     | string  | null: false |
| prefecture      | integer | null: false |
| city            | string  | null: false |
| house_number    | string  | null: false |
| building_name   | string  |
| tle_number      | string  | null: false |
| date_and_time   | string  | null: false |

### Association

- belongs_to :user
