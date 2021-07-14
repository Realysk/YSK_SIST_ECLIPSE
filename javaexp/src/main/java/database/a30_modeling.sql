-- ex) 화면에 있는 entity와 entity 타입을 식별하여 erd

CREATE TABLE entityexp01 (classRoom varchar2(50));
SELECT * FROM entityexp01;

CREATE TABLE entityexp02 (subject varchar2(100));
SELECT * FROM entityexp02;

CREATE TABLE entityexp03 (teacher varchar2(100));
SELECT * FROM entityexp03;

CREATE TABLE lecture (
	classRoom varchar2(50),
	subject varchar2(100),
	teacher varchar2(100)
);
INSERT INTO entityexp01 VALUES('102호');
INSERT INTO entityexp02 VALUES('DATA MODELING');
INSERT INTO entityexp03 VALUES('김경재');
INSERT INTO lecture VALUES('101호', 'J2EE', '이춘식');
INSERT INTO lecture VALUES('102호', 'DATA MODELING', '김경재');
SELECT * FROM lecture;