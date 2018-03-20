#!/usr/bin/env bash

set -eu
# this assumes you have the password in a password store :)

BASEDIR=$(dirname $0)/..
TMPDIR=$BASEDIR/tmp
rm -rf $TMPDIR
mkdir -p $TMPDIR
# TODO: detect if on OSX or Linux
tar -xzf $BASEDIR/flyway-commandline-5.0.7-macosx-x64.tar.gz -C $TMPDIR

DBURL=jdbc:postgresql://staging-event-recorder-db.cteb6b0pcrlw.eu-west-2.rds.amazonaws.com:5432/events

export FLYWAY_PASSWORD=$(pass show verify/abd/testing_rdb_password)
$TMPDIR/flyway-5.0.7/flyway migrate \
    -locations=filesystem:$BASEDIR/sql \
    -url=$DBURL \
    -user=postgres
