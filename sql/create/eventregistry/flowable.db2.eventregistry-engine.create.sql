
CREATE TABLE ".FLW_EV_DATABASECHANGELOGLOCK (ID INTEGER NOT NULL, LOCKED SMALLINT NOT NULL, LOCKGRANTED TIMESTAMP, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DBCHGLOGLOCK PRIMARY KEY (ID));

DELETE FROM ".FLW_EV_DATABASECHANGELOGLOCK;

INSERT INTO ".FLW_EV_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE ".FLW_EV_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.68.131 (192.168.68.131)', LOCKGRANTED = TIMESTAMP('2024-02-20 09:01:41.94') WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE ".FLW_EV_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION VARCHAR(255), COMMENTS VARCHAR(255), TAG VARCHAR(255), LIQUIBASE VARCHAR(20), CONTEXTS VARCHAR(255), LABELS VARCHAR(255), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE ".FLW_EVENT_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOY_TIME_ TIMESTAMP(3), TENANT_ID_ VARCHAR(255), PARENT_DEPLOYMENT_ID_ VARCHAR(255), CONSTRAINT PK_FLW_EVENT_DEPL PRIMARY KEY (ID_));

CREATE TABLE ".FLW_EVENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_FLW_EVENT_RESO PRIMARY KEY (ID_));

CREATE TABLE ".FLW_EVENT_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), VERSION_ INTEGER, KEY_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(255), DESCRIPTION_ VARCHAR(255), CONSTRAINT PK_FLW_EVENT_DEFI PRIMARY KEY (ID_));

CREATE UNIQUE INDEX ".ACT_IDX_EVENT_DEF_UNIQ ON ".FLW_EVENT_DEFINITION(KEY_, VERSION_, TENANT_ID_);

CREATE TABLE ".FLW_CHANNEL_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), VERSION_ INTEGER, KEY_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), CREATE_TIME_ TIMESTAMP(3), TENANT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(255), DESCRIPTION_ VARCHAR(255), CONSTRAINT PK_FLW_CHANNEL_DE PRIMARY KEY (ID_));

CREATE UNIQUE INDEX ".ACT_IDX_CHANNEL_DEF_UNIQ ON ".FLW_CHANNEL_DEFINITION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ".FLW_EV_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', CURRENT TIMESTAMP, 1, '8:1b0c48c9cf7945be799d868a2626d687', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', 'EXECUTED', NULL, NULL, '4.3.5', '8416102006');

ALTER TABLE ".FLW_CHANNEL_DEFINITION ADD TYPE_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ".FLW_CHANNEL_DEFINITION');

ALTER TABLE ".FLW_CHANNEL_DEFINITION ADD IMPLEMENTATION_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ".FLW_CHANNEL_DEFINITION');

INSERT INTO ".FLW_EV_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', CURRENT TIMESTAMP, 2, '8:0ea825feb8e470558f0b5754352b9cda', 'addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION', '', 'EXECUTED', NULL, NULL, '4.3.5', '8416102006');

INSERT INTO ".FLW_EV_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', CURRENT TIMESTAMP, 3, '8:3c2bb293350b5cbe6504331980c9dcee', 'customChange', '', 'EXECUTED', NULL, NULL, '4.3.5', '8416102006');

UPDATE ".FLW_EV_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

