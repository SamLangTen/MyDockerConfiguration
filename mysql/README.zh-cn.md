# MySQL容器

#建议使用Docker运行独立的MySQL容器，并创建独立的Docker网络连接MySQL、php-fpm和Nginx。本例中新建了一个名为```local-mysql```的MySQL容器，并创建用于连接该MySQL容器的桥接网络```mysql_net```：

```
docker network create mysql_net
docker run --name local-mysql --network mysql_net --env MYSQL_ROOT_PASSWORD=your_password mysql
```

之后可以使用```docker network connect mysql_net <your container>```将需要访问MySQL服务的容器连接到```mysql_net```网络，此时可以使用```local-mysql```主机名连接MySQL服务器。

如果使用Docker Compose，可以直接在```docker-compose.yaml```调用外部网络。