UPDATE ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = TRUE, LOCKEDBY = 'Tijss-MacBook-Pro.local (192.168.68.104)', LOCKGRANTED = NOW() WHERE ID = 1 AND LOCKED = FALSE;


DROP INDEX ACT_IDX_DEC_TBL_UNIQ;

ALTER TABLE ACT_DMN_DECISION_TABLE RENAME TO ACT_DMN_DECISION;

CREATE UNIQUE INDEX ACT_IDX_DMN_DEC_UNIQ ON ACT_DMN_DECISION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('7', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 6, '9:d24d4c5f44083b4edf1231a7a682a2cd', 'dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION', '', 'EXECUTED', NULL, NULL, '4.27.0', '9917077635');

ALTER TABLE ACT_DMN_DECISION ADD DECISION_TYPE_ VARCHAR(255);

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('8', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 7, '9:3998ef0958b46fe9c19458183952d2a0', 'addColumn tableName=ACT_DMN_DECISION', '', 'EXECUTED', NULL, NULL, '4.27.0', '9917077635');

UPDATE ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

