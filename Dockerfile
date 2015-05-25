FROM emanueleperuffo/baseimage-debian:latest
MAINTAINER Emanuele Peruffo <info@emanueleperuffo.com>

ENV HOME /root
ADD . /build

ENV MYDOMAIN example.com
ENV MYHOSTNAME mail.example.com
ENV MYNETWORKS 127.0.0.0/32
ENV DOVECOT_HOST dovecot.example.com
ENV LDAP_HOST ldap.example.com
ENV LDAP_SEARCH_BASE dc=example,dc=com
ENV SSL_CA postfix.ca.pem
ENV SSL_CERT postfix.cert.pem
ENV SSL_KEY postfix.key.pem

RUN /build/prepare.sh && \
	/build/services.sh && \
	/build/cleanup.sh

VOLUME ["/etc/postfix", "/var/spool/postfix"]

EXPOSE 5432

CMD ["/sbin/my_init"]
