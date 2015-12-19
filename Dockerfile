FROM bibi21000/janitoo

MAINTAINER bibi21000 <bibi21000@gmail.com>

RUN cat /etc/issue
RUN env
RUN /sbin/ip addr

WORKDIR /opt/janitoo/src

RUN make clone module=janitoo_docker_tests && \
    apt-get clean && \
    [ -d /root/.cache ] && rm -Rf /root/.cache/*

RUN make -C janitoo travis-deps

RUN /usr/bin/supervisord && make tests-all

RUN ls -lisa

#RUN make coverage-all
#RUN cd .coverage && coverage report
RUN make coverage-collect

RUN cp .coverage/.coverage janitoo_docker_tests/ && \
    cd janitoo_docker_tests && \
    export COVERALLS_REPO_TOKEN=3XGlPDJ1miuq8vVeZkjq1PSxyCUnHGBMZ && \
    coveralls

