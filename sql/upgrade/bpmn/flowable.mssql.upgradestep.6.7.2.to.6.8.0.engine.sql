create index ACT_IDX_HI_PRO_SUPER_PROCINST on ACT_HI_PROCINST(SUPER_PROCESS_INSTANCE_ID_);

update ACT_GE_PROPERTY set VALUE_ = '6.8.0.0' where NAME_ = 'schema.version';

