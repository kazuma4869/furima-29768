# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_name1| string | null: false |
| last_name2 | string | null: false |
| birth_date | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| price              |integer | null: false |
| category_id        |integer | null: false |
| status_id          |integer | null: false |
| fee_id             |integer | null: false |
| prefecture_id      |integer | null: false |
| shipment_id        |integer | null: false |


### Association

- belongs_to :users
- has_one :managements

## purchases テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| card_number   |integer | null: false |
| limited_date  |integer | null: false |
| house_code    |integer | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| house_address | string | null: false |
| house_name    | string |             |
| telephone     | integer| null: false |
 
### Association

- belongs_to :items
- belongs_to :users

## management テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| items  | references | null: false, foreign_key: true |
| users  | references | null: false, foreign_key: true |

### Association
- belongs_to :items