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