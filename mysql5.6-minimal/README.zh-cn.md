# 适合小内存机器运行的MySQL 5.6容器

#建议使用Docker运行独立的MySQL容器，并创建独立的Docker网络连接MySQL、php-fpm和Nginx。本例中新建了一个名为```local-mysql```的MySQL容器，并创建用于连接该MySQL容器的桥接网络```mysql_net```：

```
docker network create mysql_net
docker-compose up
```

之后可以使用```docker network connect mysql_net <your container>```将需要访问MySQL服务的容器连接到```mysql_net```网络，此时可以使用```local-mysql```主机名连接MySQL服务器。如果使用Docker Compose，可以直接在```docker-compose.yaml```调用外部网络。

本Docker Compose使用了```MYSQL_RANDOM_ROOT_PASSWORD=yes```环境变量用于第一次运行时随机生成root账户密码并输出到日志中。因此第一次运行```docker-compose up```请不要让其在后台运行。即使用```docker-compose up```而不是```docker-compose up -d```；或直接使用```docker-compose logs```命令查看日志。