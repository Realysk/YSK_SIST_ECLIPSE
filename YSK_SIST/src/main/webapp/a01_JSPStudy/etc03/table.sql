DROP TABLE IF EXISTS tblPMember;

CREATE TABLE `tblPMember` (
	`id` CHAR(20) NOT NULL,
	`pwd` CHAR(20) NOT NULL,
	`name` CHAR(20) NOT NULL,
	`profile` CHAR(30) NOT NULL,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS tblPBlog;

CREATE TABLE `tblPBlog` (
	`num` INT(11) NOT NULL AUTO_INCREMENT,
	`message` CHAR(255) NOT NULL,
	`id` CHAR(20) NOT NULL,
	`pdate` DATETIME NOT NULL,
	`photo` CHAR(50) NOT NULL,
	`hcnt` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`num`)
);

DROP TABLE IF EXISTS tblPReply;

CREATE TABLE `tblPReply` (
	`rnum` INT(11) NOT NULL AUTO_INCREMENT,
	`num` INT(11) NOT NULL,
	`id` CHAR(20) NOT NULL,
	`rdate` DATETIME NOT NULL,
	`comment` CHAR(100) NOT NULL,
	PRIMARY KEY (`rnum`)
);