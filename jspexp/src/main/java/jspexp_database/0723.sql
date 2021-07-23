CREATE TABLE Studentexp1(
	sno number,
	name varchar2(100),
	kor number,
	eng number,
	math number
);

INSERT INTO Studentexp1 VALUES (1001, '홍길동', 70, 80, 90);
INSERT INTO Studentexp1 VALUES (1002, '김길동', 60, 70, 100);
INSERT INTO Studentexp1 VALUES (1003, '신길동', 50, 60, 50);
INSERT INTO Studentexp1 VALUES (1004, '마길동', 40, 90, 70);
SELECT * FROM Studentexp1;
-- SELECT * FROM Studentexp1;
-- INSERT INTO Studentexp1 VALUES (?, ?, ?, ?, ?);