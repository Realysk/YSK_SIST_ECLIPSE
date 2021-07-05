/*
 # 0705 정리문제 #
 	1. 프로젝트에 사용할 계정을 생성할려고 한다. prj_user01/8888을 기준으로 계정을 생성하고 테이블을 작성하여 데이터를 입력할려고 한다. 서버에서 설정할 내용을 기술하세요.

		*/
			CREATE USER prj_user01 identified BY 8888;
			GRANT CREATE SESSION TO prj_user01;
			GRANT resource TO prj_user01;
			ALTER USER prj_user01 DEFAULT tablespace users;
			ALTER USER prj_user01 quota unlimited ON users;
		
			GRANT CONNECT, resource, unlimited tablespace
				prj_user01 identified BY 8888;
			
			-- 운영 체제 방화벽 열기 : 지정한 port 기준
		/*
	
	7. 테이블의 제약조건 유형을 기술하세요.
 		
 		1) not null : 열이 null을 포함할 수 없음. (중복 허용 가능)
 		2) unique key : 테이블의 모든 행에서 고유한 값을 갖는 열 또는 열 조합을 지정해야 한다. (중복 허용은 되지 않으나 NULL은 입력 및 중복 가능)
 		3) primary key : 해당 컬럼 값은 반드시 존재해야 하며 유일해야 한다.
 						(not null과 unique가 결합된 형태) 주로 테이블에서 식별 해야할 컬럼 즉 key를 설정할 때 사용된다.
 						(중복 허용 불가, null 허용 불가, index 자동 생성)
 		4) foreign key : 한 열과 참조된 테이블의 열간에 외래 키 관계를 설정하고 시행.
 		5) check : 해당 컬럼에 저장 가능한 데이터 값의 범위나 조건을 지정 처리.
	
	8. 테이블 구조 변경 코드를 기본 예제(컬럼추가, 컬럼 변경, 컬럼 삭제)로 기술하세요.
		
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
	
	9. 인덱스의 생성 형태를 기술하세요.
		
		1) 단일 인덱스 : create index 인덱스명 테이블명(컬럼명);
		2) 유일 인덱스 : create unique 인덱스명 테이블명(컬럼명);
		3) 다중 인덱스 : create index 인덱스명 테이블명(컬럼명1, 컬럼명2 ....)
		4) 역순위 인덱스 : create index 인덱스명 테이블(컬럼명 desc);
	
 */