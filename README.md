

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
