DROP TABLE board;
CREATE TABLE board (
	NO NUMBER PRIMARY KEY,
	refno NUMBER, -- 답변의 상위 글 번호
	subject VARCHAR2(200),
	content VARCHAR2(2000),
	writer VARCHAR2(100),
	readcnt NUMBER, -- 조회수
	regdte DATE, -- 등록일
	uptdte DATE -- 수정일
);

DROP SEQUENCE board_seq;
CREATE SEQUENCE board_seq
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 999999;

INSERT INTO board VALUES (board_seq.nextval, 0, '첫번째글', '내용', '홍길동', 0, sysdate, sysdate);
SELECT * FROM board;

-- 조회수 카운팅
UPDATE board
	SET readcnt = readcnt+1
WHERE NO = 1;

/*
UPDATE board
	SET readcnt = readcnt+1
WHERE NO = #{no}
 */

DROP TABLE boardfile;
CREATE TABLE boardfile (
	NO NUMBER, -- 글번호
	fname VARCHAR2(200),
	pathname VARCHAR2(200),
	content VARCHAR2(200),
	credte DATE
);
-- board_seq.currval : 게시판의 현재 입력되는 게시판
-- 번호와 동일하게 처리
INSERT INTO boardfile VALUES (board_seq.currval, '파일명.txt', '경로명', '내용', sysdate);
SELECT * FROM boardfile;

-- boardSch
SELECT * FROM board
WHERE subject LIKE '%'||''||'%'
AND writer LIKE '%'||''||'%'
ORDER BY NO DESC;


/*
SELECT *
FROM BOARD 
WHERE subject LIKE '%'||#{subject}||'%'
AND writer LIKE '%'||#{writer}||'%'
ORDER BY NO DESC 	
 */

-- 계층형 SQL
SELECT * FROM board
START WITH refno = 0
CONNECT BY PRIOR NO = refno
ORDER siblings BY NO DESC;

-- 페이징 처리
SELECT *
FROM (
	SELECT rownum cnt, b.*
	FROM BOARD b
	WHERE subject LIKE '%'||''||'%'
	AND writer LIKE '%'||''||'%'
	START WITH refno = 0
	CONNECT BY PRIOR NO = refno
	ORDER siblings BY NO DESC)
	-- 한 페이지에 표시할 데이터 건수 지정
	WHERE cnt BETWEEN 1 AND 5;


-- 데이터 총 건수
SELECT COUNT(*)
FROM BOARD b
WHERE subject LIKE '%'||''||'%'
AND writer LIKE '%'||''||'%';

/*
SELECT COUNT(*)
FROM BOARD b
WHERE subject LIKE '%'||#{subject}||'%'
AND writer LIKE '%'||#{writer}||'%'

public int totCnt(BoardSch sch);
 */