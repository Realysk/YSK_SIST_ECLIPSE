
-- 작업 OnTask 
-- 작업번호(pk), 작업명, 작업내용, 작업등록일, 작업수정일, 작업시작일, 작업종료일, 작업 진행상태, 작업 우선순위, 작업 상위번호, 작업 담당자(fk) 
-- task_no, task_name, task_content, task_regdte, task_uptdte, task_startdte, task_enddte, task_state, task_prior, taskref_no, emp_no

DROP TABLE OnTask;
CREATE TABLE OnTask (
	task_no NUMBER PRIMARY KEY , -- *작업번호(id)
	task_name varchar2(100), -- *작업명(text)
	task_startdte varchar2(50), -- *작업 시작일(start_date)
	task_enddte varchar2(50), -- 작업 종료일(end_date)
	task_duration NUMBER, -- *작업 기간(duration)
	task_progress NUMBER, -- *작업 진행퍼센트(progress)
	taskref_no NUMBER, -- *상위작업번호(parent)
	task_prior varchar2(20), -- *작업 우선순위(priority)
	task_content varchar2(1000), -- *작업내용
	task_regdte varchar2(50), -- 작업 등록일
	task_uptdte varchar2(50), -- 작업 수정일
	task_state varchar2(20), -- 작업 진행상태
	mem_no varchar2(10) -- 작업 담당자(fk)
);


DROP SEQUENCE OnTask_seq;
CREATE SEQUENCE OnTask_seq
   INCREMENT BY 1   
   START WITH 1
   MINVALUE 1
   MAXVALUE 999999;

  
 SELECT * FROM OnTask;
 
 DELETE FROM ontask WHERE task_no=20; 

 -- 작업할당 확인 1001 이정호(PM.)
SELECT * FROM onemp;
SELECT * FROM onemp_auth;

SELECT * FROM onproject_member;

SELECT DISTINCT emp_korname, opm.mem_no
		FROM OnProject_member opm, OnProject op, OnEmp oe
		WHERE opm.emp_no = oe.emp_no
		AND (opm.pro_no = op.pro_no AND opm.pro_no = 'pro1001')
		AND mem_state = '활동';
	

select om.auth_name, o.* ,  
from onemp o, onEmp_auth om
where om.auth_no = o.auth_no 
and emp_no = '1001' and emp_pass = 'zip1234';


-- pro1001 프로젝트1
-- mem1004(PM), mem1001(TM) 
INSERT INTO OnTask values(OnTask_seq.nextval, '분석', '2021-09-02', '2021-09-07', 
	to_date('2021-09-07')-to_date('2021-09-02'), NULL, 0, null, '분석중입니다', '2021-09-01', NULL, '진행완료','mem1004'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '화면 분석', '2021-09-02', '2021-09-07', 
	to_date('2021-09-07')-to_date('2021-09-02'),  NULL, 1, '1', '화면 분석중입니다', '2021-09-01', NULL, '진행완료','mem1001'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '설계', '2021-09-08', '2021-09-11', 
	to_date('2021-09-11')-to_date('2021-09-08'),  NULL, 0, null, '설계 과정입니다', '2021-09-01', NULL, '진행완료','mem1004'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '와이어프레임 설계', '2021-09-08', '2021-09-10',
	to_date('2021-09-10')-to_date('2021-09-08'),  NULL, 3, '2', '와이어프레임 작성중입니다', '2021-09-01', NULL, '진행완료','mem1001'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '구현', '2021-09-13', '2021-09-20', 
	to_date('2021-09-20')-to_date('2021-09-13'), NULL, 0, NULL, '구현과정입니다', '2021-09-01', NULL, '진행완료','mem1004');

INSERT INTO OnTask values(OnTask_seq.nextval, '로그인 구현', '2021-09-12', '2021-09-18', 
	to_date('2021-09-18')-to_date('2021-09-12'), NULL, 5, '3', '로그인 세션설정중입니다', '2021-09-01', NULL, '진행완료','mem1001'); 


