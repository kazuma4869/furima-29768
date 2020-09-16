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
| first name | string | null: false |
| last name  | string | null: false |
| first name1| string | null: false |
| last name2 | string | null: false |
| birth year | integer| null: false |
| birth month| integer| null: false |
| birth day  | integer| null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| images           |  text  | null: false |
| price            |integer | null: false |
| category         | string | null: false |
| status           | string | null: false |
| fee              |integer | null: false |
| prefecture       | string | null: false |
| date of shipment |datetime| null: false |


### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| info   |integer | null: false |
| limit1 |integer | null: false |
| limit2 |integer | null: false |
| code   |integer | null: false |
| address|integer | null: false |
| prefect| string | null: false |
| city   | string | null: false |
| house  | string | null: false |
| h-name | string |             |
| tel_num| integer| null: false |
 
### Association

- belongs_to :items
- belongs_to :users

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| comment| string     |                                |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items