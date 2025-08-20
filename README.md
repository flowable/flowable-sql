This is used to generate the static SQL for Flowable Open Source.
To generate the SQL, the following script should be executed:

```shell
./generate-sql.sh <previosDbVersion> <previousFlowableVersion> <targetFlowableVersion>
```

e.g., For the upgrade from 7.1.0 to 7.2.0 the following command should be executed:

```shell
./generate-sql.sh 7.1.0.2 7.1.0 7.2.0-SNAPSHOT
```
