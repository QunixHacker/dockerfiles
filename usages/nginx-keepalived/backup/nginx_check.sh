#! /usr/bin/env bash

# sudo vim /etc/keepalived/nginx_check.sh
# sudo chmod +x /etc/keepalived/nginx_check.sh

NGINX_COUNT=$(ps -C nginx --no-header|wc -l)

if [ $NGINX_COUNT -eq 0]; then
	ps -ef|grep keepalived|awk '{print $2}'|xargs kill
fi