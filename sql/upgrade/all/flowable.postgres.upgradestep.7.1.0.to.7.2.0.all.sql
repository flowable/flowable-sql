update ACT_GE_PROPERTY set VALUE_ = '7.2.0.0' where NAME_ = 'common.schema.version';

alter table ACT_RU_ACTINST add column COMPLETED_BY_ varchar(255);

update ACT_GE_PROPERTY set VALUE_ = '7.2.0.0' where NAME_ = 'schema.version';


alter table ACT_HI_ACTINST add column COMPLETED_BY_ varchar(255);


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.0' where NAME_ = 'app.schema.version';


ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ASSIGNEE_ VARCHAR(255);
ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD COMPLETED_BY_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD ASSIGNEE_ VARCHAR(255);
ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD COMPLETED_BY_ VARCHAR(255);

update ACT_GE_PROPERTY set VALUE_ = '7.2.0.0' where NAME_ = 'cmmn.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '7.2.0.0' where NAME_ = 'dmn.schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.0' where NAME_ = 'eventregistry.schema.version';


update ACT_ID_PROPERTY set VALUE_ = '7.2.0.0' where NAME_ = 'schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.1' where NAME_ = 'common.schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.1' where NAME_ = 'schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.1' where NAME_ = 'app.schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.1' where NAME_ = 'cmmn.schema.version';


ALTER TABLE ACT_DMN_DEPLOYMENT_RESOURCE
    ADD CONSTRAINT ACT_FK_DMN_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_DMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_DMN_RSRC_DPL ON ACT_DMN_DEPLOYMENT_RESOURCE (DEPLOYMENT_ID_);

update ACT_GE_PROPERTY set VALUE_ = '7.2.0.1' where NAME_ = 'dmn.schema.version';


ALTER TABLE FLW_EVENT_RESOURCE
    ADD CONSTRAINT FLW_FK_EVENT_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES FLW_EVENT_DEPLOYMENT (ID_);

CREATE INDEX FLW_IDX_EVENT_RSRC_DPL ON FLW_EVENT_RESOURCE (DEPLOYMENT_ID_);

update ACT_GE_PROPERTY set VALUE_ = '7.2.0.1' where NAME_ = 'eventregistry.schema.version';

update ACT_ID_PROPERTY set VALUE_ = '7.2.0.1' where NAME_ = 'schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.2' where NAME_ = 'common.schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.2' where NAME_ = 'schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.2' where NAME_ = 'app.schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.2' where NAME_ = 'cmmn.schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.2' where NAME_ = 'dmn.schema.version';


update ACT_GE_PROPERTY set VALUE_ = '7.2.0.2' where NAME_ = 'eventregistry.schema.version';


update ACT_ID_PROPERTY set VALUE_ = '7.2.0.2' where NAME_ = 'schema.version';


