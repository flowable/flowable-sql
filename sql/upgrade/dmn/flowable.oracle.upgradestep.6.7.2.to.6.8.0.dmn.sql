
UPDATE FLOWABLE.ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = TO_TIMESTAMP('2022-12-21 17:24:31.37', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

CREATE INDEX FLOWABLE.ACT_IDX_DMN_INSTANCE_ID ON FLOWABLE.ACT_DMN_HI_DECISION_EXECUTION(INSTANCE_ID_);

INSERT INTO FLOWABLE.ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('9', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', SYSTIMESTAMP, 8, '8:0fe82086431b1953d293f0199f805876', 'createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '4.3.5', '1643473530');

UPDATE FLOWABLE.ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

