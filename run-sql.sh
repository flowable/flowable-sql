#!/bin/bash
export MAVEN_OPTS="-Xms521M -Xmx1024M"
if [[ "$1" == "" ]] ; then

   	echo "Missing argument: correct usage <./run-sql.sh database>"
   	
else
	DATABASE=$1
    echo "Database type: $DATABASE"
    
    cd flowable-sql-6.7.1
    if [[ "$DATABASE" == "oracle" ]] ; then
    	mvn -PupdateDb -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT clean install
    else
    	mvn -PupdateDb -Ddatabase=$DATABASE clean install
    fi
    
    cd ..
    
    cd flowable-sql-6.7.2
    if [[ "$DATABASE" == "oracle" ]] ; then
    	mvn -PgenerateSql -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT -DoldVersion=6.7.1 -DnewVersion=6.7.2 clean install
    	mvn -PgenerateCreateSql -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT clean install
    	mvn -PcombineUpgradeSql -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT -DoldVersion=6.7.1 -DnewVersion=6.7.2 clean install
    	mvn -PcombineCreateSql -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT clean install
    	mvn -PdropAll -Ddatabasewithschema=$DATABASE -Duser.timezone=GMT clean install
    else
    	mvn -PgenerateSql -Ddatabase=$DATABASE -DoldVersion=6.7.1 -DnewVersion=6.7.2 clean install
    	mvn -PgenerateCreateSql -Ddatabase=$DATABASE clean install
    	mvn -PcombineUpgradeSql -Ddatabase=$DATABASE -DoldVersion=6.7.1 -DnewVersion=6.7.2 clean install
    	mvn -PcombineCreateSql -Ddatabase=$DATABASE clean install
    	mvn -PdropAll -Ddatabase=$DATABASE clean install
    fi
    
    cd ..
fi
