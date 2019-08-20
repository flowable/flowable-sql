update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'common.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'entitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'job.schema.version';

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

insert into ACT_GE_PROPERTY values ('batch.schema.version', '6.5.0.2', 1);

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'eventsubscription.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'schema.version';

update ACT_ID_PROPERTY set VALUE_ = '6.5.0.2' where NAME_ = 'schema.version';


UPDATE [ACT_APP_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2019-08-20T12:09:18.794' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_APP_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2019-08-20T12:09:26.340' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2019-08-20T12:09:33.257' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2019-08-20T12:09:40.151' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2019-08-20T12:09:47.010' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1

