FROM centos7-py36:latest

RUN yum install -y centos-release-scl-rh && \
	yum install -y devtoolset-8-build \
		devtoolset-8-make \
		devtoolset-8-gdb \
		devtoolset-8-gcc \
		devtoolset-8-gcc-c++ \
		devtoolset-8-gcc-gdb-plugin \
		devtoolset-8-perftools \
		devtoolset-8-strace && \
    yum clean all && \
    echo "source /opt/rh/devtoolset-8/enable" >> /etc/profile && \
    source /opt/rh/devtoolset-8/enable
# RUN yum install -y gcc gcc-c++ make cmake gdb && \
#    yum clean all