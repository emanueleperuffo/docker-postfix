#!/bin/bash
set -e
source /build/buildconfig
set -x

## Installing postfix
$minimal_apt_get_install postfix postfix-ldap spamc

## Setting up posfix service
mkdir /etc/service/postfix
cp /build/runit/postfix /etc/service/postfix/run