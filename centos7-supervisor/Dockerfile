FROM centos7-py36:latest

RUN pip3 install supervisor && mkdir -p /etc/supervisor.d/
ADD supervisord.conf /etc/supervisord.conf
ADD demo.ini /etc/supervisor.d/
ADD run.sh /run.sh
RUN chmod a+x /run.sh