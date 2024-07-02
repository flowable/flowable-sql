#!/bin/bash
export MAVEN_OPTS="-Xms521M -Xmx1024M"
if [[ "$1" == "" ]] ; then

   	echo "Missing argument: correct usage <./run-sql.sh database>"
   	
else
	DATABASE=$1
	OLDVERSION=$2
	NEWVERSION=$3
    echo "Database type: $DATABASE"
    
    cd flowable-sql-$OLDVERSION
    if [[ "$DATABASE" == "oracle" ]] ; then
    	mvn -PupdateDb -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT clean install
    else
    	mvn -PupdateDb -Ddatabase=$DATABASE clean install
    fi
    
    cd ..
    
    cd flowable-sql-$NEWVERSION
    if [[ "$DATABASE" == "oracle" ]] ; then
    	mvn -PgenerateSql -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT -DoldVersion=$OLDVERSION -DnewVersion=$NEWVERSION clean install
    else
    	mvn -PgenerateSql -Ddatabase=$DATABASE -DoldVersion=$OLDVERSION -DnewVersion=$NEWVERSION clean install
    fi
    
    cd ..
fi
