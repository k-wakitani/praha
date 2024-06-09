## Dockerを使ってMySQLを立ち上げる

```
docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=my-secret-pw -d -p 3307:3306 mysql:latest
```

ここでは，ホストの3307にマッピングしている（デフォルトは，3306)


## DBeaverを起動

- DatabaseメニューからNew Database Connectionを選ぶ
- MySQLを選ぶ
- Host: localhost
- port: 3307
- Database: mysql
- Username: root
- Password: my-secret-pw

Public Key Retrieval is not allowedというエラーが生じたため，Driver SettingsのDriver propertiesで，Add new propertiesを選択し，allowPublicKeyRetrieval: trueを追加
