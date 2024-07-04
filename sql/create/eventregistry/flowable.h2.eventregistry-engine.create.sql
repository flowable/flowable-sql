CREATE TABLE FLW_EVENT_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOY_TIME_ TIMESTAMP, TENANT_ID_ VARCHAR(255), PARENT_DEPLOYMENT_ID_ VARCHAR(255), CONSTRAINT PK_FLW_EVENT_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE FLW_EVENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_FLW_EVENT_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE FLW_EVENT_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), VERSION_ INT, KEY_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(255), DESCRIPTION_ VARCHAR(255), CONSTRAINT PK_FLW_EVENT_DEFINITION PRIMARY KEY (ID_));

CREATE UNIQUE INDEX ACT_IDX_EVENT_DEF_UNIQ ON FLW_EVENT_DEFINITION(KEY_, VERSION_, TENANT_ID_);

CREATE TABLE FLW_CHANNEL_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), VERSION_ INT, KEY_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), CREATE_TIME_ TIMESTAMP, TENANT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(255), DESCRIPTION_ VARCHAR(255), CONSTRAINT PK_FLW_CHANNEL_DEFINITION PRIMARY KEY (ID_));

CREATE UNIQUE INDEX ACT_IDX_CHANNEL_DEF_UNIQ ON FLW_CHANNEL_DEFINITION(KEY_, VERSION_, TENANT_ID_);

ALTER TABLE FLW_CHANNEL_DEFINITION ADD TYPE_ VARCHAR(255);

ALTER TABLE FLW_CHANNEL_DEFINITION ADD IMPLEMENTATION_ VARCHAR(255);
