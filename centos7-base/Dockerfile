FROM centos:7.9.2009

MAINTAINER jianqiang.zhao <546761972@qq.com>

ENV TZ "Asia/Shanghai"

RUN yum update -y && \
    yum install -y which openssh-server && \
    sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd && \
    yum clean all

ADD authorized_keys /root/.ssh/authorized_keys
ADD *.sh /

RUN chmod -R 600 /root/.ssh/authorized_keys && \
    chmod a+x /run.sh && \
    chmod a+x /run_sshd.sh

EXPOSE 22

CMD ["sh", "-c", "/run.sh"]
