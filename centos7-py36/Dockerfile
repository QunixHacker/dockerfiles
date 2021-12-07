FROM centos7-base-util:latest

RUN yum install -y python3 && \
    yum clean all

ADD pip.conf /root/.pip/pip.conf

RUN pip3 install --upgrade pip || true  && \
    python3 -m pip --version