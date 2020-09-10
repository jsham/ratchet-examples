CREATE database srcDB;
CREATE database dstDB;

create table IF NOT EXISTS users2 (
	id bigint unsigned NOT NULL,
	name char(100) DEFAULT NULL
) ENGINE=InnoDB;

create table IF NOT EXISTS users2 (
	id bigint unsigned NOT NULL,
	name char(100) DEFAULT NULL
) ENGINE=InnoDB;


INSERT INTO users(id, name) VALUES(123, 'Alexis');
INSERT INTO users(id, name) VALUES(456, 'Jeongsoo');