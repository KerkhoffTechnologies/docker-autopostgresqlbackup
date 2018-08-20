FROM alpine:latest
MAINTAINER Richard Clark <richard@kerkhofftech.ca>

# Gzip (the real one, not from BusyBox) is needed for autopostgresqlbackup
# Rsync is needed for BackupPC
RUN apk add --no-cache openssh bash postgresql-client gzip rsync && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ daemontools

COPY sshd_config /etc/ssh/sshd_config
COPY autopostgresqlbackup /usr/local/bin/
COPY backup-postgresql /usr/local/bin/
COPY configure-autopostgresqlbackup /usr/local/bin/
RUN chmod +rx /usr/local/bin/*
COPY sshd-entrypoint.sh /
RUN chmod +rx /sshd-entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/sshd-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-De"]
