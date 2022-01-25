FROM centos7-py36:latest

ADD run.sh /run.sh

# /etc/nginx/proxy.conf
# /etc/nginx/conf.d/
# 1.20.2
RUN rpm -Uvh https://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
    yum install -y nginx && \
    nginx -v && \
    chmod a+x run.sh

