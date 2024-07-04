CREATE TABLE ACT_CMMN_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), CATEGORY_ VARCHAR(255), KEY_ VARCHAR(255), DEPLOY_TIME_ TIMESTAMP, PARENT_DEPLOYMENT_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_DEPLO PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_DEPLOYMENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_CMMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_CMMN_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CMMN_RSRC_DPL ON ACT_CMMN_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_CASEDEF (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR(255), KEY_ VARCHAR(255) NOT NULL, VERSION_ INTEGER NOT NULL, CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(4000), DESCRIPTION_ VARCHAR(4000), HAS_GRAPHICAL_NOTATION_ SMALLINT, TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_CASED PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_CASEDEF ADD CONSTRAINT ACT_FK_CASE_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CASE_DEF_DPLY ON ACT_CMMN_CASEDEF(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_RU_CASE_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, BUSINESS_KEY_ VARCHAR(255), NAME_ VARCHAR(255), PARENT_ID_ VARCHAR(255), CASE_DEF_ID_ VARCHAR(255), STATE_ VARCHAR(255), START_TIME_ TIMESTAMP, START_USER_ID_ VARCHAR(255), CALLBACK_ID_ VARCHAR(255), CALLBACK_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_RU_CA PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD CONSTRAINT ACT_FK_CASE_INST_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_CASE_INST_CASE_DEF ON ACT_CMMN_RU_CASE_INST(CASE_DEF_ID_);

CREATE INDEX ACT_IDX_CASE_INST_PARENT ON ACT_CMMN_RU_CASE_INST(PARENT_ID_);

CREATE TABLE ACT_CMMN_RU_PLAN_ITEM_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, CASE_DEF_ID_ VARCHAR(255), CASE_INST_ID_ VARCHAR(255), STAGE_INST_ID_ VARCHAR(255), IS_STAGE_ SMALLINT, ELEMENT_ID_ VARCHAR(255), NAME_ VARCHAR(255), STATE_ VARCHAR(255), START_TIME_ TIMESTAMP, START_USER_ID_ VARCHAR(255), REFERENCE_ID_ VARCHAR(255), REFERENCE_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT PK_CMMN_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_DEF ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_RU_SENTRY_PART_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, CASE_DEF_ID_ VARCHAR(255), CASE_INST_ID_ VARCHAR(255), PLAN_ITEM_INST_ID_ VARCHAR(255), ON_PART_ID_ VARCHAR(255), IF_PART_ID_ VARCHAR(255), TIME_STAMP_ TIMESTAMP, CONSTRAINT PK_CMMN_SENTRY_PART_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_DEF ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_INST ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_PLAN_ITEM FOREIGN KEY (PLAN_ITEM_INST_ID_) REFERENCES ACT_CMMN_RU_PLAN_ITEM_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_PLAN_ITEM ON ACT_CMMN_RU_SENTRY_PART_INST(PLAN_ITEM_INST_ID_);

CREATE TABLE ACT_CMMN_RU_MIL_INST (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NOT NULL, TIME_STAMP_ TIMESTAMP NOT NULL, CASE_INST_ID_ VARCHAR(255) NOT NULL, CASE_DEF_ID_ VARCHAR(255) NOT NULL, ELEMENT_ID_ VARCHAR(255) NOT NULL, CONSTRAINT PK_ACT_CMMN_RU_MI PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_DEF ON ACT_CMMN_RU_MIL_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_INST ON ACT_CMMN_RU_MIL_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_HI_CASE_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, BUSINESS_KEY_ VARCHAR(255), NAME_ VARCHAR(255), PARENT_ID_ VARCHAR(255), CASE_DEF_ID_ VARCHAR(255), STATE_ VARCHAR(255), START_TIME_ TIMESTAMP, END_TIME_ TIMESTAMP, START_USER_ID_ VARCHAR(255), CALLBACK_ID_ VARCHAR(255), CALLBACK_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_HI_CA PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_HI_MIL_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR(255) NOT NULL, TIME_STAMP_ TIMESTAMP NOT NULL, CASE_INST_ID_ VARCHAR(255) NOT NULL, CASE_DEF_ID_ VARCHAR(255) NOT NULL, ELEMENT_ID_ VARCHAR(255) NOT NULL, CONSTRAINT PK_ACT_CMMN_HI_MI PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_CASEDEF ADD DGRM_RESOURCE_NAME_ VARCHAR(4000);

ALTER TABLE ACT_CMMN_CASEDEF ADD HAS_START_FORM_KEY_ SMALLINT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_CASEDEF');

ALTER TABLE ACT_CMMN_DEPLOYMENT_RESOURCE ADD GENERATED_ SMALLINT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_DEPLOYMENT_RESOURCE');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LOCK_TIME_ TIMESTAMP;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_CASE_INST');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ITEM_DEFINITION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ITEM_DEFINITION_TYPE_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COMPLETEABLE_ SMALLINT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD IS_COMPLETEABLE_ SMALLINT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_CASE_INST');

CREATE INDEX ACT_IDX_PLAN_ITEM_STAGE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(STAGE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COUNT_ENABLED_ SMALLINT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD VAR_COUNT_ INTEGER;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD SENTRY_PART_INST_COUNT_ INTEGER;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

CREATE TABLE ACT_CMMN_HI_PLAN_ITEM_INST (ID_ VARCHAR(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR(255), STATE_ VARCHAR(255), CASE_DEF_ID_ VARCHAR(255), CASE_INST_ID_ VARCHAR(255), STAGE_INST_ID_ VARCHAR(255), IS_STAGE_ SMALLINT, ELEMENT_ID_ VARCHAR(255), ITEM_DEFINITION_ID_ VARCHAR(255), ITEM_DEFINITION_TYPE_ VARCHAR(255), CREATED_TIME_ TIMESTAMP, LAST_AVAILABLE_TIME_ TIMESTAMP, LAST_ENABLED_TIME_ TIMESTAMP, LAST_DISABLED_TIME_ TIMESTAMP, LAST_STARTED_TIME_ TIMESTAMP, LAST_SUSPENDED_TIME_ TIMESTAMP, COMPLETED_TIME_ TIMESTAMP, OCCURRED_TIME_ TIMESTAMP, TERMINATED_TIME_ TIMESTAMP, EXIT_TIME_ TIMESTAMP, ENDED_TIME_ TIMESTAMP, LAST_UPDATED_TIME_ TIMESTAMP, START_USER_ID_ VARCHAR(255), REFERENCE_ID_ VARCHAR(255), REFERENCE_TYPE_ VARCHAR(255), TENANT_ID_ VARCHAR(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_HI_PL PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '';

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_MIL_INST');

ALTER TABLE ACT_CMMN_HI_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '';

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_MIL_INST');

CREATE UNIQUE INDEX ACT_IDX_CASE_DEF_UNIQ ON ACT_CMMN_CASEDEF(KEY_, VERSION_, TENANT_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST RENAME COLUMN START_TIME_ TO CREATE_TIME_;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST RENAME COLUMN CREATED_TIME_ TO CREATE_TIME_;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_AVAILABLE_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_ENABLED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_DISABLED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_STARTED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_SUSPENDED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD COMPLETED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD OCCURRED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD TERMINATED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXIT_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ENDED_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ENTRY_CRITERION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXIT_CRITERION_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD ENTRY_CRITERION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD EXIT_CRITERION_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD SHOW_IN_OVERVIEW_ SMALLINT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXTRA_VALUE_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD EXTRA_VALUE_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD REFERENCE_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_CASE_INST');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD REFERENCE_TYPE_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_CASE_INST');

CREATE INDEX ACT_IDX_CASE_INST_REF_ID_ ON ACT_CMMN_RU_CASE_INST(REFERENCE_ID_);

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD REFERENCE_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_CASE_INST');

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD REFERENCE_TYPE_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_CASE_INST');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD DERIVED_CASE_DEF_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD DERIVED_CASE_DEF_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LOCK_OWNER_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_CASE_INST');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_UNAVAILABLE_TIME_ TIMESTAMP(3);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD LAST_UNAVAILABLE_TIME_ TIMESTAMP(3);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LAST_REACTIVATION_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LAST_REACTIVATION_USER_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_CASE_INST');

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD LAST_REACTIVATION_TIME_ TIMESTAMP(3);

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD LAST_REACTIVATION_USER_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_CASE_INST');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD BUSINESS_STATUS_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_CASE_INST');

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD BUSINESS_STATUS_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_CASE_INST');

CREATE INDEX ACT_IDX_HI_CASE_INST_END ON ACT_CMMN_HI_CASE_INST(END_TIME_);
