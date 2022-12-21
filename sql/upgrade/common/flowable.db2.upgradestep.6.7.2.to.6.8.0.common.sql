update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'common.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'entitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'job.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'batch.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'variable.schema.version';

alter table ACT_RU_EVENT_SUBSCR add column LOCK_TIME_ timestamp;
alter table ACT_RU_EVENT_SUBSCR add column LOCK_OWNER_ varchar(255);

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'eventsubscription.schema.version';
