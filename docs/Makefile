dot:
	pushd graph && dot -Tpng -o $(FNAME).png $(FNAME).dot

dag_image:
	make dot FNAME=dag_image

dag_go:		##
	make dot FNAME=go_interface

dag_lab:	## 小型实验网络
	make dot FNAME=lab.network

.PHONY : help
.DEFAULT_GOAL := help

# Ref: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