-- pro1002 프로젝트2 : 쇼핑몰프로젝트
-- mem1007(PM), mem1010(TM)
INSERT INTO OnTask values(OnTask_seq.nextval, '쇼핑몰 분석', '2021-09-15', '2021-09-20', 
	to_date('2021-09-20')-to_date('2021-09-15'), NULL, null, null, '분석중입니다', '2021-09-10', NULL, '진행완료','mem1007'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '와이어프레임 분석', '2021-09-15', '2021-09-20', 
	to_date('2021-09-20')-to_date('2021-09-15'),  NULL, 7, '1', '화면 분석중입니다', '2021-09-10', NULL, '진행완료','mem1010'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '쇼핑몰 설계', '2021-09-20', '2021-09-25', 
	to_date('2021-09-25')-to_date('2021-09-20'),  NULL, null, null, '설계 과정입니다', '2021-09-10', NULL, '진행완료','mem1007'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '메인화면 설계', '2021-09-20', '2021-09-25',
	to_date('2021-09-25')-to_date('2021-09-20'),  NULL, 9, '2', '와이어프레임 작성중입니다', '2021-09-10', NULL, '진행중','mem1010'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '쇼핑몰 구현', '2021-09-25', '2021-10-07', 
	to_date('2021-10-07')-to_date('2021-09-25'), NULL, null, NULL, '구현과정입니다', '2021-09-10', NULL, '진행중','mem1007');

INSERT INTO OnTask values(OnTask_seq.nextval, '로그인 구현', '2021-09-25', '2021-09-30', 
	to_date('2021-09-30')-to_date('2021-09-25'), NULL, 11, '3', '로그인 세션설정중입니다', '2021-09-10', NULL, '진행중','mem1010'); 

INSERT INTO OnTask values(OnTask_seq.nextval, '쇼핑리스트 구현', '2021-10-01', '2021-10-07', 
	to_date('2021-10-07')-to_date('2021-10-01'), NULL, 11, '4', '쇼핑리스트 구현중입니다', '2021-09-10', NULL, '진행중','mem1010'); 

SELECT * FROM ontask;


UPDATE ontask
	SET TASK_STATE = '진행완료'
WHERE task_no = 10;

-- [내작업] 작업리스트 조회
SELECT op.pro_name, oa.app_state, ot.*
FROM ontask ot, onapproval oa, onproject_member opm, onproject op
WHERE ot.mem_no = opm.mem_no AND opm.emp_no = '1001'
AND (opm.pro_no = op.pro_no AND opm.pro_no = 'pro1001')
AND ot.task_no = oa.task_no(+)
ORDER BY ot.task_no DESC;

-- [내작업] 작업리스트 검색
SELECT op.pro_name, oa.app_state, ot.*
FROM ontask ot, onproject_member opm, onproject op, onapproval oa
WHERE opm.pro_no = op.pro_no AND ot.task_no = oa.task_no(+)
AND (ot.mem_no = opm.mem_no AND ot.mem_no = 'mem1004')
AND (ot.task_name LIKE '%'||''||'%' OR ot.task_content LIKE '%'||''||'%')
ORDER BY ot.task_no DESC;

SELECT ot.mem_no, otm.emp_no
FROM ontask ot, onproject_member otm, onproject op
WHERE ot.mem_no = otm.mem_no AND otm.pro_no = op.pro_no;


SELECT * FROM ontask WHERE mem_no = 'mem1001';


SELECT * FROM onapproval WHERE app_no='app1013';
SELECT * FROM onproject_member WHERE mem_no = 'mem1004';
SELECT * FROM onemp;



/* ================================================================================================= */

-- 결재 요청 
INSERT INTO OnApproval VALUES ('app'||(OnApproval_seq.nextval), to_char(sysdate, 'YYYY-MM-DD'), '승인대기', 
to_char(sysdate+7, 'YYYY-MM-DD'), NULL, app_content, NULL, mem_no, task_no, NULL);

-- 결재기한 : 결재 등록일의 +7일
SELECT to_char(sysdate+7, 'YYYY-MM-DD') FROM OnApproval;

SELECT * FROM onproject;
SELECT * FROM OnApproval;
SELECT * FROM ontask;

-- 결재담당자 : 프로젝트멤버중 PM 찾기
SELECT opm.mem_no
FROM onproject_member opm, onemp oe
WHERE opm.emp_no = oe.emp_no
AND pro_no='pro1001'
AND oe.auth_no='a01';


-- 결재 상세정보 확인
SELECT ot.task_no, app_no, app_content, app_comment, opt_name, opt_doctype
FROM Ontask ot, OnApproval op, Onoutput oop
WHERE ot.task_no = op.task_no
AND ot.task_no = oop.task_no
AND ot.task_no = 10;

SELECT * FROM OnApproval;
SELECT * FROM onoutput;



/* ================================================================================================= */



