BUILD_DIR=

centos7-base:		## centos7-base
	docker build -t centos7-base:latest -f ./centos7-base/Dockerfile ./centos7-base

centos7-nm:			## centos7-nm
	docker build -t centos7-nm:latest -f ./centos7-nm/Dockerfile ./centos7-nm

d-build:centos7-nm	## d-build
	echo 1
d-run-d:		## d-run-d
	docker run -d centos7-nm
d-run:		## d-run
	docker run -ti --rm centos7-nm /bin/bash

d-clean:	## d-clean
	docker rmi centos7-nm

c_c:		## clean container
	docker ps -a|awk '{print $1}'|xargs docker rm

c_none:			## clean none
	docker images -a |grep none|awk '{print $3}'|xargs docker rmi

n_:		##
	pipework docker0

.PHONY: help centos7-base centos7-nm
.DEFAULT_GOAL := help

# Ref: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'