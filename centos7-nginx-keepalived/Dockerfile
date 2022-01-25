FROM centos7-nginx:latest

ADD run.sh /run.sh
RUN yum install -y keepalived && \
	keepalived -v
# v1.3.5

RUN chmod a+x /run.sh