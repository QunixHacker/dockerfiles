#! /usr/bin/env bash

# sudo vim /etc/keepalived/nginx_check.sh
# sudo chmod +x /etc/keepalived/nginx_check.sh

NGINX_COUNT=$(ps -C nginx --no-header|wc -l)

if [ $NGINX_COUNT -eq 0]; then
	pkill keepalived
fi