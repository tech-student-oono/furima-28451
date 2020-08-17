# README
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :buy

## items テーブル

| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| users_id    | string | null: false |
| name        | string | null: false |
| image       | string | null: false |
| explanation | string | null: false |
| price       | string | null: false |
| delivery    | string | null: false |

### Association

- belongs_to :users
- has_many :buy

## buy テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| users_id     | string | null: false |
| items_id     | string | null: false |
| credit_card  | string | null: false |

### Association

- belongs_to :users
- belongs_to :items
- has_one : delivery_address

## delivery_address テーブル

| address      | string | null: false |
| phone_number | string | null: false |
| postal_code | string | null: false |

### Association

- belongs_to :buy