update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'common.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'entitylink.schema.version';

alter table ACT_HI_IDENTITYLINK add SUB_SCOPE_ID_ nvarchar(255);

create index ACT_IDX_HI_IDENT_LNK_SUB_SCOPE on ACT_HI_IDENTITYLINK(SUB_SCOPE_ID_, SCOPE_TYPE_);

alter table ACT_RU_IDENTITYLINK add SUB_SCOPE_ID_ nvarchar(255);

create index ACT_IDX_IDENT_LNK_SUB_SCOPE on ACT_RU_IDENTITYLINK(SUB_SCOPE_ID_, SCOPE_TYPE_);

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'job.schema.version';

create table FLW_RU_BATCH (
    ID_ nvarchar(64) not null,
    REV_ int,
    TYPE_ nvarchar(64) not null,
    SEARCH_KEY_ nvarchar(255),
    SEARCH_KEY2_ nvarchar(255),
    CREATE_TIME_ datetime not null,
    COMPLETE_TIME_ datetime,
    STATUS_ nvarchar(255),
    BATCH_DOC_ID_ nvarchar(64),
    TENANT_ID_ nvarchar(255) default '',
    primary key (ID_)
);

create table FLW_RU_BATCH_PART (
    ID_ nvarchar(64) not null,
    REV_ int,
    BATCH_ID_ nvarchar(64),
    TYPE_ nvarchar(64) not null,
    SCOPE_ID_ nvarchar(64),
    SUB_SCOPE_ID_ nvarchar(64),
    SCOPE_TYPE_ nvarchar(64),
    SEARCH_KEY_ nvarchar(255),
    SEARCH_KEY2_ nvarchar(255),
    CREATE_TIME_ datetime not null,
    COMPLETE_TIME_ datetime,
    STATUS_ nvarchar(255),
    RESULT_DOC_ID_ nvarchar(64),
    TENANT_ID_ nvarchar(255) default '',
    primary key (ID_)
);

create index FLW_IDX_BATCH_PART on FLW_RU_BATCH_PART(BATCH_ID_);

alter table FLW_RU_BATCH_PART
    add constraint FLW_FK_BATCH_PART_PARENT
    foreign key (BATCH_ID_)
    references FLW_RU_BATCH (ID_);

insert into ACT_GE_PROPERTY values ('batch.schema.version', '6.5.0.6', 1);

alter table ACT_HI_TASKINST add PROPAGATED_STAGE_INST_ID_ nvarchar(255);

alter table ACT_RU_TASK add PROPAGATED_STAGE_INST_ID_ nvarchar(255);

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'eventsubscription.schema.version';

alter table ACT_RU_EXECUTION add REFERENCE_ID_ nvarchar(255);
alter table ACT_RU_EXECUTION add REFERENCE_TYPE_ nvarchar(255);

alter table ACT_RU_EXECUTION add PROPAGATED_STAGE_INST_ID_ nvarchar(255);

alter table ACT_HI_PROCINST add REFERENCE_ID_ nvarchar(255);
alter table ACT_HI_PROCINST add REFERENCE_TYPE_ nvarchar(255);

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'schema.version';
update ACT_ID_PROPERTY set VALUE_ = '6.5.0.6' where NAME_ = 'schema.version';


