FROM ubuntu:22.04
LABEL MAINTAINER="rumosky@163.com"
VOLUME /opt/alist/data/
WORKDIR /opt/alist/
COPY ./alist /opt/alist/
RUN chmod +x /opt/alist/alist
ENV PUID=0 PGID=0 UMASK=022
EXPOSE 5244
ENTRYPOINT ["/bin/bash","-c","chown -R ${PUID}:${PGID} /opt/alist/ && umask ${UMASK} && /opt/alist/alist server --no-prefix"]