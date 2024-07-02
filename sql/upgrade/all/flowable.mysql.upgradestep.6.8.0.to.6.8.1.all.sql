update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'common.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'entitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'job.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'batch.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'task.schema.version';

alter table ACT_RU_VARIABLE add column META_INFO_ varchar(4000);

alter table ACT_HI_VARINST add column META_INFO_ varchar(4000);

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'eventsubscription.schema.version';
update ACT_GE_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'schema.version';
update ACT_ID_PROPERTY set VALUE_ = '6.8.1.0' where NAME_ = 'schema.version';
UPDATE act_app_databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'Tijss-MacBook-Pro.local (192.168.68.104)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;


UPDATE act_app_databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

UPDATE act_cmmn_databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'Tijss-MacBook-Pro.local (192.168.68.104)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;


UPDATE act_cmmn_databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

UPDATE flw_ev_databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'Tijss-MacBook-Pro.local (192.168.68.104)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;


UPDATE flw_ev_databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

UPDATE act_dmn_databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'Tijss-MacBook-Pro.local (192.168.68.104)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;


UPDATE act_dmn_databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE ACT_FO_DATABASECHANGELOGLOCK SET `LOCKED` = 1, LOCKEDBY = '192.168.68.109 (192.168.68.109)', LOCKGRANTED = '2024-02-20 08:16:16.663' WHERE ID = 1 AND `LOCKED` = 0;

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE ACT_CO_DATABASECHANGELOGLOCK SET `LOCKED` = 1, LOCKEDBY = '192.168.68.109 (192.168.68.109)', LOCKGRANTED = '2024-02-20 08:16:16.777' WHERE ID = 1 AND `LOCKED` = 0;

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

