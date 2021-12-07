BUILD_DIR=
d-build:		## d-build
	docker build -t $(BUILD_DIR):latest -f ./$(BUILD_DIR)/Dockerfile ./$(BUILD_DIR)

d-run-d:		## d-run-d
	docker run -d \
	--net MACNET \
	--ip 192.168.126.66 \
	--name codeserver \
	--env PASSWORD="somepassword2set" \
	$(BUILD_DIR)

d-run:		## d-run
	docker run -ti --rm $(BUILD_DIR) /bin/bash --ip

d-clean:	## d-clean
	docker rmi centos7-nm

c_c:		## clean container
	docker ps -a|awk '{print $1}'|xargs docker rm

c_none:			## clean none
	docker images -a |grep none|awk '{print $3}'|xargs docker rmi

c_n:		## network
	docker network create -d macvlan --subnet=192.168.126.0/24 --gateway=192.168.126.254 -o parent=eth0 MACNET;

.PHONY: help centos7-base centos7-base-util centos7-py36 centos7-codeserver
.DEFAULT_GOAL := help

# Ref: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'