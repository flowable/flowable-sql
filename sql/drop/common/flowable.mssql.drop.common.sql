IF EXISTS (SELECT name FROM sysindexes WHERE name = 'FLW_IDX_BATCH_PART') drop index FLW_RU_BATCH_PART.FLW_IDX_BATCH_PART;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'FLW_RU_BATCH_PART') drop table FLW_RU_BATCH_PART;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'FLW_RU_BATCH') drop table FLW_RU_BATCH;

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_ENT_LNK_SCOPE') drop index ACT_RU_ENTITYLINK.ACT_IDX_ENT_LNK_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_ENT_LNK_SCOPE_DEF') drop index ACT_RU_ENTITYLINK.ACT_IDX_ENT_LNK_SCOPE_DEF;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_ENTITYLINK') drop table ACT_RU_ENTITYLINK;

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_EVENT_SUBSCR_CONFIG_') drop index ACT_RU_EVENT_SUBSCR.ACT_IDX_EVENT_SUBSCR_CONFIG_;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_EVENT_SUBSCR_EXEC_ID') drop index ACT_RU_EVENT_SUBSCR.ACT_IDX_EVENT_SUBSCR_EXEC_ID;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_EVENT_SUBSCR_SCOPEREF_') drop index ACT_RU_EVENT_SUBSCR.ACT_IDX_EVENT_SUBSCR_SCOPEREF_;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_EVENT_SUBSCR') drop table ACT_RU_EVENT_SUBSCR;

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_IDENT_LNK_USER') drop index ACT_RU_IDENTITYLINK.ACT_IDX_IDENT_LNK_USER;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_IDENT_LNK_GROUP') drop index ACT_RU_IDENTITYLINK.ACT_IDX_IDENT_LNK_GROUP;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_IDENT_LNK_SCOPE') drop index ACT_RU_IDENTITYLINK.ACT_IDX_IDENT_LNK_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_IDENT_LNK_SUB_SCOPE') drop index ACT_RU_IDENTITYLINK.ACT_IDX_IDENT_LNK_SUB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_IDENT_LNK_SCOPE_DEF') drop index ACT_RU_IDENTITYLINK.ACT_IDX_IDENT_LNK_SCOPE_DEF;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_IDENTITYLINK') drop table ACT_RU_IDENTITYLINK;

IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_JOB_SCOPE') drop index ACT_RU_JOB.ACT_IDX_JOB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_JOB_SUB_SCOPE') drop index ACT_RU_JOB.ACT_IDX_JOB_SUB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_JOB_SCOPE_DEF') drop index ACT_RU_JOB.ACT_IDX_JOB_SCOPE_DEF;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_TJOB_SCOPE') drop index ACT_RU_TIMER_JOB.ACT_IDX_TJOB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_TJOB_SUB_SCOPE') drop index ACT_RU_TIMER_JOB.ACT_IDX_TJOB_SUB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_TJOB_SCOPE_DEF') drop index ACT_RU_TIMER_JOB.ACT_IDX_TJOB_SCOPE_DEF;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_SJOB_SCOPE') drop index ACT_RU_SUSPENDED_JOB.ACT_IDX_SJOB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_SJOB_SUB_SCOPE') drop index ACT_RU_SUSPENDED_JOB.ACT_IDX_SJOB_SUB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_SJOB_SCOPE_DEF') drop index ACT_RU_SUSPENDED_JOB.ACT_IDX_SJOB_SCOPE_DEF;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_DJOB_SCOPE') drop index ACT_RU_DEADLETTER_JOB.ACT_IDX_DJOB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_DJOB_SUB_SCOPE') drop index ACT_RU_DEADLETTER_JOB.ACT_IDX_DJOB_SUB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_DJOB_SCOPE_DEF') drop index ACT_RU_DEADLETTER_JOB.ACT_IDX_DJOB_SCOPE_DEF;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_EJOB_SCOPE') drop index ACT_RU_EXTERNAL_JOB.ACT_IDX_EJOB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_EJOB_SUB_SCOPE') drop index ACT_RU_EXTERNAL_JOB.ACT_IDX_EJOB_SUB_SCOPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_EJOB_SCOPE_DEF') drop index ACT_RU_EXTERNAL_JOB.ACT_IDX_EJOB_SCOPE_DEF;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_JOB') alter table ACT_RU_JOB drop constraint ACT_FK_JOB_EXCEPTION;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_JOB') alter table ACT_RU_JOB drop constraint ACT_FK_JOB_CUSTOM_VALUES;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_TIMER_JOB') alter table ACT_RU_TIMER_JOB drop constraint ACT_FK_TIMER_JOB_EXCEPTION;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_TIMER_JOB') alter table ACT_RU_TIMER_JOB drop constraint ACT_FK_TIMER_JOB_CUSTOM_VALUES;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_SUSPENDED_JOB') alter table ACT_RU_SUSPENDED_JOB drop constraint ACT_FK_SUSPENDED_JOB_EXCEPTION;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_SUSPENDED_JOB') alter table ACT_RU_SUSPENDED_JOB drop constraint ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_DEADLETTER_JOB') alter table ACT_RU_DEADLETTER_JOB drop constraint ACT_FK_DEADLETTER_JOB_EXCEPTION;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_DEADLETTER_JOB') alter table ACT_RU_DEADLETTER_JOB drop constraint ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_EXTERNAL_JOB') alter table ACT_RU_EXTERNAL_JOB drop constraint ACT_FK_EXTERNAL_JOB_EXCEPTION;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_EXTERNAL_JOB') alter table ACT_RU_EXTERNAL_JOB drop constraint ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_JOB') drop table ACT_RU_JOB;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_TIMER_JOB') drop table ACT_RU_TIMER_JOB;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_SUSPENDED_JOB') drop table ACT_RU_SUSPENDED_JOB;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_DEADLETTER_JOB') drop table ACT_RU_DEADLETTER_JOB;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_HISTORY_JOB') drop table ACT_RU_HISTORY_JOB;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_EXTERNAL_JOB') drop table ACT_RU_EXTERNAL_JOB;


if exists (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_TASK_CREATE') drop index ACT_RU_TASK.ACT_IDX_TASK_CREATE;
if exists (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_TASK_SCOPE') drop index ACT_RU_TASK.ACT_IDX_TASK_SCOPE;
if exists (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_TASK_SUB_SCOPE') drop index ACT_RU_TASK.ACT_IDX_TASK_SUB_SCOPE;
if exists (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_TASK_SCOPE_DEF') drop index ACT_RU_TASK.ACT_IDX_TASK_SCOPE_DEF;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_TASK') drop table ACT_RU_TASK;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_VARIABLE') alter table ACT_RU_VARIABLE drop constraint ACT_FK_VAR_BYTEARRAY;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_RU_VAR_SCOPE_ID_TYPE') drop index ACT_RU_VARIABLE.ACT_IDX_RU_VAR_SCOPE_ID_TYPE;
IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_RU_VAR_SUB_ID_TYPE') drop index ACT_RU_VARIABLE.ACT_IDX_RU_VAR_SUB_ID_TYPE;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_RU_VARIABLE') drop table ACT_RU_VARIABLE;

if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_GE_BYTEARRAY') drop table ACT_GE_BYTEARRAY;
if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_GE_PROPERTY') drop table ACT_GE_PROPERTY;

