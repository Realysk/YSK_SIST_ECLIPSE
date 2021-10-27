--1. 프로젝트에 사용할 계정을 생성할려고 한다. prj_user01/8888을 기준으로 계정을 생성하고,
--    테이블을 작성하여 데이터를 입력할려고 한다. 서버에서 설정할 내용을 기술하세요.
/*
create user prj_user01 identified by 8888;
GRANT CREATE SESSION TO prj_user01;
GRANT resource TO prj_user01;
ALTER USER prj_user01 DEFAULT tablespace users;
ALTER USER prj_user01 quota unlimited ON users;

grant connect, resource, unlimited tablespace
	prj_user01 identified by 8888;

운영체제 방화벽 열기 처리.. : 지정한 port 기준
	
 * */

--7. 테이블의 제약조건 유형을 기술하세요.
/*
	unique : 중복허용하지 않음. null은 입력가능 및 중복가능
	not null : null이 허용되지 않음. 중복가능
	primary key : 중복허용 불가, null 허용되지 않음, index가 자동으로 생성.
		주로 테이블에 특정한 컬럼을 기준으로 key를 설정할 때, 활용된다.
	foreign key : 외부에 있는 테이블의 테이터를 기준으로, 해당 컬럼에
		데이터를 입력해야하는 경우에 사용한다.
	check : 입력할 수 있는 데이터의 특정한 범위를 지정할 경우 사용 된다.
			
	
 * */
--8. 테이블 구조 변경 코드를 기본 예제(컬럼추가, 컬럼 변경, 컬럼 삭제)로 기술하세요.
/*
	alter table 테이블명
	add 컬럼명 데이터 유형;
		alter table emp10
		add dname varchar2(10);
	alter table 테이블명
	modify 변경할컬럼 데이터유형;
		alter table emp10
		modify comm number(10,3);
	alter table 테이블명
	drop column 컬럼명;
		alter table emp10
		drop column deptno;
 * 
 * */
--9. 인덱스의 생성 형태를 기술하세요.
--	1) 단일 인덱스	create index 인덱스명  테이블명(컬럼명);
--	2) 유일 인덱스 create unique 인덱스명  테이블명(컬럼명);
--	3) 다중 인덱스	create index 인덱스명 테이블명(컬럼명1, 컬럼명2....)
--	4) 역순위 인텍스 create index 인덱스명 테이블(컬럼명 desc);



