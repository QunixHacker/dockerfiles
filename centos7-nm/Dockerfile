FROM centos7-base:latest

RUN yum install -y iproute

ADD run.sh /run.sh

RUN chmod a+x /run.sh

# CMD ['which', "ip"]
