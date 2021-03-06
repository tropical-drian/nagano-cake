# ECサイト 「Nagano Cake」
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。<br>
DMMWEBCAMPのチーム開発で作成したアプリです。<br>
作成開始日:6/12 作成完了日:6/27

# 設計
## ER図
![ER図](https://user-images.githubusercontent.com/81765199/123536917-f19af600-d767-11eb-9f13-24328aeacb04.jpg)
## アプリケーション詳細設計
![アプリケーション詳細設計書](https://user-images.githubusercontent.com/81765199/123537735-e21dac00-d76b-11eb-9d98-839d22cbba2d.jpg)
# 実装機能
## 会員側
1. 商品一覧の閲覧（ログイン不要)
2. 会員の新規登録・ログイン・ログアウト機能
3. 会員情報の編集・退会機能
4. 配送先登録・編集機能
5. カート機能・カート内商品の個数変更・削除機能
6. カート内商品の注文・詳細確認画面

## 管理者側
1. メールアドレスとパスワードでログイン※新規登録不可
2. 商品の新規追加、詳細編集、販売ステータスの切り替え
3. 商品検索機能（商品名・商品説明・商品ID・販売ステータス）
4. ジャンルの新規追加・ジャンル名変更
5. 会員情報の閲覧、編集、退会状態への切り替え
6. 注文ステータスと商品の製作ステータスの切り替え

# 開発環境
Ruby on Rails rails 5.2.6

# 開発者
・[おがちゃん](https://github.com/AZUSA5296)　・[きのけん](https://github.com/kinoshitaken123)　・[せやさん](https://github.com/seiya1911)　・[たけだっち](https://github.com/yunhao17)
