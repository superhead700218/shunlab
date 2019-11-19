#!/bin/bash
mkdir /soft
cd /soft
wget -c http://nginx.org/download/nginx-1.14.0.tar.gz  #这里需要根据自己的情况修改这个URL
tar -zxvf nginx-1.14.0.tar.gz  #解压
cd nginx-1.14.0/
yum -y install gcc-c++  pcre-devel zlib-devel openssl-devel   #安装依赖，主要是安装这些，而接下来的三步则是编译安装必须执行的，其中prefix选项是指安装位置
./configure --prefix=/usr/local/nginx  --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf
--pid-path=/usr/local/nginx/nginx.pid
--with-http_ssl_module
 #因为是直接使用yum安装好了pcre-devel 和zlib-devel以及openssl-devel，所以这里可以省掉--with-pcre=/opt/app/openet/oetal1/chenhe/pcre-8.37
--with-zlib=/opt/app/openet/oetal1/chenhe/zlib-1.2.8
--with-openssl=/opt/app/openet/oetal1/chenhe/openssl-1.0.1t
make
make install
cd /usr/local/nginx/
./nginx    #启动服务，现在访问localhost就能看到nginx的欢迎界面了
systemctl stop firewalld #保险起见，关闭防火墙
systemctl disable firewalld 
systemctl start nginx
