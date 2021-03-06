-- 게시판 메인 페이블
CREATE TABLE board(
	NO NUMBER PRIMARY KEY,
	refno NUMBER, -- 답변의 상위 글번호
	subject varchar2(200),
	content varchar2(2000),
	writer varchar2(100),
	readcnt NUMBER, -- 조회수
	regdte DATE, -- 등록일
	uptdte DATE -- 수정일
);
CREATE SEQUENCE board_seq
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 999999;
-- 기본 등록 sql
INSERT INTO board values(board_seq.nextval,0,
'첫번째글',
'내용','홍길동',0,sysdate, sysdate);
SELECT * FROM board;



CREATE TABLE boardfile(
	NO NUMBER, -- 글번호
	fname varchar2(200),
	pathname varchar2(500),
	content varchar2(200),
	credte date
);
-- board_seq.currval : 게시판의 현재 입력되는 게시판
-- 번호와 동일하게 처리..
insert into boardfile values(
board_seq.currval,'파일명.txt','경로명',
	'내용',sysdate);

SELECT *
FROM BOARD 
WHERE subject LIKE '%'||''||'%'
AND writer LIKE '%'||''||'%'
ORDER BY NO DESC;

