FROM bibi21000/janitoo

MAINTAINER bibi21000 <bibi21000@gmail.com>

RUN cat /etc/issue
RUN env
RUN /sbin/ip addr

RUN mkdir /opt/janitoo/src/janitoo_docker_tests/

ADD . /opt/janitoo/src/janitoo_docker_tests

RUN date +'%Y/%m/%d %H:%M:%S'

WORKDIR /opt/janitoo/src

#Only for tests
RUN make clone module=janitoo_postgresql && \
    make clone module=janitoo_postgresql_client && \
    make docker-inst module=janitoo_postgresql && \
    apt-get clean && \
    rm -Rf /root/.cache/* 2>/dev/null||true && \
    rm -Rf /tmp/* 2>/dev/null||true

RUN make clone module=janitoo_db_full && \
    apt-get clean && \
    rm -Rf /root/.cache/* 2>/dev/null||true && \
    rm -Rf /tmp/* 2>/dev/null||true

RUN /usr/bin/supervisord -c /etc/supervisor/supervisord-tests.conf && \
    sleep 15 && \
    make tests-all

RUN /usr/bin/supervisord -c /etc/supervisor/supervisord-tests.conf && \
    sleep 15 && \
    cd janitoo_manager && \
    make docker-test

RUN date +'%Y/%m/%d %H:%M:%S'
RUN df -h
RUN ls -lisa

RUN make coverage-all

RUN cp .coverage/.coverage janitoo_docker_tests/ && \
    cd janitoo_docker_tests && \
    export COVERALLS_REPO_TOKEN=3XGlPDJ1miuq8vVeZkjq1PSxyCUnHGBMZ && \
    coveralls

RUN make coverage-check

#RUN make uninstall-all && \
#    make uninstall-all && \
#    make install-all

VOLUME ["/root/.ssh/", "/etc/nginx/conf.d/", "/var/log", "/etc/mosquitto/", "/var/lib/mosquitto/", "/etc/supervisor/", "/opt/janitoo/home/", "/opt/janitoo/etc/", "/opt/janitoo/src/"]

EXPOSE 22 1883 5005 8080 8085 8086 9001

CMD ["/root/auto.sh"]
