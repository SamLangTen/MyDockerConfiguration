# Docker WordPress NGINX SSL MySQL

原仓库信息参见README.md

## 使用指南

1. 将证书和私钥放置于nginx/ssl/，分别改名为my_wpress_site.cert和my_wpress_site.key。
2. 修改nginx/conf.d/default.conf的server_name为自己的域名。
3. 运行以下命令，WordPress数据目录会放置于data/wordpress下，可以安装插件和主题。
```
    docker-compose up
```
4. 运行以下命令，关闭Container：
```
    docker-compose down
```

## 备份数据

1. 运行./tool/db_export.sh，数据库会导出至./data/sql
2. WordPress数据位于./data/wordpress下

## 还原数据

1. 将备份的sql文件放置于./data/sql/sql_import.sql
2. 运行./tool/db_import.sh
3. 将WordPress数据放置于./data/wordpress下