#!/bin/bash
export MAVEN_OPTS="-Xms521M -Xmx1024M"
if [[ "$1" == "" || "$2" == "" || "$3" == "" ]] ; then

  echo "Missing argument: correct usage <./generate-sql.sh previousDbVersion previousFlowableVersion toFlowableVersion>"
  echo "e.g. ./generate-sql 7.1.0.2 7.1.0 7.2.0-SNAPSHOT"
  exit 1

else
  PREVIOUS_DB_VERSION=$1
	PREVIOUS_FLOWABLE_VERSION=$2
	TARGET_FLOWABLE_VERSION=$3
  echo "Generating SQL using previous DB Version: ${PREVIOUS_DB_VERSION} from Flowable ${PREVIOUS_FLOWABLE_VERSION} to ${TARGET_FLOWABLE_VERSION}"
    
  cd flowable-sql-generator
  mvn -DpreviousDbVersion=${PREVIOUS_DB_VERSION} -DfromFlowableVersion=${PREVIOUS_FLOWABLE_VERSION} -Dflowable.version=${TARGET_FLOWABLE_VERSION} clean verify
fi
