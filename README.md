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
 
| Column             | Type      | Options                      |
| ------------------ | --------- | ---------------------------- |
| name               | string    | null: false                  |
| price              |integer    | null: false                  |
| category_id        |integer    | null: false                  |
| status_id          |integer    | null: false                  |
| fee_id             |integer    | null: false                  |
| prefecture_id      |integer    | null: false                  |
| shipment_id        |integer    | null: false                  |
| item               |references | null: false foreign_key: true|
| user               |references | null: false foreign_key: true|


### Association

- belongs_to :user
- has_one :management

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| house_code    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_address | string     | null: false                    |
| house_name    | string     |                                |
| telephone     | string     | null: false                    |
| management    | references | null: false, foreign_key: true |
 
### Association
- belongs_to :management

## management テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :purchase