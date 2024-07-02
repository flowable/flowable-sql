#!/bin/bash
export MAVEN_OPTS="-Xms521M -Xmx1024M"

DATABASE=$1

./run-sql-upgrade-version.sh $DATABASE 6.1.2 6.2.0
./run-sql-upgrade-version.sh $DATABASE 6.2.0 6.2.1
./run-sql-upgrade-version.sh $DATABASE 6.2.1 6.3.0
./run-sql-upgrade-version.sh $DATABASE 6.3.0 6.3.1
./run-sql-upgrade-version.sh $DATABASE 6.3.1 6.4.0
./run-sql-upgrade-version.sh $DATABASE 6.4.0 6.4.1
./run-sql-upgrade-version.sh $DATABASE 6.4.1 6.4.2
./run-sql-upgrade-version.sh $DATABASE 6.4.2 6.5.0
./run-sql-upgrade-version.sh $DATABASE 6.5.0 6.6.0
./run-sql-upgrade-version.sh $DATABASE 6.6.0 6.7.0
./run-sql-upgrade-version.sh $DATABASE 6.7.0 6.7.1
./run-sql-upgrade-version.sh $DATABASE 6.7.1 6.7.2
./run-sql-upgrade-version.sh $DATABASE 6.7.2 6.8.0
./run-sql-upgrade-version.sh $DATABASE 6.8.0 6.8.1
./run-sql-upgrade-version.sh $DATABASE 6.8.1 7.0.0
./run-sql-upgrade-version.sh $DATABASE 7.0.0 7.0.1
./run-sql-upgrade-version.sh $DATABASE 7.0.1 7.1.0
