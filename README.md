# README
# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| --------   | ------  | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| name       | string  | null: false |
| birth_date | integer | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column   | Type       | Options     |
| -------- | ---------  | ----------- |
| users_id | references | null: false, foreign_key: true |
| name     | string     | null: false |
| image    | string     | null: false |
| text     | string     | null: false |
| price    | integer    | null: false |
| delivery | string     | null: false |
| comments | string     | null: false |

### Association

- belongs_to :user
- has_many :buys

## commentsテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| users_id | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |
| text     | string     | null: false |

### Association

- belongs_to :user
- belomgs_to :item

## buys テーブル

| Column       | Type       | Options     |
| --------     | ---------- | ----------- |
| users_id     | references | null: false, foreign_key: true |
| items_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : delivery_address

## delivery_address テーブル

| address      | string  | null: false |
| phone_number | integer | null: false |
| postal_code  | integer | null: false |
| fee          | integer | null: false |
| area         | integer | null: false |
| time         | integer | null: false |

### Association

- belongs_to :buy