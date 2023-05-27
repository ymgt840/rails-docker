# rails-docker
# 実行方法
```bash
# rails作成
$ docker-compose run web rails new . --force --database=mysql
# build
$ docker-compose up -d
# db作成
$ docker-compose run web rails db:create

# rails 表示
http://localhost:3000/
```

# trouble shoot
## mysql dbが作成されない
```
docker-compose run web rails db:create
Creating network "rails_docker_default" with the default driver
Creating rails_docker_db_1 ... done
Creating rails_docker_web_run ... done
/usr/local/lib/ruby/2.7.0/net/protocol.rb:66: warning: already initialized constant Net::ProtocRetryError
/usr/local/bundle/gems/net-protocol-0.2.1/lib/net/protocol.rb:68: warning: previous definition of ProtocRetryError was here
/usr/local/lib/ruby/2.7.0/net/protocol.rb:206: warning: already initialized constant Net::BufferedIO::BUFSIZE
/usr/local/bundle/gems/net-protocol-0.2.1/lib/net/protocol.rb:214: warning: previous definition of BUFSIZE was here
/usr/local/lib/ruby/2.7.0/net/protocol.rb:503: warning: already initialized constant Net::NetPrivate::Socket
/usr/local/bundle/gems/net-protocol-0.2.1/lib/net/protocol.rb:541: warning: previous definition of Socket was here
Running via Spring preloader in process 20
Unknown MySQL server host 'db' (-2)
Couldn't create 'app_development' database. Please check your configuration.
rake aborted!
ActiveRecord::ConnectionNotEstablished: Unknown MySQL server host 'db' (-2)
/usr/local/bundle/gems/activerecord-6.1.7.3/lib/active_record/connection_adapt
```
## 対応
### 解決
- /src/db/mysql_dataをフォルダごと消す
- docker-compose down
- docker-compose up
- docker-compose run web rails db:create 

### 効果があったか微妙だがやったこと
/etc/wsl.confにマウントオプションを追加する。
https://qiita.com/n-jun-k2/items/f8f36cebc7312df8bc31


