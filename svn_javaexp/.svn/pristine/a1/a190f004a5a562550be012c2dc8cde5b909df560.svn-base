/*
# 정리문제
1. 무결성 제약 조건 5가지의 기본개념과 형식을 기술하세요.
       1) not null : 열이 null을 포함할 수 없음.
          CREATE TABLE student01(
         name varchar2(30) CONSTRAINT student01_name_nn NOT NULL);
            INSERT INTO student01 VALUES ('홍길동');
            INSERT INTO student01 VALUES ('김길동');
            INSERT INTO student01 VALUES (null);
         SELECT * FROM student01;
       
       2) unique key : 테이블의 모든 행에서 고유한 값을 갖는 열 또는 열조합
          CREATE TABLE student03(
         sno NUMBER(5) CONSTRAINT student03_sno_uq UNIQUE);
            INSERT INTO student03 VALUES(1);
            INSERT INTO student03 VALUES(2);
            INSERT INTO student03 VALUES(NULL); -- 에러발생하지 않음..
            INSERT INTO student03 VALUES(3);
            INSERT INTO student03 VALUES(NULL); -- 에러발생하지 않음..
            INSERT INTO student03 VALUES(1); -- 에러발생..
         SELECT * FROM student03;
       
       3) primary key : 해당 컬럼 값은 반드시 존재해야 하며 유일해야 한다.
       	 (not null과 unique가 결합된 형태)
          CREATE TABLE employee06(
         empno NUMBER(4) CONSTRAINT employee06_empno_pk PRIMARY KEY); -- 제약조건의 이름이 지정이 안된다.
            INSERT INTO employee06 VALUES(1000);
            INSERT INTO employee06 VALUES(1001);
            INSERT INTO employee06 VALUES(1002);
            INSERT INTO employee06 VALUES(NULL);-- 에러발생
            INSERT INTO employee06 VALUES(1001);-- 에러발생.
         SELECT * FROM employee06;
       
       4) foreign key : 한 열과 참조된 테이블의 열간에 외래 키 관계를 설정하고 시행
          ex) 사원의 테이블의 부서번호는 반드시 부서테이블에 있는 부서번호이어야 한다.
         -- 교수 테이블 생성
         CREATE TABLE teacher01(
         tno NUMBER PRIMARY KEY);
            INSERT INTO teacher01 VALUES(10);
            INSERT INTO teacher01 VALUES(11);
            INSERT INTO teacher01 VALUES(12);
         SELECT * FROM teacher01;

         CREATE TABLE student07(
         name varchar2(50),
         tno NUMBER CONSTRAINT student07_tno_fk REFERENCES teacher01(tno));
            INSERT INTO student07 VALUES('홍길동',10);
            INSERT INTO student07 VALUES('신길동',11);
            INSERT INTO student07 VALUES('마길동',13);
            INSERT INTO student07 VALUES('오길동',12);
         SELECT * FROM student07;       
       
       5) check : 해당 컬럼에 저장 가능한 데이터 값의 범위나 조건을 지정처리.
         CREATE TABLE student05(
         gender varchar2(1) CHECK(gender IN ('F','M')));
            INSERT INTO student05 VALUES('F');
            INSERT INTO student05 VALUES('M');
            INSERT INTO student05 VALUES('K');-- 에러발생
            INSERT INTO student05 VALUES(NULL); -- 에러발생하지 않음.
            INSERT INTO student05 VALUES('M');
         SELECT * FROM student05;
2. 학생테이블과 학과정보테이블을 활용해 위 무결성 제약 조건을 설정해보세요.
    학생테이블(학생번호,이름,학년,주민번호,학과정보번호)
    	학생번호 : primary key
    	이름 : not null
    	학년 : check
    	주민번호 : unique
    	학과정보번호 : foreign key
    학과정보테이블(학과정보번호,학과명,학과위치)
    	학과정보번호 : primary eky
	create table department(
		dno number primary key,
		dname varchar2(50),
		loc varchar2(100)
	);
	create table student10(
		sno number primary key,
		name varchar2(50) not null,
		grade number check(grade between 1 and 4),
		citynum char(13) unique,
		dno number references department(dno)
	);
3. 시퀀스를 9999~1001 범위로 작성하세요.
CREATE SEQUENCE seq001
   increment by -1
   start with 9999
   maxvalue 9999
   minvalue 1001;	



 * */