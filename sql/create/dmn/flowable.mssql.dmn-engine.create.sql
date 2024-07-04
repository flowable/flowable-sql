CREATE TABLE ACT_DMN_DEPLOYMENT (ID_ varchar(255) NOT NULL, NAME_ varchar(255), CATEGORY_ varchar(255), DEPLOY_TIME_ datetime, TENANT_ID_ varchar(255), PARENT_DEPLOYMENT_ID_ varchar(255), CONSTRAINT PK_ACT_DMN_DEPLOYMENT PRIMARY KEY (ID_))

CREATE TABLE ACT_DMN_DEPLOYMENT_RESOURCE (ID_ varchar(255) NOT NULL, NAME_ varchar(255), DEPLOYMENT_ID_ varchar(255), RESOURCE_BYTES_ varbinary(MAX), CONSTRAINT PK_ACT_DMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_))

CREATE TABLE ACT_DMN_DECISION_TABLE (ID_ varchar(255) NOT NULL, NAME_ varchar(255), VERSION_ int, KEY_ varchar(255), CATEGORY_ varchar(255), DEPLOYMENT_ID_ varchar(255), PARENT_DEPLOYMENT_ID_ varchar(255), TENANT_ID_ varchar(255), RESOURCE_NAME_ varchar(255), DESCRIPTION_ varchar(255), CONSTRAINT PK_ACT_DMN_DECISION_TABLE PRIMARY KEY (ID_))

CREATE TABLE ACT_DMN_HI_DECISION_EXECUTION (ID_ varchar(255) NOT NULL, DECISION_DEFINITION_ID_ varchar(255), DEPLOYMENT_ID_ varchar(255), START_TIME_ datetime, END_TIME_ datetime, INSTANCE_ID_ varchar(255), EXECUTION_ID_ varchar(255), ACTIVITY_ID_ varchar(255), FAILED_ bit CONSTRAINT DF_ACT_DMN_HI_DECISION_EXECUTION_FAILED_ DEFAULT 0, TENANT_ID_ varchar(255), EXECUTION_JSON_ varchar(MAX), CONSTRAINT PK_ACT_DMN_HI_DECISION_EXECUTION PRIMARY KEY (ID_))

ALTER TABLE ACT_DMN_HI_DECISION_EXECUTION ADD SCOPE_TYPE_ varchar(255)

DECLARE @sql [nvarchar](MAX)
SELECT @sql = N'ALTER TABLE ACT_DMN_DECISION_TABLE DROP CONSTRAINT ' + QUOTENAME([df].[name]) FROM [sys].[columns] AS [c] INNER JOIN [sys].[default_constraints] AS [df] ON [df].[object_id] = [c].[default_object_id] WHERE [c].[object_id] = OBJECT_ID(N'ACT_DMN_DECISION_TABLE') AND [c].[name] = N'PARENT_DEPLOYMENT_ID_'
EXEC sp_executesql @sql

ALTER TABLE ACT_DMN_DECISION_TABLE DROP COLUMN PARENT_DEPLOYMENT_ID_

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_DEC_TBL_UNIQ ON ACT_DMN_DECISION_TABLE(KEY_, VERSION_, TENANT_ID_)

DROP INDEX ACT_IDX_DEC_TBL_UNIQ ON ACT_DMN_DECISION_TABLE

exec sp_rename 'ACT_DMN_DECISION_TABLE', 'ACT_DMN_DECISION'

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_DMN_DEC_UNIQ ON ACT_DMN_DECISION(KEY_, VERSION_, TENANT_ID_)

ALTER TABLE ACT_DMN_DECISION ADD DECISION_TYPE_ varchar(255)

CREATE NONCLUSTERED INDEX ACT_IDX_DMN_INSTANCE_ID ON ACT_DMN_HI_DECISION_EXECUTION(INSTANCE_ID_)
