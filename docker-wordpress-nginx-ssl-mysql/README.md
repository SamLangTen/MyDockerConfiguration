# Docker WordPress NGINX SSL MySQL

## Usage

1. copy your certs to `data/nginx/ssl/my_wpress_site.cert` and your private key to `data/nginx/ssl/my_wpress_site.key`.
2. edit `server_name` in `data/nginx/conf.d/default.conf` with your domain.
3. execute following command:
```
    docker-compose up
```
4. `plugin` and `theme` folders will be mapped to `data/wordpress/plugins` and `data/wordpress/themes`.
5. close and remove container with following command:
```
    docker-compose down
```

## Backup

1. execute`tool/db_export.sh` to dump database to `data/sql/`.
2. backup plugins and themes under the folder `data/wordpress`.

## Restore

1. copy database dump file to `data/sql/sql_import.sql`.
2. execute `tool/db_import.sh`
3. copy installed plugins and themes to `data/wordpress/plugins` and `data/wordpress/themes`.
