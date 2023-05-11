# テーブル設計

### users テーブル

| Column             | Type   | Options                   |
| :----------------- | :----- | :------------------------ |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| password           | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

#### Association

- has_many :items  
- has_many :orders 
- belongs_to:buyer

<br>

### items テーブル

| Column           | Type       | Options                        |
| :--------------- | :--------- | :----------------------------- |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | integer    | null: false                    |
| item_status      | integer    | null: false                    |
| cost             | integer    | null: false                    |
| day              | integer    | null: false                    |
| price            | integer    | null: false                    |

#### Association

- belongs_to :user
- has_one :orders

<br>

### order テーブル

| Column     | Type       | Options                        |
| :--------- | :--------- | :----------------------------- |
| user_id    | references | null: false, foreign_key: true |
| items_id   | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :item

<br>

###  buyerテーブル

| Column             | Type    | Options     |
| :----------------- | :------ | :---------- |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| post code          | string  | null: false |
| prefecture         | string  | null: false |
| town               | string  | null: false |
| address            | string  | null: false |
| building_name      | string  |             |
| tel                | string  | null: false |

#### Association

- belongs_to :user

<br>

### curd テーブル

| Column       | Type       | Options                        |
| :----------- | :--------- | :----------------------------- |
| user_id      | references | null: false, foreign_key: true |
| token_id     | string     | null: false                    |
| customer_id  | string     | null: false                    |

#### Association

- belongs_to :user
