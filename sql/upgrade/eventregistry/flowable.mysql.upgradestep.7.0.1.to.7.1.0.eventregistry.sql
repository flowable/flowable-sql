UPDATE flw_ev_databasechangeloglock SET `LOCKED` = 1, LOCKEDBY = 'Tijss-MacBook-Pro.local (192.168.68.104)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;


UPDATE flw_ev_databasechangeloglock SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

