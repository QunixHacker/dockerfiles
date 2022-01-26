FROM centos7-gcc:latest

# ENV GO_VERSION 1.17.6
ENV GO_ROOT /usr/local/go
ENV GO_PATH /root/go

RUN curl -o tmp.tar.gz https://dl.google.com/go/go1.17.6.linux-amd64.tar.gz && \
	tar -C /usr/local -zxf tmp.tar.gz && unlink tmp.tar.gz && \
	echo "export PATH=\$PATH:$GO_ROOT/bin:$GO_PATH/bin" >> /root/.bashrc && \
    source /root/.bashrc

RUN ${GO_ROOT}/bin/go env -w GO111MODULE=on && \
	${GO_ROOT}/bin/go env -w GOPROXY=https://goproxy.cn,direct