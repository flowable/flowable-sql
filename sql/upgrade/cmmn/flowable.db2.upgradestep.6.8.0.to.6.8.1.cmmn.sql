
UPDATE ".ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.68.131 (192.168.68.131)', LOCKGRANTED = TIMESTAMP('2024-02-20 09:01:30.822') WHERE ID = 1 AND LOCKED = 0;

UPDATE ".ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;
