FROM bibi21000/janitoo

MAINTAINER bibi21000 <bibi21000@gmail.com>

RUN cat /etc/issue
RUN env
RUN /sbin/ip addr

COPY .coveralls.yml /opt/janitoo/src/.coveralls.yml

WORKDIR /opt/janitoo/src

RUN make -C janitoo travis-deps

RUN /usr/bin/supervisord && make tests-all

RUN ls -lisa

RUN make coverage-all

RUN COVERALLS_REPO_TOKEN=3XGlPDJ1miuq8vVeZkjq1PSxyCUnHGBMZ coveralls || exit 0