-- 간트에서 날짜의 양식이 DD-MM-YYYY
-- 간트 필요정보 : id(task_no), text(task_name), start_date(task_startDte), duration, 
--			progress, parent(taskref_no), holder(mem_no?name?), priority
-- {"id":"3", "text":"Task #2", "start_date":"11-04-2020", "duration":8, 
--			"progress":0.6, "parent":1, "holder":"Alex", "priority":"Low"}
-- task_no, task_name, task_startdte, task_enddte, task_duration, task_progress, taskref_no, 
--		task_prior, task_content, task_regdte, task_uptdte, task_state, mem_no 
-- task_no/Number로 변경, 날짜관련 다 String으로 변경, 기간+퍼센트 추가, refno도 NUMBER로 변경
DROP TABLE OnGantt;
CREATE TABLE OnGantt (
	task_no NUMBER PRIMARY KEY , -- *작업번호(id)
	task_name varchar2(100), -- *작업명(text)
	task_startdte varchar2(50), -- *작업 시작일(start_date)
	task_enddte varchar2(50), -- 작업 종료일(end_date)
	task_duration NUMBER, -- *작업 기간(duration)
	task_progress NUMBER, -- *작업 진행퍼센트(progress)
	taskref_no NUMBER, -- *상위작업번호(parent)
	task_prior varchar2(20), -- *작업 우선순위(priority)
	task_content varchar2(1000), -- 작업내용
	task_regdte varchar2(50), -- 작업 등록일
	task_uptdte varchar2(50), -- 작업 수정일
	task_state varchar2(20), -- 작업 진행상태
	mem_no varchar2(10) -- 작업 담당자(fk)
);


  
DROP SEQUENCE OnGantt_seq;
CREATE SEQUENCE OnGantt_seq
   INCREMENT BY 1   
   START WITH 1
   MINVALUE 1
   MAXVALUE 999999;





SELECT * FROM OnGantt;


SELECT DISTINCT ot.mem_no
FROM ontask ot, onproject_member otm, onproject op
WHERE ot.mem_no = otm.mem_no AND otm.pro_no = op.pro_no
AND op.pro_no = 'pro1001' AND otm.emp_no = '1001';

