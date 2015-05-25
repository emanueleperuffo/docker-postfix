#!/bin/bash
set -e
source /build/buildconfig
set -x

## Installing postgres
$minimal_apt_get_install postgresql-common
sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf
$minimal_apt_get_install postgresql-${PG_MAJOR} postgresql-contrib-${PG_MAJOR}

## Setting up postgres service
mkdir /etc/service/postgres
cp /build/runit/postgres /etc/service/postgres/run

## Remote syslog
cp /build/config/syslog-ng/conf.d/* /etc/syslog-ng/conf.d/
