/*
 # 데이터베이스 보안을 위한 권한 설정
 	1. 데이터베이스 관리자(DBA)는 사용자가 데이터베이스 객체(테이블,view,sequence...)에 대한 특정 권한을 가질 수 있게 하여
 	   다수의 사용자가 데이터베이스에 저장 된 정보를 공유하면서도 정보에 대한 보안이 이루어지도록 한다.
 	2. DB 서버에 접근 시 필요한 사용자 계정/암호를 통해 로그인 인증을 받는다.
 	3. 권한의 역할과 종류
 		1) create user : 사용자를 새롭게 생성하는 권한
 		2) drop user : 사용자를 삭제하는 권한
 		3) drop any table : 테이블을 삭제하는 권한
 		4) query rewrite : 함수 기반 index 생성 권한
 		5) backup any table : 테이블 백업 권한
 		6) create session : 데이터베이스에 접속할 수 있는 권한
 		7) create table/view/sequence/procedure : 데이터베이스의 객체들을 생성하는 권한. 
 */

/*
 # 추가 사용자 생성
 	1. system 관리자 계정으로 접근하여 scott에 dba 권한을 부여하여 계정 생성과 권한 부여가 가능하게 해야 한다.
 	2. 권한 부여 (0702 학원에서도 권한 부여!)
 		cmd
 		sqlplus
 		system/1111
 		grant dba to scott;
 	3. 사용자 생성
 		create user 사용자명 identified by 비밀번호;
 	4. 권한 부여
 		grant 권한명 to 계정명;
 		create session - 접속권한
 */
CREATE USER orauser01 IDENTIFIED BY user01;
GRANT CREATE SESSION TO orauser01;
CREATE USER orauser02 IDENTIFIED BY user02;
GRANT CREATE SESSION TO orauser02;

-- ex) himan/7777 계정을 만들고 접속 권한을 부여한 후 접속 확인해주세요.
/*
 # 접속 방법
 	1. sqlplus
 		user-name : 사용자
 		password : 비밀번호
 		입력
 	2. conn 사용자/비밀번호
 	3. 현재 접속할 수 있는 계정
 		system/1111
 		scott/tiger
 */
CREATE USER himan IDENTIFIED BY 7777;
GRANT CREATE SESSION TO himan;

/*
 # 사용자 계정별로 지원에 대한 접근 권한 설정
 	1. 테이블 생성 권한 부여
 		grant create table to 계정명;
 		ex) grant create table to orauser01;
 	2. 전체 oracle에서 사용되는 여러 객체(테이블, index, sequence..)에 대한 권한 부여
 		grant resource to 계정명;
 	3. 전체적인 계정에 대한 권한 부여 내용 확인하는 테이블
 		dba_users
 	4. 테이블(물리적으로 저장이 필요 한 객체) tablespace라는 저장 공간을 할당.
 		alter user 사용자명 default tablespace users; -- 사용자가 사용 할 물리적 tablespace 설정.
 		alter user 사용자명 quota unlimited on users; -- 사용자가 사용 할 tablespace의 용량 지정.
 		
 # 특정한 사용자가 테이블을 사용 하기 위하여
 	0. dba권한이 있는 권한자로 접속 후
 	1. 계정 생성 : create user 사용자명 identified by 비밀번호
 	2. 접속할 수 있는 권한 부여 : grant create session to 사용자명;
 	3. 자원(테이블 등 여러 객체)을 사용할 수 있는 권한 : grant resource to 사용자명;
 	4. 해당 사용자가 사용 할 물리적 공간(tablespace) 설정 : alter user 사용자명 default tablespace 테이블스페이스명
 	5. 사용자가 물리적 공간을 사용 할 용량 설정 : alter user 사용자명 quota 용량 on 테이블스페이스명;
 */

CREATE USER goodman IDENTIFIED BY 8888;
GRANT CREATE SESSION TO goodman;
GRANT resource TO goodman;
ALTER USER goodman DEFAULT tablespace users;
ALTER USER goodman quota unlimited ON users;