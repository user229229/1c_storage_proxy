# Сервер хранилища 1С 8.3
#
FROM debian:stretch-slim

ENV DIST server64_8_3_20_2290


RUN apt-get update && apt-get install -y \
    apache2 \
	python3 \
	&& rm -rf /var/lib/apt/lists/*

# apache conf
COPY ./1c_httpd.conf /etc/apache2/sites-available/000-default.conf
COPY ./1crep.1ccr /var/www/crs/1crep.1ccr

# 1C repo server
ENV SRV1CV8_REPOSITORY /opt/1C/repository

ADD ./deb/${DIST}.tar.gz /tmp

RUN /tmp/setup-full-*-x86_64.run --mode unattended --enable-components config_storage_server,ws,ru && \
	mkdir -p /var/log/1c/dumps && chmod -R 777 /var/log/1c && \
	rm -rf /tmp/* && \
	rm -rf /var/lib/apt/lists/*


COPY run.sh /
RUN chmod +x /run.sh
RUN mkdir -p ${SRV1CV8_REPOSITORY}
RUN chmod 777 ${SRV1CV8_REPOSITORY}

COPY storage-proxy.py /

VOLUME ${SRV1CV8_REPOSITORY}

EXPOSE 1542 80 8899
ENTRYPOINT ["/run.sh"]
