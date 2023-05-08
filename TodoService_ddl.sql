-- person 테이블
CREATE TABLE `person` (
  `personNum` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `lastName` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `personID` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`personNum`),
  UNIQUE KEY `personID_UNIQUE` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;



-- todo 테이블 
CREATE TABLE `todo` (
  `todoNum` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `dueDate` date DEFAULT (curdate()),
  `finished` tinyint DEFAULT NULL,
  `personID` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`todoNum`),
  KEY `todo_ibfk_1` (`personID`),
  CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

