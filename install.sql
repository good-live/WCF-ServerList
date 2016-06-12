DROP TABLE IF EXISTS wcf1_serverlist_servers;
CREATE TABLE wcf1_serverlist_servers (
	serverID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	name VARCHAR(50) NOT NULL,
	host VARCHAR(50) NOT NULL,
	port INT(10) NOT NULL,
	queryport INT(10) NOT NULL,
	game VARCHAR(50) NOT NULL,
);