FROM bibi21000/janitoo

MAINTAINER bibi21000 <bibi21000@gmail.com>

RUN cat /etc/issue
RUN env
RUN /sbin/ip addr

COPY .coveralls.yml /opt/janitoo/src

WORKDIR /opt/janitoo/src

RUN make -C janitoo travis-deps

RUN /usr/bin/supervisord && make tests-all

RUN make coverage-all && coveralls
