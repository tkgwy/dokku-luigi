FROM phusion/baseimage:0.9.16

CMD ["/sbin/my_init"]

RUN apt-get update && \
  apt-get install -y libmysqlclient-dev build-essential python python-dev python-pip

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir /etc/luigi
ADD client.cfg /etc/luigi/client.cfg

RUN mkdir /var/log/luigid
ADD logrotate.cfg /etc/logrotate.d/luigid
VOLUME /var/log/luigid

RUN mkdir /etc/service/luigid
ADD luigid.sh /etc/service/luigid/run
EXPOSE 5000

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
