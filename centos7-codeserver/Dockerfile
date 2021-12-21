FROM centos7-py36:latest

# ADD https://github.com/cdr/code-server/releases/download/v3.12.0/code-server-3.12.0-linux-amd64.tar.gz code-server-3.12.0-linux-amd64.tar.gz
ADD code-server-3.12.0-linux-amd64.tar.gz /opt
ADD run.sh /run.sh

RUN chmod a+x /run.sh

EXPOSE 80
