UPDATE act_dmn_databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'Tijss-MacBook-Pro.local (192.168.68.104)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;


CREATE INDEX ACT_IDX_DMN_INSTANCE_ID ON ACT_DMN_HI_DECISION_EXECUTION(INSTANCE_ID_);

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('9', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 9, '9:5c9dc65601456faa1aa12f8d3afe0e9e', 'createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '4.27.0', '9864511654');

UPDATE act_dmn_databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

