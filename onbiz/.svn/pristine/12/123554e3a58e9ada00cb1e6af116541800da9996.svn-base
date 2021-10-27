DROP TABLE OnBoard;
CREATE TABLE OnBoard (
	bd_no NUMBER PRIMARY KEY, -- 게시물번호 (pk) (데이터유형 VARCHAR2(10) -> NUMBER)
	bd_refno NUMBER, -- 답변의 상위 글 번호
	bd_name VARCHAR2(100) NOT NULL, -- 게시물 제목 (nn)
	bd_content VARCHAR2(1000) NOT NULL, -- 게시물 내용 (nn) (데이터유형크기 300 -> 1000)
	bd_viewcnt NUMBER NOT NULL, -- 게시물 조회수 (nn)
	bd_regdte DATE NOT NULL, -- 게시물 등록일 (nn)
	bd_uptdte DATE, -- 게시물 수정일 (nn)
	mem_no VARCHAR2(10) -- 사원번호 (작성자) (fk)
);

DROP SEQUENCE OnBoard_seq;
CREATE SEQUENCE OnBoard_seq
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 999999;

-- 프로젝트, 사원 데이터 생기면 추가예정
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '1차 공지사항', '새로운 프로젝트가 등록되었습니다. 임원분들께서는 필히 확인 부탁드립니다.', 0, '2021-09-01', '2021-09-01', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '2차 공지사항', '프로젝트에 필요한 서류 목록을 첨부합니다, 참고 부탁드립니다.', 0, '2021-09-02', '2021-09-02', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '3차 공지사항', '새로운 프로젝트가 등록되었습니다. 임원분들께서는 필히 확인 부탁드립니다.', 0, '2021-09-03', '2021-09-03', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '4차 공지사항', '프로젝트에 필요한 서류 목록을 첨부합니다, 참고 부탁드립니다.', 0, '2021-09-04', '2021-09-04', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '5차 공지사항', '해당 프로젝트에 대한 새로운 작업이 등록되었습니다. 임원분들께서는 필히 확인 부탁드립니다.', 0, '2021-09-05', '2021-09-05', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '6차 공지사항', '해당 프로젝트에 대한 새로운 작업이 등록되었습니다. 임원분들께서는 필히 확인 부탁드립니다.', 0, '2021-09-06', '2021-09-06', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '7차 공지사항', '이틀 뒤, 시스템 점검이 있을 예정입니다. 임원분들의 양해 부탁드립니다.', 0, '2021-09-07', '2021-09-07', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '8차 공지사항', '오늘은 수요일입니다. 좋은 하루 보내세요.', 0, '2021-09-08', '2021-09-08', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '9차 공지사항', '오늘은 목요일입니다. 좋은 하루 보내세요.', 0, '2021-09-09', '2021-09-09', 'mem1004');
INSERT INTO OnBoard VALUES (OnBoard_seq.nextval, 0, '10차 공지사항', '해당 프로젝트에 대한 새로운 작업이 등록되었습니다. 임원분들께서는 필히 확인 부탁드립니다.', 0, sysdate, sysdate, 'mem1004');

SELECT * FROM OnBoard;

-- 조회수 카운팅
UPDATE OnBoard
	SET bd_viewcnt = bd_viewcnt+1
WHERE bd_no = 1;

/*
UPDATE OnBoard
	SET bd_viewcnt = bd_viewcnt+1
WHERE bd_no = #{bd_no}
 */

-- 게시물 업로드 테이블 삭제
DROP TABLE OnBoardFile;
-- 게시물 업로드 테이블 생성
CREATE TABLE OnBoardFile (
	bd_fname VARCHAR2(200), -- 파일명
	bd_pathname VARCHAR2(200), -- 경로명
	bd_credte DATE, -- 파일 업로드일
	bd_no NUMBER -- 게시물번호 (fk)
);
-- board_seq.currval : 게시판의 현재 입력되는 게시판
-- 번호와 동일하게 처리
INSERT INTO OnBoardFile VALUES ('파일명.txt', '경로명', sysdate, 1);
SELECT * FROM OnBoardFile;

SELECT bd_fname FROM OnBoardFile WHERE bd_no = 10;

-- 게시물 검색
SELECT * FROM OnBoard
WHERE bd_name LIKE '%'||''||'%'
AND mem_no LIKE '%'||''||'%'
ORDER BY bd_no DESC;

/*
SELECT *
FROM BOARD 
WHERE subject LIKE '%'||#{subject}||'%'
AND writer LIKE '%'||#{writer}||'%'
ORDER BY NO DESC
 */

-- 게시물을 등록한 사원명 조회
SELECT oe.emp_korname, ob.*
FROM OnEmp oe, OnProject_Member pm, OnBoard ob
WHERE oe.emp_no = pm.emp_no
AND pm.mem_no = ob.mem_no
AND oe.EMP_KORNAME LIKE '%'||''||'%';

-- 게시물 수정
UPDATE OnBoard
	SET bd_name = '1차 공지사항',
		bd_content = '오늘은 수요일입니다. 좋은 하루 보내세요.',
		bd_uptdte = sysdate
WHERE bd_no = 1;

-- 게시물 삭제
DELETE FROM OnBoard WHERE bd_no = 10;

-- 계층형 SQL
SELECT * FROM OnBoard
START WITH bd_refno = 0
CONNECT BY PRIOR bd_no = bd_refno
ORDER siblings BY bd_no DESC;

-- 페이징 처리
SELECT *
FROM (
	SELECT rownum cnt, b.*
	FROM OnBoard b
	WHERE bd_name LIKE '%'||''||'%'
	AND mem_no LIKE '%'||''||'%'
	START WITH bd_refno = 0
	CONNECT BY PRIOR bd_no = bd_refno
	ORDER siblings BY bd_no DESC)
	-- 한 페이지에 표시할 데이터 건수 지정
	WHERE cnt BETWEEN 1 AND 5;


-- 데이터 총 건수
SELECT COUNT(*)
FROM OnBoard b
WHERE bd_name LIKE '%'||''||'%'
AND mem_no LIKE '%'||''||'%';

/*
SELECT COUNT(*)
FROM OnBoard b
WHERE bd_name LIKE '%'||#{bd_name}||'%'
AND emp_no LIKE '%'||#{emp_no}||'%'

public int totCnt(BoardSch sch);
 */
