#!/bin/bash
set -e
source /build/buildconfig
set -x

## Installing postfix
$minimal_apt_get_install postfix postfix-ldap

## Setting up posfix service
mkdir /etc/service/postfix
cp /build/runit/postfix /etc/service/postfix/run

## Remote syslog
cp /build/config/syslog-ng/conf.d/* /etc/syslog-ng/conf.d/