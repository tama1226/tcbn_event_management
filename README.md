*タチバナボウル　予約管理システム（tcbn_event_management）*
---

*概要*
---
タチバナボウル（弊社）でレーンの予約をする際に、お客様自身でレーンの空き状況の確認が可能  
また、レーンの予約申し込みを本アプリで行うことができる  
弊社のスタッフもペーパーレスで予約の管理をすることができる  

*開発環境*
---
言語・ミドルウェアのバージョン情報

・Ruby 2.5.1  
・Ruby on Rails 5.2.3  
・postgreSQL 11.3  

*機能一覧*
---
 - [ ] ログイン機能  
 - [ ] ユーザー登録機能  
   - [ ] 氏名・メールアドレス・パスワードが必須  
 - [ ] パスワード再設定機能  
  
 - [ ] イベント（予約・大会）一覧機能    
 - [ ] イベント（予約・大会）登録機能  
 - [ ] イベント（予約・大会）詳細機能  
 - [ ] イベント（予約・大会）編集機能 
 - [ ] イベント（予約・大会）削除機能  
   - [ ] 登録・編集・削除に関しては、管理者ユーザー（スタッフ）しか行えない  
 - [ ] イベント（予約・大会）の検索機能  
   - [ ] イベント名・日時で検索が可能  
 - [ ] カレンダー機能  
   - [ ] イベント一覧をカレンダー形式で表示  
  
 - [ ] コメント機能  
   - [ ] 管理者ユーザーは、イベントの詳細に関してコメントができる
   - [ ] コメントに投稿ユーザー名が表示される
  
 - [ ] 管理者機能
   - [ ] ユーザー・イベント・コメントなど紐づいているデータの管理ができる
   - [ ] 登録・編集・削除に関しては、管理者ユーザー（スタッフ）しか行えない  

 - [ ] イベント予約機能  
   - [ ] ユーザーは予約お問い合わせページから、予約申し込みができる  
   - [ ] 予約申し込みがあると、弊社にメールで通知が届く  


*カタログ設計*
---
https://docs.google.com/spreadsheets/d/1IS8E5OrzzpLvDXdZKI_ssE_jK2RksbkbcjrD38aSlyI/edit#gid=1209233239

*テーブル定義*
---
https://docs.google.com/spreadsheets/d/1IS8E5OrzzpLvDXdZKI_ssE_jK2RksbkbcjrD38aSlyI/edit#gid=841367409

*ER図*
---
https://docs.google.com/spreadsheets/d/1IS8E5OrzzpLvDXdZKI_ssE_jK2RksbkbcjrD38aSlyI/edit#gid=2112437644

*画面遷移図*
---
https://docs.google.com/spreadsheets/d/1IS8E5OrzzpLvDXdZKI_ssE_jK2RksbkbcjrD38aSlyI/edit#gid=1209597546

*ワイヤーフレーム*
---
https://docs.google.com/spreadsheets/d/1IS8E5OrzzpLvDXdZKI_ssE_jK2RksbkbcjrD38aSlyI/edit#gid=1090802416

*使用予定gem*
---
・device  
・carrierwave  
・mini_magick  
・ransack  
・kaminari  
・simple_calender  
・rails_admin  
・cancancan  
・simple_from  
