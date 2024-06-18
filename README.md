# サンプル動作
※ 動作にはgemsディレクトリをカレントディレクトリに配置する必要があります。
```
bundle install
bundle exec ruby exe.rb
```

# 属性の和名を一覧表示
`User.wayaku`
```
ユーザー
User
  ID
  id

  名前
  name

  性別
  gender
    男性
    man
    女性
    woman

  ステータス
  status
    寝ている
    sleeping
    働いている
    working
    謎に包まれている
    mystery

  メール
  email
```

# 属性の英名検索
`User.wayaku('email')`
```

メール

```

# 属性の和名検索
`User.wayaku('メール')`
```

email

```