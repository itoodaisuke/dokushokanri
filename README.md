# 読書管理

パーソナル読書管理サイト。

### 必要環境

ruby2.0.0
rails4.0

### インストール

Mac OS X

$ brew install qt
$ gem install bundler
$ git clone git@github.com:itoodaisuke/dokushokanri.git
$ cd dokushokanri
$ bundle
$ rake db:setup
$ rake secret
$ rake amzn:generate
$ rails s
$ open http://localhost:3000

検索機能はAmazonAPIを使用するので、amzn.yamlは適宜修正すること。
