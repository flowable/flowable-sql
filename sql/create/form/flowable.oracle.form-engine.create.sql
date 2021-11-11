
CREATE TABLE FLOWABLE.ACT_FO_DATABASECHANGELOGLOCK (ID INTEGER NOT NULL, LOCKED NUMBER(1) NOT NULL, LOCKGRANTED TIMESTAMP, LOCKEDBY VARCHAR2(255), CONSTRAINT PK_ACT_FO_DATABASECHANGELOGLOC PRIMARY KEY (ID));

DELETE FROM FLOWABLE.ACT_FO_DATABASECHANGELOGLOCK;

INSERT INTO FLOWABLE.ACT_FO_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE FLOWABLE.ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.68.111 (192.168.68.111)', LOCKGRANTED = TO_TIMESTAMP('2021-11-11 14:55:41.916', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE FLOWABLE.ACT_FO_DATABASECHANGELOG (ID VARCHAR2(255) NOT NULL, AUTHOR VARCHAR2(255) NOT NULL, FILENAME VARCHAR2(255) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR2(10) NOT NULL, MD5SUM VARCHAR2(35), DESCRIPTION VARCHAR2(255), COMMENTS VARCHAR2(255), TAG VARCHAR2(255), LIQUIBASE VARCHAR2(20), CONTEXTS VARCHAR2(255), LABELS VARCHAR2(255), DEPLOYMENT_ID VARCHAR2(10));

CREATE TABLE FLOWABLE.ACT_FO_FORM_DEPLOYMENT (ID_ VARCHAR2(255) NOT NULL, NAME_ VARCHAR2(255), CATEGORY_ VARCHAR2(255), DEPLOY_TIME_ TIMESTAMP, TENANT_ID_ VARCHAR2(255), PARENT_DEPLOYMENT_ID_ VARCHAR2(255), CONSTRAINT PK_ACT_FO_FORM_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE FLOWABLE.ACT_FO_FORM_RESOURCE (ID_ VARCHAR2(255) NOT NULL, NAME_ VARCHAR2(255), DEPLOYMENT_ID_ VARCHAR2(255), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_ACT_FO_FORM_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE FLOWABLE.ACT_FO_FORM_DEFINITION (ID_ VARCHAR2(255) NOT NULL, NAME_ VARCHAR2(255), VERSION_ INTEGER, KEY_ VARCHAR2(255), CATEGORY_ VARCHAR2(255), DEPLOYMENT_ID_ VARCHAR2(255), PARENT_DEPLOYMENT_ID_ VARCHAR2(255), TENANT_ID_ VARCHAR2(255), RESOURCE_NAME_ VARCHAR2(255), DESCRIPTION_ VARCHAR2(255), CONSTRAINT PK_ACT_FO_FORM_DEFINITION PRIMARY KEY (ID_));

CREATE TABLE FLOWABLE.ACT_FO_FORM_INSTANCE (ID_ VARCHAR2(255) NOT NULL, FORM_DEFINITION_ID_ VARCHAR2(255) NOT NULL, TASK_ID_ VARCHAR2(255), PROC_INST_ID_ VARCHAR2(255), PROC_DEF_ID_ VARCHAR2(255), SUBMITTED_DATE_ TIMESTAMP, SUBMITTED_BY_ VARCHAR2(255), FORM_VALUES_ID_ VARCHAR2(255), TENANT_ID_ VARCHAR2(255), CONSTRAINT PK_ACT_FO_FORM_INSTANCE PRIMARY KEY (ID_));

INSERT INTO FLOWABLE.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', SYSTIMESTAMP, 1, '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '4.3.5', '6642541972');

ALTER TABLE FLOWABLE.ACT_FO_FORM_INSTANCE ADD SCOPE_ID_ VARCHAR2(255);

ALTER TABLE FLOWABLE.ACT_FO_FORM_INSTANCE ADD SCOPE_TYPE_ VARCHAR2(255);

ALTER TABLE FLOWABLE.ACT_FO_FORM_INSTANCE ADD SCOPE_DEFINITION_ID_ VARCHAR2(255);

INSERT INTO FLOWABLE.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', SYSTIMESTAMP, 2, '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '4.3.5', '6642541972');

ALTER TABLE FLOWABLE.ACT_FO_FORM_DEFINITION DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO FLOWABLE.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', SYSTIMESTAMP, 3, '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '4.3.5', '6642541972');

CREATE UNIQUE INDEX FLOWABLE.ACT_IDX_FORM_DEF_UNIQ ON FLOWABLE.ACT_FO_FORM_DEFINITION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO FLOWABLE.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', SYSTIMESTAMP, 4, '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '4.3.5', '6642541972');

CREATE INDEX FLOWABLE.ACT_IDX_FORM_TASK ON FLOWABLE.ACT_FO_FORM_INSTANCE(TASK_ID_);

CREATE INDEX FLOWABLE.ACT_IDX_FORM_PROC ON FLOWABLE.ACT_FO_FORM_INSTANCE(PROC_INST_ID_);

CREATE INDEX FLOWABLE.ACT_IDX_FORM_SCOPE ON FLOWABLE.ACT_FO_FORM_INSTANCE(SCOPE_ID_, SCOPE_TYPE_);

INSERT INTO FLOWABLE.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', SYSTIMESTAMP, 5, '8:384bbd364a649b67c3ca1bcb72fe537f', 'createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '4.3.5', '6642541972');

UPDATE FLOWABLE.ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

