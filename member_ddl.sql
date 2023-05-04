CREATE TABLE `member` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(45)  NOT NULL,
  `pw` varchar(45) NOT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `uname` varchar(45) NOT NULL,
  `uphoto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ;
