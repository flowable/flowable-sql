CREATE TABLE ACT_CMMN_DEPLOYMENT (ID_ VARCHAR2(255) NOT NULL, NAME_ VARCHAR2(255), CATEGORY_ VARCHAR2(255), KEY_ VARCHAR2(255), DEPLOY_TIME_ TIMESTAMP, PARENT_DEPLOYMENT_ID_ VARCHAR2(255), TENANT_ID_ VARCHAR2(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_DEPLOYMENT_RESOURCE (ID_ VARCHAR2(255) NOT NULL, NAME_ VARCHAR2(255), DEPLOYMENT_ID_ VARCHAR2(255), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_CMMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_CMMN_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CMMN_RSRC_DPL ON ACT_CMMN_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_CASEDEF (ID_ VARCHAR2(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR2(255), KEY_ VARCHAR2(255) NOT NULL, VERSION_ INTEGER NOT NULL, CATEGORY_ VARCHAR2(255), DEPLOYMENT_ID_ VARCHAR2(255), RESOURCE_NAME_ VARCHAR2(4000), DESCRIPTION_ VARCHAR2(4000), HAS_GRAPHICAL_NOTATION_ NUMBER(1), TENANT_ID_ VARCHAR2(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_CASEDEF PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_CASEDEF ADD CONSTRAINT ACT_FK_CASE_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CASE_DEF_DPLY ON ACT_CMMN_CASEDEF(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_RU_CASE_INST (ID_ VARCHAR2(255) NOT NULL, REV_ INTEGER NOT NULL, BUSINESS_KEY_ VARCHAR2(255), NAME_ VARCHAR2(255), PARENT_ID_ VARCHAR2(255), CASE_DEF_ID_ VARCHAR2(255), STATE_ VARCHAR2(255), START_TIME_ TIMESTAMP, START_USER_ID_ VARCHAR2(255), CALLBACK_ID_ VARCHAR2(255), CALLBACK_TYPE_ VARCHAR2(255), TENANT_ID_ VARCHAR2(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_RU_CASE_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD CONSTRAINT ACT_FK_CASE_INST_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_CASE_INST_CASE_DEF ON ACT_CMMN_RU_CASE_INST(CASE_DEF_ID_);

CREATE INDEX ACT_IDX_CASE_INST_PARENT ON ACT_CMMN_RU_CASE_INST(PARENT_ID_);

CREATE TABLE ACT_CMMN_RU_PLAN_ITEM_INST (ID_ VARCHAR2(255) NOT NULL, REV_ INTEGER NOT NULL, CASE_DEF_ID_ VARCHAR2(255), CASE_INST_ID_ VARCHAR2(255), STAGE_INST_ID_ VARCHAR2(255), IS_STAGE_ NUMBER(1), ELEMENT_ID_ VARCHAR2(255), NAME_ VARCHAR2(255), STATE_ VARCHAR2(255), START_TIME_ TIMESTAMP, START_USER_ID_ VARCHAR2(255), REFERENCE_ID_ VARCHAR2(255), REFERENCE_TYPE_ VARCHAR2(255), TENANT_ID_ VARCHAR2(255) DEFAULT '', CONSTRAINT PK_CMMN_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_DEF ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_RU_SENTRY_PART_INST (ID_ VARCHAR2(255) NOT NULL, REV_ INTEGER NOT NULL, CASE_DEF_ID_ VARCHAR2(255), CASE_INST_ID_ VARCHAR2(255), PLAN_ITEM_INST_ID_ VARCHAR2(255), ON_PART_ID_ VARCHAR2(255), IF_PART_ID_ VARCHAR2(255), TIME_STAMP_ TIMESTAMP, CONSTRAINT PK_CMMN_SENTRY_PART_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_DEF ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_INST ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_PLAN_ITEM FOREIGN KEY (PLAN_ITEM_INST_ID_) REFERENCES ACT_CMMN_RU_PLAN_ITEM_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_PLAN_ITEM ON ACT_CMMN_RU_SENTRY_PART_INST(PLAN_ITEM_INST_ID_);

CREATE TABLE ACT_CMMN_RU_MIL_INST (ID_ VARCHAR2(255) NOT NULL, NAME_ VARCHAR2(255) NOT NULL, TIME_STAMP_ TIMESTAMP NOT NULL, CASE_INST_ID_ VARCHAR2(255) NOT NULL, CASE_DEF_ID_ VARCHAR2(255) NOT NULL, ELEMENT_ID_ VARCHAR2(255) NOT NULL, CONSTRAINT PK_ACT_CMMN_RU_MIL_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_DEF ON ACT_CMMN_RU_MIL_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_INST ON ACT_CMMN_RU_MIL_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_HI_CASE_INST (ID_ VARCHAR2(255) NOT NULL, REV_ INTEGER NOT NULL, BUSINESS_KEY_ VARCHAR2(255), NAME_ VARCHAR2(255), PARENT_ID_ VARCHAR2(255), CASE_DEF_ID_ VARCHAR2(255), STATE_ VARCHAR2(255), START_TIME_ TIMESTAMP, END_TIME_ TIMESTAMP, START_USER_ID_ VARCHAR2(255), CALLBACK_ID_ VARCHAR2(255), CALLBACK_TYPE_ VARCHAR2(255), TENANT_ID_ VARCHAR2(255) DEFAULT '', CONSTRAINT PK_ACT_CMMN_HI_CASE_INST PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_HI_MIL_INST (ID_ VARCHAR2(255) NOT NULL, REV_ INTEGER NOT NULL, NAME_ VARCHAR2(255) NOT NULL, TIME_STAMP_ TIMESTAMP NOT NULL, CASE_INST_ID_ VARCHAR2(255) NOT NULL, CASE_DEF_ID_ VARCHAR2(255) NOT NULL, ELEMENT_ID_ VARCHAR2(255) NOT NULL, CONSTRAINT PK_ACT_CMMN_HI_MIL_INST PRIMARY KEY (ID_));


