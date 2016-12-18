

```
$ cat << EOS > Gemfile
source "http://rubygems.org"
gem "rails", "4.2.7.1" # ←ローカルインストールしたいRailsのバージョンを指定。指定しなければ最新版が入る。
EOS

$ bundle install --path vendor/bundle
$ bundle exec rails new rail4-mailer  --skip-spring --skip-turbolinks --skip-test-unit --skip-bundle
$ cd rail4-mailer
$ bundle install --path vendor/bundle
$ bundle exec rake db:migrate
$ bundle exec rails s
  access http://localhost:3000

```

```
$ gibo rails > .gitignore
$ echo '/vendor/bundle' >> .gitignore
```

メーラーの作成
```
$ rails g mailer mail_sender inquiry
create  app/mailers/mail_sender.rb
create    app/views/mail_sender
create    app/views/mail_sender/inquiry.text.erb
create    app/views/mail_sender/inquiry.html.erb
```

config/routes.rb の編集
```
  resource :inquiry, only: [:new, :create]
  get 'inquiry/complete' => 'inquiries#complete'
```

app/controller/inquiries_controller.rb の作成

app/models/inquey.rb  の作成


# See

- http://qiita.com/emadurandal/items/e43c4896be1df60caef0  Rails開発環境の構築（複数バージョン共存可能）

- http://salashibo.com/programminglanguage/rubyonrails/post-556  RubyOnRailsでお問い合わせフォームを作る。

- Basic Sample of Action Mailer with RSpec in Rails4 [https://blog.morizyun.com/posts/action-mailer-rails-rspec-test](https://blog.morizyun.com/posts/action-mailer-rails-rspec-test)

- 正規表現でのメールアドレスチェックは見直すべき  [https://blog.ohgaki.net/redos-must-review-mail-address-validation](https://blog.ohgaki.net/redos-must-review-mail-address-validation)

- Email Address Regular Expression That 99.99% Works [http://emailregex.com/](http://emailregex.com/)

- Rails 4でモデルのバリデーションまとめ [http://ruby-rails.hatenadiary.com/entry/20140724/1406145303](http://ruby-rails.hatenadiary.com/entry/20140724/1406145303)

- simple_formとTwitter bootstrapで作る俺流鉄板Railsアプリ  [http://www.ohmyenter.com/simple_form%E3%81%A8twitter-bootstrap%E3%81%A7%E4%BD%9C%E3%82%8B%E4%BF%BA%E6%B5%81%E9%89%84%E6%9D%BFrails%E3%82%A2%E3%83%97%E3%83%AA%EF%BC%88%E3%81%9D%E3%81%AE%EF%BC%91%EF%BC%89/](http://www.ohmyenter.com/simple_form%E3%81%A8twitter-bootstrap%E3%81%A7%E4%BD%9C%E3%82%8B%E4%BF%BA%E6%B5%81%E9%89%84%E6%9D%BFrails%E3%82%A2%E3%83%97%E3%83%AA%EF%BC%88%E3%81%9D%E3%81%AE%EF%BC%91%EF%BC%89/)
