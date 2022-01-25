docker run --net macvlan2904 --privileged \
	-d --name nginx \
	--ip 192.168.0.70 --hostname D-192-168-0-70 \
	-v ${PWD}/conf.d:/etc/nginx/conf.d \
	centos7-nginx