update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'common.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'entitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'job.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'batch.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'task.schema.version';

alter table ACT_RU_VARIABLE add META_INFO_ NVARCHAR2(2000);

alter table ACT_HI_VARINST add META_INFO_ NVARCHAR2(2000);

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'eventsubscription.schema.version';
update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'schema.version';
update ACT_ID_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'schema.version';
