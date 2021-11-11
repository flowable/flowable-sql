

CREATE TABLE ACT_APP_DATABASECHANGELOGLOCK (ID int NOT NULL, LOCKED bit NOT NULL, LOCKGRANTED datetime2(3), LOCKEDBY nvarchar(255), CONSTRAINT PK_ACT_APP_DATABASECHANGELOGLOCK PRIMARY KEY (ID))

DELETE FROM ACT_APP_DATABASECHANGELOGLOCK

INSERT INTO ACT_APP_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0)

UPDATE ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.68.111 (192.168.68.111)', LOCKGRANTED = '2021-11-11T16:12:58.851' WHERE ID = 1 AND LOCKED = 0

CREATE TABLE ACT_APP_DATABASECHANGELOG (ID nvarchar(255) NOT NULL, AUTHOR nvarchar(255) NOT NULL, FILENAME nvarchar(255) NOT NULL, DATEEXECUTED datetime2(3) NOT NULL, ORDEREXECUTED int NOT NULL, EXECTYPE nvarchar(10) NOT NULL, MD5SUM nvarchar(35), DESCRIPTION nvarchar(255), COMMENTS nvarchar(255), TAG nvarchar(255), LIQUIBASE nvarchar(20), CONTEXTS nvarchar(255), LABELS nvarchar(255), DEPLOYMENT_ID nvarchar(10))

CREATE TABLE ACT_APP_DEPLOYMENT (ID_ varchar(255) NOT NULL, NAME_ varchar(255), CATEGORY_ varchar(255), KEY_ varchar(255), DEPLOY_TIME_ datetime, TENANT_ID_ varchar(255) CONSTRAINT DF_ACT_APP_DEPLOYMENT_TENANT_ID_ DEFAULT '', CONSTRAINT PK_ACT_APP_DEPLOYMENT PRIMARY KEY (ID_))

CREATE TABLE ACT_APP_DEPLOYMENT_RESOURCE (ID_ varchar(255) NOT NULL, NAME_ varchar(255), DEPLOYMENT_ID_ varchar(255), RESOURCE_BYTES_ varbinary(MAX), CONSTRAINT PK_APP_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_))

ALTER TABLE ACT_APP_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_APP_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_APP_DEPLOYMENT (ID_)

CREATE NONCLUSTERED INDEX ACT_IDX_APP_RSRC_DPL ON ACT_APP_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_)

CREATE TABLE ACT_APP_APPDEF (ID_ varchar(255) NOT NULL, REV_ int NOT NULL, NAME_ varchar(255), KEY_ varchar(255) NOT NULL, VERSION_ int NOT NULL, CATEGORY_ varchar(255), DEPLOYMENT_ID_ varchar(255), RESOURCE_NAME_ varchar(4000), DESCRIPTION_ varchar(4000), TENANT_ID_ varchar(255) CONSTRAINT DF_ACT_APP_APPDEF_TENANT_ID_ DEFAULT '', CONSTRAINT PK_ACT_APP_APPDEF PRIMARY KEY (ID_))

ALTER TABLE ACT_APP_APPDEF ADD CONSTRAINT ACT_FK_APP_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_APP_DEPLOYMENT (ID_)

CREATE NONCLUSTERED INDEX ACT_IDX_APP_DEF_DPLY ON ACT_APP_APPDEF(DEPLOYMENT_ID_)

INSERT INTO ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', GETDATE(), 1, '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', 'EXECUTED', NULL, NULL, '4.3.5', '6643579069')

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_APP_DEF_UNIQ ON ACT_APP_APPDEF(KEY_, VERSION_, TENANT_ID_)

INSERT INTO ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', GETDATE(), 2, '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', 'EXECUTED', NULL, NULL, '4.3.5', '6643579069')

UPDATE ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1

