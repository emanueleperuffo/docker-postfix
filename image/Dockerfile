FROM emanueleperuffo/baseimage-debian:latest
MAINTAINER Emanuele Peruffo <info@emanueleperuffo.com>

ENV HOME /root
ADD . /build

ENV DOVECOT_HOST dovecot.example.com
ENV SLAPD_HOST ldap.example.com
ENV SPAMD_HOST spamd.example.com
ENV CLAMD_HOST clamsmtp.example.com
ENV POSTGREY_HOST postgrey.example.com

ENV MYDOMAIN example.com
ENV MYHOSTNAME mail.example.com
ENV MYNETWORKS 127.0.0.0/32
ENV SLAPD_SEARCH_BASE dc=example,dc=com
ENV SLAPD_DN cn=postfix,dc=example,dc=com
ENV SLAPD_DNPASS pass

RUN /build/prepare.sh && \
	/build/services.sh && \
	/build/cleanup.sh

VOLUME ["/etc/postfix", "/var/spool/postfix", "/etc/ssl/postfix"]

EXPOSE 25 587 10026

CMD ["/sbin/my_init"]
