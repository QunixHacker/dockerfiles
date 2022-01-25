FROM centos7-py36:latest

ADD epel.repo /etc/yum.repos.d/

RUN yum install -y centos-release-scl-rh && \
	yum install -y devtoolset-8 cmake3 rsync && \
    yum clean all && \
    echo "source /opt/rh/devtoolset-8/enable" >> /etc/profile && \
    echo "source /opt/rh/devtoolset-8/enable" >> /root/.bashrc && \
    ln -s /usr/bin/cmake3 /usr/bin/cmake

ADD run.sh /run.sh
RUN chmod a+x /run.sh