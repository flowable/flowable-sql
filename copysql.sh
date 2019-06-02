#!/bin/bash
export MAVEN_OPTS="-Xms521M -Xmx1024M"
if [[ "$1" == "" ]] ; then

   	echo "Missing argument: correct usage <./run-sql.sh database>"
   	
else
	DATABASE=$1
    echo "Database type: $DATABASE"
    
    cd flowable-sql-6.5.0
    mvn -PcopyManualSql -Ddatabase=$DATABASE -DoldVersion=6.4.1 -DnewVersion=6.5.0 clean install
fi
