
UPDATE ".FLW_EV_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = TIMESTAMP('2022-12-21 18:28:04.181') WHERE ID = 1 AND LOCKED = 0;

UPDATE ".FLW_EV_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

