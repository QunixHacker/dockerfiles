FROM centos7-gcc:latest

ENV LUA_VERSION 5.4.3

RUN yum install -y readline-devel && \
	curl -R -O http://www.lua.org/ftp/lua-$LUA_VERSION.tar.gz && \
	tar zxf lua-$LUA_VERSION.tar.gz && \
	cd lua-$LUA_VERSION && \
	make linux test && \
	make install