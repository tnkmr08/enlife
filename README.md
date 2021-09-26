# アプリケーション名
EnLife   
  
# アプリケーション概要
自分が行った場所で良かったお店やスポットを写真や文章で投稿してユーザーと共有するアプリケーションです。

# 本番環境
URL： https://enlife.herokuapp.com/

テスト用アカウント
メールアドレス： aaa@aaa.com   
パスワード： aaa111

# 制作背景
・外食の際のお店や出掛ける場所をインターネットやSNSで調べて決めることは少なくないと思います。その中で私は、選択肢が多過ぎて決めるのに時間をかけてしまったり、自分の思っていた感じと違うというような経験をしました。  
・SNSの利用率が高い10代後半から30代の人も同じような経験をしているのではないかと考えました。このアプリケーションを通じて、少しでもプライベートの充実に繋がればいいなと思い作成しました。

# DEMO
## ログイン・新規登録画面
[![Image from Gyazo](https://i.gyazo.com/610b79d0ed9c4e78697e166e69214bfd.gif)](https://gyazo.com/610b79d0ed9c4e78697e166e69214bfd)
・ログインか新規登録をしないと、トップページに遷移できないようにしています。
## トップページ
[![Image from Gyazo](https://i.gyazo.com/12b68375eb5c21c8858922233fae37e7.gif)](https://gyazo.com/12b68375eb5c21c8858922233fae37e7)  
・トップページでは、Restaurant(飲食店)、Shop(ショップ)、Spot(スポット)の３つの最新5件の投稿が画像を表示しています。また、それぞれのカテゴリー名をクリックすると各カテゴリー別投稿一覧ページに遷移します。   
・右上には、ユーザー名(ユーザー詳細ページ)・Post(新規投稿)・Logout(ログアウト)のボタンがあります。   
## 新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/205f7c32d211ea4cc9beac436d25681d.jpg)](https://gyazo.com/205f7c32d211ea4cc9beac436d25681d)
・この新規投稿画面では、カテゴリーを選択して、投稿画像とお店やスポット名、そして投稿に関するコメント全てを入力することで共有できます。  
「新規投稿」をクリックするとトップページに遷移します。
## ユーザー詳細画面
[![Image from Gyazo](https://i.gyazo.com/18faee32cbeebc9e60329a73a217cf27.gif)](https://gyazo.com/18faee32cbeebc9e60329a73a217cf27)
・そのユーザーが投稿した画像の一覧が表示されています。そして画像をクリックすると、その画像の詳細画面がモーダルウィンドウで表示されます。新規投稿画面で入力した内容のほかに「編集」や「投稿削除」できるボタンとユーザーからのコメントが追加されています。
## 投稿編集画面
[![Image from Gyazo](https://i.gyazo.com/94eca5e1a727362e58dfbbc0d884d59e.jpg)](https://gyazo.com/94eca5e1a727362e58dfbbc0d884d59e)
・投稿を編集する事ができます。ただし、全ての入力欄を埋めないと更新されません。  
「Post Edit」をクリックするとユーザー詳細ページに遷移します。
## カテゴリー別投稿一覧画面
[![Image from Gyazo](https://i.gyazo.com/a15956d37c45d686f1d743fd62e8bf35.jpg)](https://gyazo.com/a15956d37c45d686f1d743fd62e8bf35)
・カテゴリー別の投稿一覧を見る事ができます。挙動は、ユーザー詳細ページと同じです。

# 工夫したポイント
・トップページの５つずつの投稿にslickを使用してスライド表示させることで情報量を少なくして見栄えを整えました。また、背景画像からどのようなカテゴリーに分けられているのかをわかるようにしました。   
・カテゴリー別投稿一覧ページを作ることで目的に合わせて投稿を見られるようにしました。   
・カテゴリー別投稿一覧ページから投稿詳細画面をモーダルウィンドウで表示させることでブラウザを再読み込みさせずに表示できるようにしました。また、１つの投稿に使うスペースを少なくして、スクロールせずに見られる投稿画像の数を増やしました。

# 使用技術（開発環境）
## バックエンド
ruby, ruby on rails
## フロントエンド
HTML, CSS, JavaScript, JQuery, Ajax
## データベース
MySQL, SequelPro
## アプリケーションサーバー
Heroku
## ソース管理
GitHub, GitHub Desktop
## テスト
RSpec
## エディタ
VSCode

# 課題や今後実装したい機能
・カテゴリー別に表示させる事で目的に沿った投稿内容を閲覧することができますが、気になった投稿と見つけた際に毎回一覧画面から探さないといけないという課題が残りました。このことから、カテゴリーごとに検索機能を設けてキーワードを入れるだけで検索できるようにしたいと思います。

# DB設計
## users テーブル
| Colum              | Type   | Options     |
|--------------------|--------|-------------|
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
### association
・has_many :posts  
・has_many :comments

## posts テーブル
| Colum              | Type       | Options                        |
|--------------------|------------|--------------------------------|
| text               | text       | null: false                    |
| place_name         | string     | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
### association
・belongs_to :user  
・has_many :comments

## comments テーブル
| Colum              | Type       | Options                        |
|--------------------|------------| -------------------------------|
| comment_text       | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| post               | references | null: false, foreign_key: true |

### association
・belongs_to :user  
・belongs_to :post