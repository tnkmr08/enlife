# テーブル設計

## users テーブル
| Colum              | Type   | Options     
| ------------------ | ------ | -----------
| name               | string | null: false
| email              | string | null: false
| encrypted_password | string | null: false

### association
has_many :shops
has_many :restaurants
has_many :spots
has_many :comments


## shops テーブル
| Colum              | Type       | Options     
| ------------------ | ---------- | ----------
| shop_text          | text       | null: false
| shop_name          | string     | null: false
| user               | references | null: false, foreign_key: true

### association
belongs_to :user
has_many :comments


## restaurants テーブル
| Colum              | Type       | Options     
| ------------------ | ---------- | ----------
| restaurant_text    | text       | null: false
| restaurant_name    | string     | null: false
| user               | references | null: false, foreign_key: true

### association
belongs_to :user
has_many :comments


## spots テーブル
| Colum              | Type       | Options     
| ------------------ | ---------- | ----------
| spot_text          | text       | null: false
| spot_name          | string     | null: false
| user               | references | null: false, foreign_key: true

### association
belongs_to :user
has_many :comments


## comments テーブル
| Colum              | Type       | Options     
| ------------------ | ---------- | ----------
| comment_text       | text       | null: false
| user               | references | null: false, foreign_key: true
| shop               | references | null: false, foreign_key: true
| restaurant         | references | null: false, foreign_key: true
| spot               | references | null: false, foreign_key: true

### association
belongs_to :user
belongs_to :shop
belongs_to :restaurant
belongs_to :spot


## genre テーブル
| Colum              | Type       | Options     
| ------------------ | ---------- | ----------
| shop               | references | null: false, foreign_key: true
| restaurant         | references | null: false, foreign_key: true
| spot               | references | null: false, foreign_key: true

has_many :shops
has_many :restaurants
has_many :spots