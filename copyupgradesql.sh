#!/bin/bash
export MAVEN_OPTS="-Xms521M -Xmx1024M"
if [[ "$1" == "" ]] ; then

   	echo "Missing argument: correct usage <./run-sql.sh database>"
   	
else
	DATABASE=$1
    echo "Database type: $DATABASE"
    
    cd flowable-sql-7.1.0
    mvn -PcopyUpgradeSql -Ddatabase=$DATABASE clean install
fi
