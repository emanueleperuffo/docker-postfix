FROM emanueleperuffo/baseimage-debian:latest
MAINTAINER Emanuele Peruffo <info@emanueleperuffo.com>

ENV HOME /root
ADD . /build

ENV DOVECOT_HOST dovecot.example.com
ENV LDAP_HOST ldap.example.com
ENV SPAMD_HOST spamd.example.com
ENV CLAMD_HOST clamsmtp.example.com
ENV POSTGREY_HOST postgrey.example.com

ENV MYDOMAIN example.com
ENV MYHOSTNAME postfix.example.com
ENV MYNETWORKS 127.0.0.0/32
ENV LDAP_BASE_DN dc=example,dc=com
ENV LDAP_BIND_DN cn=postfix,dc=example,dc=com
ENV LDAP_PASS pass

RUN /build/prepare.sh && \
	/build/services.sh && \
	/build/cleanup.sh

# /etc/ssl/postfix
VOLUME ["/var/spool/postfix"]

EXPOSE 25 587 10026

CMD ["/sbin/my_init"]
