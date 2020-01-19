

CREATE TABLE [FLW_EV_DATABASECHANGELOGLOCK] ([ID] [int] NOT NULL, [LOCKED] [bit] NOT NULL, [LOCKGRANTED] [datetime2](3), [LOCKEDBY] [nvarchar](255), CONSTRAINT [PK_FLW_EV_DATABASECHANGELOGLOCK] PRIMARY KEY ([ID]))

DELETE FROM [FLW_EV_DATABASECHANGELOGLOCK]

INSERT INTO [FLW_EV_DATABASECHANGELOGLOCK] ([ID], [LOCKED]) VALUES (1, 0)

UPDATE [FLW_EV_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-01-19T20:44:46.558' WHERE [ID] = 1 AND [LOCKED] = 0

CREATE TABLE [FLW_EV_DATABASECHANGELOG] ([ID] [nvarchar](255) NOT NULL, [AUTHOR] [nvarchar](255) NOT NULL, [FILENAME] [nvarchar](255) NOT NULL, [DATEEXECUTED] [datetime2](3) NOT NULL, [ORDEREXECUTED] [int] NOT NULL, [EXECTYPE] [nvarchar](10) NOT NULL, [MD5SUM] [nvarchar](35), [DESCRIPTION] [nvarchar](255), [COMMENTS] [nvarchar](255), [TAG] [nvarchar](255), [LIQUIBASE] [nvarchar](20), [CONTEXTS] [nvarchar](255), [LABELS] [nvarchar](255), [DEPLOYMENT_ID] [nvarchar](10))

CREATE TABLE [FLW_EVENT_DEPLOYMENT] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOY_TIME_] [datetime], [TENANT_ID_] [varchar](255), [PARENT_DEPLOYMENT_ID_] [varchar](255), CONSTRAINT [PK_FLW_EVENT_DEPLOYMENT] PRIMARY KEY ([ID_]))

CREATE TABLE [FLW_EVENT_RESOURCE] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [RESOURCE_BYTES_] [varbinary](MAX), CONSTRAINT [PK_FLW_EVENT_RESOURCE] PRIMARY KEY ([ID_]))

CREATE TABLE [FLW_EVENT_DEFINITION] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [VERSION_] [int], [KEY_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [TENANT_ID_] [varchar](255), [RESOURCE_NAME_] [varchar](255), [DESCRIPTION_] [varchar](255), CONSTRAINT [PK_FLW_EVENT_DEFINITION] PRIMARY KEY ([ID_]))

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_EVENT_DEF_UNIQ ON [FLW_EVENT_DEFINITION]([KEY_], [VERSION_], [TENANT_ID_])

CREATE TABLE [FLW_CHANNEL_DEFINITION] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [VERSION_] [int], [KEY_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [CREATE_TIME_] [datetime], [TENANT_ID_] [varchar](255), [RESOURCE_NAME_] [varchar](255), [DESCRIPTION_] [varchar](255), CONSTRAINT [PK_FLW_CHANNEL_DEFINITION] PRIMARY KEY ([ID_]))

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_CHANNEL_DEF_UNIQ ON [FLW_CHANNEL_DEFINITION]([KEY_], [VERSION_], [TENANT_ID_])

INSERT INTO [FLW_EV_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', GETDATE(), 1, '7:0aaa7b01343f4cdaf1019cd2de3f98f3', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', 'EXECUTED', NULL, NULL, '3.5.3', '9463088030')

UPDATE [FLW_EV_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1

