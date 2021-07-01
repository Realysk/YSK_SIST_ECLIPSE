/*
 # 테이블 이름 변경
 	rename 테이블명 to 변경할테이블명;
 # 컬럼명 변경
 	alter table 테이블명
 	rename column 컬럼명 to 변경할컬럼명;
 */
SELECT * FROM emp33;
SELECT * FROM emp33_new;
RENAME emp33 TO emp33_new;
ALTER TABLE emp33_new
RENAME COLUMN empno TO NO;