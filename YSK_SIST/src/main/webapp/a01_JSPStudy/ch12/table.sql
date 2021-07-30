DROP TABLE IF EXISTS tblRegister;

CREATE TABLE tblRegister(
	id VARCHAR(20) NOT NULL,
	pwd VARCHAR(20) NOT NULL,
	name CHAR(6) NULL,
	num1 CHAR(6) NULL,
	num2 CHAR(7) NULL,
	email VARCHAR(30) NULL,
	phone VARCHAR(30) NULL,
	zipcode CHAR(5) NULL,
	address VARCHAR(60) NULL,
	job VARCHAR(30) NULL
);