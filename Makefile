BUILD_DIR=
DOCKER_RUN=docker run --net macvlan2904 --privileged
DOCKER_BUILD=docker build
DOCKER_BUILD_N=$(DOCKER_BUILD) --network host
DOCKER_BUILD_P=$(DOCKER_BUILD) --build-arg http_proxy=http://192.168.0.10:41091
d-build:		## d-build
	$(DOCKER_BUILD_N) -t $(BUILD_DIR):latest -f ./$(BUILD_DIR)/Dockerfile ./$(BUILD_DIR)

d-run-d:		## d-run-d
	$(DOCKER_RUN) -d --name tmpd \
	--ip 192.168.0.61 --hostname D-192-168-0-61 \
	$(IMG)

d-run-d2:		## d-run-d2
	$(DOCKER_RUN) -d --name tmpd2 \
	--ip 192.168.0.62 --hostname D-192-168-0-62\
	$(IMG)

d-run-s:		## test
	$(DOCKER_RUN) -it --rm --name tmp \
	--ip 192.168.0.60 --hostname D-192-168-0-60 \
	centos7-py36 /bin/bash

c_n:		## network
	docker network create -d macvlan --subnet=192.168.126.0/24 --gateway=192.168.126.254 -o parent=eth0 MACNET;

gfw_proxy:			## ubuntu2004
	$(DOCKER_RUN) -d --name ubuntu2004 \
	--ip 192.168.0.10 --hostname D-192-168-0-10 \
	-e VNC_PASSWORD=q1w2e3r4 \
	dorowu/ubuntu-desktop-lxde-vnc:bionic

dag: 			## image dag
	pushd docs && dot -Tpng -o h.png h.dot

.PHONY: help centos7-base centos7-base-util centos7-py36 centos7-codeserver
.DEFAULT_GOAL := help

# Ref: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'