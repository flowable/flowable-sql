
SET SEARCH_PATH TO 

SET SEARCH_PATH TO 

CREATE TABLE act_cmmn_databasechangeloglock (ID INTEGER NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT ACT_CMMN_DATABASECHANGELOGLOCK_PKEY PRIMARY KEY (ID));

DELETE FROM act_cmmn_databasechangeloglock;

INSERT INTO act_cmmn_databasechangeloglock (ID, LOCKED) VALUES (1, FALSE);

UPDATE act_cmmn_databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2022-12-21 18:21:46.192' WHERE ID = 1 AND LOCKED = FALSE;

SET SEARCH_PATH TO 

CREATE TABLE act_cmmn_databasechangelog (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED TIMESTAMP WITHOUT TIME ZONE NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION VARCHAR(255), COMMENTS VARCHAR(255), TAG VARCHAR(255), LIQUIBASE VARCHAR(20), CONTEXTS VARCHAR(255), LABELS VARCHAR(255), DEPLOYMENT_ID VARCHAR(10));

SET SEARCH_PATH TO 

SET SEARCH_PATH TO 

SET SEARCH_PATH TO 

CREATE TABLE ACT_CMMN_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), CATEGORY_ VARCHAR(255), KEY_ VARCHAR(255), DEPLOY_TIME_ TIMESTAMP WITHOUT TIME ZONE, PARENT_DEPLOYMENT_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT ACT_CMMN_DEPLOYMENT_PKEY PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_DEPLOYMENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_BYTES_ BYTEA, CONSTRAINT PK_CMMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_CMMN_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CMMN_RSRC_DPL ON ACT_CMMN_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_CASEDEF (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR(255), KEY_ VARCHAR(255) NOT NULL, VERSION_ INTEGER NOT NULL, CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(4000), DESCRIPTION_ VARCHAR(4000), HAS_GRAPHICAL_NOTATION_ BOOLEAN, TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT ACT_CMMN_CASEDEF_PKEY PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_CASEDEF ADD CONSTRAINT ACT_FK_CASE_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CASE_DEF_DPLY ON ACT_CMMN_CASEDEF(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_RU_CASE_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, BUSINESS_KEY_ VARCHAR(255), NAME_ VARCHAR(255), PARENT_ID_ VARCHAR(255), CASE_DEF_ID_ VARCHAR(255), STATE_ VARCHAR(255), START_TIME_ TIMESTAMP WITHOUT TIME ZONE, START_USER_ID_ VARCHAR(255), CALLBACK_ID_ VARCHAR(255), CALLBACK_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT ACT_CMMN_RU_CASE_INST_PKEY PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD CONSTRAINT ACT_FK_CASE_INST_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_CASE_INST_CASE_DEF ON ACT_CMMN_RU_CASE_INST(CASE_DEF_ID_);

CREATE INDEX ACT_IDX_CASE_INST_PARENT ON ACT_CMMN_RU_CASE_INST(PARENT_ID_);

CREATE TABLE ACT_CMMN_RU_PLAN_ITEM_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, CASE_DEF_ID_ VARCHAR(255), CASE_INST_ID_ VARCHAR(255), STAGE_INST_ID_ VARCHAR(255), IS_STAGE_ BOOLEAN, ELEMENT_ID_ VARCHAR(255), NAME_ VARCHAR(255), STATE_ VARCHAR(255), START_TIME_ TIMESTAMP WITHOUT TIME ZONE, START_USER_ID_ VARCHAR(255), REFERENCE_ID_ VARCHAR(255), REFERENCE_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT PK_CMMN_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_DEF ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_RU_SENTRY_PART_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, CASE_DEF_ID_ VARCHAR(255), CASE_INST_ID_ VARCHAR(255), PLAN_ITEM_INST_ID_ VARCHAR(255), ON_PART_ID_ VARCHAR(255), IF_PART_ID_ VARCHAR(255), TIME_STAMP_ TIMESTAMP WITHOUT TIME ZONE, CONSTRAINT PK_CMMN_SENTRY_PART_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_DEF ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_INST ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_PLAN_ITEM FOREIGN KEY (PLAN_ITEM_INST_ID_) REFERENCES ACT_CMMN_RU_PLAN_ITEM_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_PLAN_ITEM ON ACT_CMMN_RU_SENTRY_PART_INST(PLAN_ITEM_INST_ID_);

CREATE TABLE ACT_CMMN_RU_MIL_INST (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NOT NULL, TIME_STAMP_ TIMESTAMP WITHOUT TIME ZONE NOT NULL, CASE_INST_ID_ VARCHAR(255) NOT NULL, CASE_DEF_ID_ VARCHAR(255) NOT NULL, ELEMENT_ID_ VARCHAR(255) NOT NULL, CONSTRAINT ACT_CMMN_RU_MIL_INST_PKEY PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_DEF ON ACT_CMMN_RU_MIL_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_INST ON ACT_CMMN_RU_MIL_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_HI_CASE_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, BUSINESS_KEY_ VARCHAR(255), NAME_ VARCHAR(255), PARENT_ID_ VARCHAR(255), CASE_DEF_ID_ VARCHAR(255), STATE_ VARCHAR(255), START_TIME_ TIMESTAMP WITHOUT TIME ZONE, END_TIME_ TIMESTAMP WITHOUT TIME ZONE, START_USER_ID_ VARCHAR(255), CALLBACK_ID_ VARCHAR(255), CALLBACK_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT ACT_CMMN_HI_CASE_INST_PKEY PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_HI_MIL_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR(255) NOT NULL, TIME_STAMP_ TIMESTAMP WITHOUT TIME ZONE NOT NULL, CASE_INST_ID_ VARCHAR(255) NOT NULL, CASE_DEF_ID_ VARCHAR(255) NOT NULL, ELEMENT_ID_ VARCHAR(255) NOT NULL, CONSTRAINT ACT_CMMN_HI_MIL_INST_PKEY PRIMARY KEY (ID_));

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 1, '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_CASEDEF ADD DGRM_RESOURCE_NAME_ VARCHAR(4000);

ALTER TABLE ACT_CMMN_CASEDEF ADD HAS_START_FORM_KEY_ BOOLEAN;

ALTER TABLE ACT_CMMN_DEPLOYMENT_RESOURCE ADD GENERATED_ BOOLEAN;

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LOCK_TIME_ TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ITEM_DEFINITION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ITEM_DEFINITION_TYPE_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 2, '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COMPLETEABLE_ BOOLEAN;

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD IS_COMPLETEABLE_ BOOLEAN;

CREATE INDEX ACT_IDX_PLAN_ITEM_STAGE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(STAGE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COUNT_ENABLED_ BOOLEAN;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD VAR_COUNT_ INTEGER;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD SENTRY_PART_INST_COUNT_ INTEGER;

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 3, '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

CREATE TABLE ACT_CMMN_HI_PLAN_ITEM_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR(255), STATE_ VARCHAR(255), CASE_DEF_ID_ VARCHAR(255), CASE_INST_ID_ VARCHAR(255), STAGE_INST_ID_ VARCHAR(255), IS_STAGE_ BOOLEAN, ELEMENT_ID_ VARCHAR(255), ITEM_DEFINITION_ID_ VARCHAR(255), ITEM_DEFINITION_TYPE_ VARCHAR(255), CREATED_TIME_ TIMESTAMP WITHOUT TIME ZONE, LAST_AVAILABLE_TIME_ TIMESTAMP WITHOUT TIME ZONE, LAST_ENABLED_TIME_ TIMESTAMP WITHOUT TIME ZONE, LAST_DISABLED_TIME_ TIMESTAMP WITHOUT TIME ZONE, LAST_STARTED_TIME_ TIMESTAMP WITHOUT TIME ZONE, LAST_SUSPENDED_TIME_ TIMESTAMP WITHOUT TIME ZONE, COMPLETED_TIME_ TIMESTAMP WITHOUT TIME ZONE, OCCURRED_TIME_ TIMESTAMP WITHOUT TIME ZONE, TERMINATED_TIME_ TIMESTAMP WITHOUT TIME ZONE, EXIT_TIME_ TIMESTAMP WITHOUT TIME ZONE, ENDED_TIME_ TIMESTAMP WITHOUT TIME ZONE, LAST_UPDATED_TIME_ TIMESTAMP WITHOUT TIME ZONE, START_USER_ID_ VARCHAR(255), REFERENCE_ID_ VARCHAR(255), REFERENCE_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT ACT_CMMN_HI_PLAN_ITEM_INST_PKEY PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '';

ALTER TABLE ACT_CMMN_HI_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '';

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 4, '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

CREATE UNIQUE INDEX ACT_IDX_CASE_DEF_UNIQ ON ACT_CMMN_CASEDEF(KEY_, VERSION_, TENANT_ID_);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 5, '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST RENAME COLUMN START_TIME_ TO CREATE_TIME_;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST RENAME COLUMN CREATED_TIME_ TO CREATE_TIME_;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_AVAILABLE_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_ENABLED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_DISABLED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_STARTED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_SUSPENDED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD COMPLETED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD OCCURRED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD TERMINATED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXIT_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ENDED_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ENTRY_CRITERION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXIT_CRITERION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD ENTRY_CRITERION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD EXIT_CRITERION_ID_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 6, '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD SHOW_IN_OVERVIEW_ BOOLEAN;

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('8', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 7, '8:e8c2eb1ce28bc301efe07e0e29757781', 'addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXTRA_VALUE_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD EXTRA_VALUE_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('9', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 8, '8:4cb4782b9bdec5ced2a64c525aa7b3a0', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD REFERENCE_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD REFERENCE_TYPE_ VARCHAR(255);

CREATE INDEX ACT_IDX_CASE_INST_REF_ID_ ON ACT_CMMN_RU_CASE_INST(REFERENCE_ID_);

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD REFERENCE_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD REFERENCE_TYPE_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('10', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 9, '8:341c16be247f5d17badc9809da8691f9', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD DERIVED_CASE_DEF_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD DERIVED_CASE_DEF_ID_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('11', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 10, '8:d7c4da9276bcfffbfb0ebfb25e3f7b05', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LOCK_OWNER_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('12', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 11, '8:adf4ecc45f2aa9a44a5626b02e1d6f98', 'addColumn tableName=ACT_CMMN_RU_CASE_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_UNAVAILABLE_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD LAST_UNAVAILABLE_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('13', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 12, '8:7550626f964ab5518464709408333ec1', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LAST_REACTIVATION_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LAST_REACTIVATION_USER_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD LAST_REACTIVATION_TIME_ TIMESTAMP(3) WITHOUT TIME ZONE;

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD LAST_REACTIVATION_USER_ID_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('14', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 13, '8:086b40b3a05596dcc8a8d7479922d494', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD BUSINESS_STATUS_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD BUSINESS_STATUS_ VARCHAR(255);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('16', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 14, '8:a697a222ddd99dd15b36516a252f1c63', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

CREATE INDEX ACT_IDX_HI_CASE_INST_END ON ACT_CMMN_HI_CASE_INST(END_TIME_);

INSERT INTO act_cmmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('17', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 15, '8:d3706c5813a9b97fd2a59d12a9523946', 'createIndex indexName=ACT_IDX_HI_CASE_INST_END, tableName=ACT_CMMN_HI_CASE_INST', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643306331');

SET SEARCH_PATH TO 

UPDATE act_cmmn_databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

SET SEARCH_PATH TO 

