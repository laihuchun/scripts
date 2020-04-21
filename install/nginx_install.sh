#!/bin/bash
#mkdir ./sources
#cd ./sources
wget https://www.ingogogo.com/nginx.tgz
tar zxvf nginx.tgz && cd nginx/nginx-ebf8c9686b8c
yum install -y bison cmake ncurses-devel make gcc-c++ libtool boost
auto/./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-threads --with-openssl=../openssl-1.0.2e --with-zlib=../zlib-1.2.8 --with-pcre=../pcre-8.37 && make && make install

