# 多网站单实例Nginx PHP-FPM模板

## 简介

包含PHP-FPM的Nginx Docker模板，适用于单实例多网站模式，即一个Docker容器运行单个Nginx同时承载多个网站。使用过LNMP等工具的用户能较快适应该模式。

### 挂载说明

* ```wwwroot```目录会被挂载为```/home/wwwroot```目录。用于存放网站文件。
* ```conf/conf.d```目录会被挂载为```/etc/nginx/conf.d```目录。用于存放分离式网站的配置文件，即单个网站有对应的单个配置文件
* ```conf```目录下其他文件会被挂载到```/etc/nginx```目录下。包含Nginx默认配置和PHP配置。
* 宿主机的```/etc/letsencrypt/live```目录会被挂载到```/etc/letsencrypt/live```。用于存放Let's Encryption签发的证书，可自行更换路径。

## 使用方法

以网站```yourwebsite.com```为例

### 放置网站文件

建议在```wwwroot```下新建域名同名目录，将网站文件放置于该域名目录下。本例即新建```yourwebsite.com```目录，该目录最终在容器内被挂载为```/home/wwwroot/yourwebsite.com```。

### 签发证书（可选）

建议在宿主机使用Let's Encryption签发证书，这样本容器默认挂载Let's Encryption签发证书存放目录到容器内。如果不想使用此方法，可修改```docker-compose.yaml```的挂载配置。

本例即在宿主机使用Let's Encryption签发证书，当前活动证书存放在```/etc/letsencrypt/live/yourwebsite.com```，该目录最终在容器内被挂载为```/etc/letsencrypt/live/yourwebsite.com```

### 添加Nginx配置文件

建议在```conf/conf.d```下新建域名同名配置文件。本例即新建```yourwebsite.com.conf```文件，该文件最终被挂载为```/etc/nginx/conf.d/yourwebsite.com.conf```。

如果要启用PHP，可以直接```include enable-php.conf```。

配置文件的```root```部分应该设置为```/home/wwwroot```目录下。本例为```/home/wwwroot/yourwebsite.com```。

配置文件的SSL证书部分应该设置为挂载目录，默认为```/etc/letsencrypt/live目录下```。本例为```/etc/letsencrypt/live/yourwebsite.com/fullchain.pem```和```/etc/letsencrypt/live/yourwebsite.com/privkey.pem```。

### 运行网站

如果容器内需要访问宿主机的MySQL，应使用```host.docker.internal```这个主机进行访问。

建议使用Docker运行独立的MySQL容器。