UPDATE [ACT_APP_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-01-19T20:43:19.998' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_APP_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-01-19T20:43:28.102' WHERE [ID] = 1 AND [LOCKED] = 0

ALTER TABLE [ACT_CMMN_HI_PLAN_ITEM_INST] ADD [SHOW_IN_OVERVIEW_] [bit]

INSERT INTO [ACT_CMMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('8', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', GETDATE(), 7, '7:d168de628476556968549f4a355baacb', 'addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '9463008585')

ALTER TABLE [ACT_CMMN_RU_PLAN_ITEM_INST] ADD [EXTRA_VALUE_] [varchar](255)

ALTER TABLE [ACT_CMMN_HI_PLAN_ITEM_INST] ADD [EXTRA_VALUE_] [varchar](255)

INSERT INTO [ACT_CMMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('9', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', GETDATE(), 8, '7:20048a5d52039eaabb32dbb30240fc08', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '9463008585')

ALTER TABLE [ACT_CMMN_RU_CASE_INST] ADD [REFERENCE_ID_] [varchar](255)

ALTER TABLE [ACT_CMMN_RU_CASE_INST] ADD [REFERENCE_TYPE_] [varchar](255)

CREATE NONCLUSTERED INDEX ACT_IDX_CASE_INST_REF_ID_ ON [ACT_CMMN_RU_CASE_INST]([REFERENCE_ID_])

ALTER TABLE [ACT_CMMN_HI_CASE_INST] ADD [REFERENCE_ID_] [varchar](255)

ALTER TABLE [ACT_CMMN_HI_CASE_INST] ADD [REFERENCE_TYPE_] [varchar](255)

INSERT INTO [ACT_CMMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('10', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', GETDATE(), 9, '7:e20ea59573dc2a33bbf72043ea09ea4d', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...', '', 'EXECUTED', NULL, NULL, '3.5.3', '9463008585')

ALTER TABLE [ACT_CMMN_RU_PLAN_ITEM_INST] ADD [DERIVED_CASE_DEF_ID_] [varchar](255)

ALTER TABLE [ACT_CMMN_HI_PLAN_ITEM_INST] ADD [DERIVED_CASE_DEF_ID_] [varchar](255)

INSERT INTO [ACT_CMMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('11', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', GETDATE(), 10, '7:21c7a61ad7fb26abc675dff7ac54e43e', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '9463008585')

UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



CREATE TABLE [FLW_EV_DATABASECHANGELOGLOCK] ([ID] [int] NOT NULL, [LOCKED] [bit] NOT NULL, [LOCKGRANTED] [datetime2](3), [LOCKEDBY] [nvarchar](255), CONSTRAINT [PK_FLW_EV_DATABASECHANGELOGLOCK] PRIMARY KEY ([ID]))

DELETE FROM [FLW_EV_DATABASECHANGELOGLOCK]

INSERT INTO [FLW_EV_DATABASECHANGELOGLOCK] ([ID], [LOCKED]) VALUES (1, 0)

UPDATE [FLW_EV_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-01-19T20:43:35.685' WHERE [ID] = 1 AND [LOCKED] = 0

CREATE TABLE [FLW_EV_DATABASECHANGELOG] ([ID] [nvarchar](255) NOT NULL, [AUTHOR] [nvarchar](255) NOT NULL, [FILENAME] [nvarchar](255) NOT NULL, [DATEEXECUTED] [datetime2](3) NOT NULL, [ORDEREXECUTED] [int] NOT NULL, [EXECTYPE] [nvarchar](10) NOT NULL, [MD5SUM] [nvarchar](35), [DESCRIPTION] [nvarchar](255), [COMMENTS] [nvarchar](255), [TAG] [nvarchar](255), [LIQUIBASE] [nvarchar](20), [CONTEXTS] [nvarchar](255), [LABELS] [nvarchar](255), [DEPLOYMENT_ID] [nvarchar](10))

CREATE TABLE [FLW_EVENT_DEPLOYMENT] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOY_TIME_] [datetime], [TENANT_ID_] [varchar](255), [PARENT_DEPLOYMENT_ID_] [varchar](255), CONSTRAINT [PK_FLW_EVENT_DEPLOYMENT] PRIMARY KEY ([ID_]))

CREATE TABLE [FLW_EVENT_RESOURCE] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [RESOURCE_BYTES_] [varbinary](MAX), CONSTRAINT [PK_FLW_EVENT_RESOURCE] PRIMARY KEY ([ID_]))

CREATE TABLE [FLW_EVENT_DEFINITION] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [VERSION_] [int], [KEY_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [TENANT_ID_] [varchar](255), [RESOURCE_NAME_] [varchar](255), [DESCRIPTION_] [varchar](255), CONSTRAINT [PK_FLW_EVENT_DEFINITION] PRIMARY KEY ([ID_]))

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_EVENT_DEF_UNIQ ON [FLW_EVENT_DEFINITION]([KEY_], [VERSION_], [TENANT_ID_])

CREATE TABLE [FLW_CHANNEL_DEFINITION] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [VERSION_] [int], [KEY_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [CREATE_TIME_] [datetime], [TENANT_ID_] [varchar](255), [RESOURCE_NAME_] [varchar](255), [DESCRIPTION_] [varchar](255), CONSTRAINT [PK_FLW_CHANNEL_DEFINITION] PRIMARY KEY ([ID_]))

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_CHANNEL_DEF_UNIQ ON [FLW_CHANNEL_DEFINITION]([KEY_], [VERSION_], [TENANT_ID_])

INSERT INTO [FLW_EV_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', GETDATE(), 1, '7:0aaa7b01343f4cdaf1019cd2de3f98f3', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', 'EXECUTED', NULL, NULL, '3.5.3', '9463015806')

UPDATE [FLW_EV_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-01-19T20:43:42.423' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-01-19T20:43:51.428' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-01-19T20:43:58.682' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1

