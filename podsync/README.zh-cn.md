# Podsync

Podsync是一个能将YouTube视频转换为播客的应用。

## 使用方法

程序运行后会根据```config.toml```的设置在容器网络内指定端口运行一个Web服务器，提供对容器内```/app/data```目录的浏览。这个目录为生成的播客文件和RSS的存放目录。

*. 第一种使用方法是将容器内的监听端口映射到宿主机，然后直接访问。

以```yoursite.com```域名和监听```6633```端口为例。
1. 修改```docker-compose.yaml```的相关映射设置，使容器内```6633```端口映射到宿主机```6633```端口。

2. 设置```config.toml```中```hostname="https://yoursite.com:6633"```。

3. 运行容器即可通过该地址访问。

*. 第二种是通过一个现有的Nginx容器反代Podsync容器内的服务。**推荐**

需要将Nginx容器和Podsync容器连接到同一个网络。以同一网络```nginx_net```为例：

1. 创建并连接网络

    ```
    # 创建网络
    docker network create nginx_net
    # 连接容器
    docker network connect nginx_net your_nginx_container
    docker network connect nginx_net your_podsync_container
    ```

你也可以通过修改```docker-compose.yaml```进行外部网络连接，这样通过Docker Compose添加容器时会自动接入网络。

2. 修改Nginx配置文件进行反代：

    ```
        ...
        server_name your-site.com;
        ...
        proxy_pass http://podsync:6633/;
        ...
    ```

3. 设置```config.toml```中```hostname="https://yoursite.com"```

4. 先运行Podsync容器，再运行Nginx容器，否则Nginx可能因为找不到podsync主机而报错退出。

5. 运行容器即可通过该地址访问。