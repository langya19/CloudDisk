#!/bin/bash
# 拷贝nginx的配置文件nginx.conf到默认目录，可通过-c命令指定
# echo ============= Copy nginx.conf =============
# sudo mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.old
# sudo cp ./conf/nginx.conf /usr/local/nginx/conf
# echo

# 拷贝nginx的fastdfs插件配置文件mod_fastdfs.conf到默认目录
echo ============= Copy mod_fastdfs.conf =============
sudo mv /etc/fdfs/mod_fastdfs.conf /etc/fdfs/mod_fastdfs.conf.old
sudo cp ./conf/mod_fastdfs.conf /etc/fdfs/
echo

echo ============= fastdfs ==============
# 关闭已启动的 tracker 和 storage
./fastdfs.sh stop
# 启动 tracker 和 storage
./fastdfs.sh all
# 重启所有的 cgi程序
echo
echo ============= fastCGI ==============
./fcgi.sh
# 关闭nginx
echo
echo ============= nginx ==============
./nginx.sh stop
# 启动nginx
./nginx.sh start
# 关闭redis
echo
echo ============= redis ==============
./redis.sh stop
# 启动redis
./redis.sh start