SELECT op.pro_name, ot.*
FROM ontask ot, onproject_member opm, onproject op, onEmp oe
WHERE ot.mem_no = opm.mem_no
AND (opm.pro_no = op.pro_no AND opm.pro_no = #{pro_no})
AND	(opm.emp_no = oe.emp_no AND opm.emp_no = #{emp_no})
ORDER BY ot.task_no DESC;



INSERT INTO OnGantt values(OnGantt_seq.nextval, '분석', '2021-09-02', '2021-09-07', 
	to_date('2021-09-07')-to_date('2021-09-02'), NULL, 0, null, '분석중입니다', '2021-09-01', NULL, '진행완료','mem1004'); 

INSERT INTO OnGantt values(OnGantt_seq.nextval, '화면 분석', '2021-09-02', '2021-09-07', 
	to_date('2021-09-07')-to_date('2021-09-02'),  NULL, 1, '1', '화면 분석중입니다', '2021-09-01', NULL, '진행완료','mem1001'); 

INSERT INTO OnGantt values(OnGantt_seq.nextval, '설계', '2021-09-08', '2021-09-11', 
	to_date('2021-09-11')-to_date('2021-09-08'),  NULL, 0, null, '설계 과정입니다', '2021-09-01', NULL, '진행완료','mem1004'); 

INSERT INTO OnGantt values(OnGantt_seq.nextval, '와이어프레임 설계', '2021-09-08', '2021-09-10',
	to_date('2021-09-10')-to_date('2021-09-08'),  NULL, 3, '2', '와이어프레임 작성중입니다', '2021-09-01', NULL, '진행중','mem1001'); 

INSERT INTO OnGantt values(OnGantt_seq.nextval, '구현', '2021-09-13', '2021-09-20', 
	to_date('2021-09-20')-to_date('2021-09-13'), NULL, 0, NULL, '구현과정입니다', '2021-09-01', NULL, '진행중','mem1004');

INSERT INTO OnGantt values(OnGantt_seq.nextval, '로그인 구현', '2021-09-12', '2021-09-18', 
	to_date('2021-09-18')-to_date('2021-09-12'), NULL, 5, '3', '로그인 세션설정중입니다', '2021-09-01', NULL, '진행중','mem1001'); 
	
-- 조회
-- 프로젝트 참여멤버 리스트 조회
SELECT DISTINCT emp_korname, opm.mem_no
FROM OnProject_member opm, OnProject op, OnEmp oe
WHERE opm.emp_no = oe.emp_no
AND (opm.pro_no = op.pro_no AND opm.pro_no = 'pro1001')
AND mem_state = '활동';



-- 프로젝트의 작업가져오기 
SELECT op.pro_name, ot.*
FROM ontask ot, onproject_member opm, onproject op
WHERE ot.mem_no = 'mem1004'
AND ot.mem_no = opm.mem_no;


-- 간트차트 일정 구하기 (팀단위로 확인)
SELECT op.pro_name, ot.*, oe.emp_korname
FROM OnGantt ot, onproject_member opm, onproject op, OnEmp oe
WHERE ot.mem_no = opm.mem_no
AND opm.pro_no = op.pro_no
AND	opm.emp_no = oe.emp_no;

-- 프로젝트별 구하기
SELECT DISTINCT op.pro_name, op.pro_no
FROM ontask ot, onproject_member otm, onproject op, onemp oe
WHERE ot.mem_no = otm.mem_no
AND otm.pro_no = op.pro_no
AND otm.emp_no = oe.emp_no
AND otm.emp_no = '1026';


SELECT op.pro_name, ot.*
FROM ontask ot, onproject_member opm, onproject op
WHERE ot.mem_no = opm.mem_no
AND opm.pro_no = op.pro_no
AND ot.mem_no = 'mem1001'
AND (ot.task_name LIKE '%'||''||'%' OR ot.task_content LIKE '%'||''||'%');



SELECT * FROM onproject_member;




-- project 이름을 가져옴
-- 
SELECT *
FROM onproject op;



-- 시작일로부터 작업기간 구하기 (간트의 날짜유형에 맞춰 변경해서 다시 변경..)
SELECT (to_date(task_enddte, 'DD-MM-YYYY')-to_date(task_startdte, 'DD-MM-YYYY')) 기간  
FROM OnGantt ot;
SELECT to_date(task_enddte, 'DD-MM-YYYY') 기간  
FROM OnGantt ot;


            
SELECT op.pro_name, ot.*
FROM OnGantt ot, onproject_member opm, onproject op
WHERE ot.mem_no = opm.mem_no
AND opm.pro_no = op.pro_no
AND ot.mem_no = 'mem1001';

-- 작업_산출물
-- 작업 파일번호(pk), 작업_파일명, 작업_파일분류, 작업_파일등록일, 작업번호(fk)
CREATE TABLE OnOutput (
	opt_no varchar2(10) NOT NULL, -- 작업_파일번호
	opt_name varchar2(50), -- 작업_파일명
	opt_doctype varchar2(30), -- 작업_파일분류
	opt_regDte DATE, -- 작업_파일등록일
	task_no varchar2(10) -- 작업번호
);

SELECT * FROM onoutput;



-- 1006 아래는 수정예정입니다 

-- 프로젝트 이름 조회
SELECT DISTINCT op.pro_name, op.pro_no
FROM ontask ot, onproject op, OnProject_Member opm
WHERE ot.mem_no = opm.mem_no
AND opm.pro_no = op.pro_no
AND ot.mem_no = 'mem1001';



-- 프로젝트별로 간트차트 조회 (간트차트로는 팀별 조회)
SELECT * 
FROM ontask 
WHERE pro_no = 'pro1001';


-- 프로젝트별로 내작업 조회 (개인별로 프로젝트별 조회)
SELECT * 
FROM ontask 
WHERE mem_no = 'mem1001'
ORDER BY task_no DESC;

SELECT * 
FROM ontask 
WHERE emp_no = '1026'
AND pro_no = 'pro1001'
ORDER BY task_no DESC;


SELECT op.pro_name, ot.*
FROM ontask ot, onproject_member opm, onproject op
WHERE ot.mem_no = opm.mem_no
AND opm.pro_no = op.pro_no
AND ot.mem_no = 'mem1001' 
ORDER BY ot.task_no DESC;



-- 검색 (작업명이나 작업내용에서 검색)
SELECT op.pro_name, ot.*
FROM ontask ot, onproject_member opm, onproject op, onEmp oe
WHERE ot.mem_no = opm.mem_no
AND (opm.pro_no = op.pro_no AND opm.pro_no = 'pro1002')
AND	(opm.emp_no = oe.emp_no AND opm.emp_no = '1026')
AND (ot.task_name LIKE '%'||''||'%' OR ot.task_content LIKE '%'||''||'%')
ORDER BY ot.task_no desc;
