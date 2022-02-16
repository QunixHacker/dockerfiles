BUILD_DIR=
DOCKER_RUN=docker run --net macvlan2904 --privileged
DOCKER_BUILD=docker build
DOCKER_BUILD_N=$(DOCKER_BUILD) --network host
DOCKER_BUILD_P=$(DOCKER_BUILD_N) --build-arg HTTP_PROXY=http://192.168.0.101:41091 --build-arg HTTPS_PROXY=https://192.168.0.101:41091
build:		## d-build
	$(DOCKER_BUILD_P) -t $(BUILD_DIR):latest -f ./$(BUILD_DIR)/Dockerfile ./$(BUILD_DIR)

build_base:		## build-base
	make build BUILD_DIR=centos7-base
	make build BUILD_DIR=centos7-base-util

build_dev:build_base	## build dev
	make build BUILD_DIR=centos7-gcc
	make build BUILD_DIR=centos7-go
	make build BUILD_DIR=centos7-lua
	make build BUILD_DIR=centos7-py36
	make build BUILD_DIR=centos7-codeserver

build_ops:build_base		## build-all
	make build BUILD_DIR=centos7-nginx
	make build BUILD_DIR=centos7-nginx-keepalived
	make build BUILD_DIR=centos7-py36
	make build BUILD_DIR=centos7-supervisor

run_up:		## make run_up SUBD=nginx-keepalived
	pushd usage/${SUBD} && docker-compose up -d

run_it:		## make run_it SUBD=go
	pushd usages/${SUBD} && docker-compose run --rm dev

run_go_s:	## server
	pushd usages/go && docker-compose run --rm dev

run_go_c:	## client
	pushd usages/go && docker-compose run --rm client

c_n:		## network
	docker network create -d macvlan --subnet=192.168.126.0/24 --gateway=192.168.126.254 -o parent=eth0 MACNET;

gfw_proxy:			## ubuntu2004
	$(DOCKER_RUN) -d --name ubuntu2004 \
	--ip 192.168.0.10 --hostname D-192-168-0-10 \
	-e VNC_PASSWORD=q1w2e3r4 \
	dorowu/ubuntu-desktop-lxde-vnc:bionic

dag: 			## image dag
	pushd docs && dot -Tpng -o h.png h.dot

dag_go:			## golang interface
	pushd docs && dot -Tpng -o go_interface.png go_interface.dot

dag_lab:		## 小型实验网络
	pushd docs && dot -Tpng -o lab.network.png lab.network.dot

.PHONY: help centos7-base centos7-base-util centos7-py36 centos7-codeserver
.DEFAULT_GOAL := help

# Ref: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'