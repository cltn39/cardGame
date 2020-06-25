CREATE DATABASE IF NOT EXISTS cardgame_db;
USE cardgame_db;

DROP TABLE IF EXISTS userAuth;

CREATE TABLE userAuth (
    id int NOT NULL AUTO_INCREMENT,
    first_name varchar(30) NOT NULL,
    last_name varchar(50) NOT NULL,
    passwords int NOT NULL,
    isAUth BOOL DEFAULT false,
    PRIMARY KEY (id)
)