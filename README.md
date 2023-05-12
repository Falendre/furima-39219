# テーブル設計

### users テーブル

| Column             | Type   | Options                   |
| :----------------- | :----- | :------------------------ |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

#### Association

- has_many :items  
- has_many :orders 

<br>

### items テーブル

| Column           | Type       | Options                        |
| :--------------- | :--------- | :----------------------------- |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| cost_id          | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shopping_day_id | integer    | null: false                    |
| price            | integer    | null: false                    |

#### Association

- belongs_to :user
- has_one :order

<br>

### orders テーブル

| Column     | Type       | Options                        |
| :--------- | :--------- | :----------------------------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

<br>

###  buyersテーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| order              | references | nill: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| town               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| tel                | string     | null: false                    |

#### Association

- belongs_to :order

<br>


