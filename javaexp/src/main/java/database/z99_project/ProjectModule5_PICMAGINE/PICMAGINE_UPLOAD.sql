-- 파일 업로드를 위한 DB

CREATE TABLE uploadFile(
	-- upload_id varchar2(50) PRIMARY KEY, -- 업로드 코드
	fileName varchar2(200) CONSTRAINT fileName_nn NOT NULL, -- 사용자가 저장할 파일명
	fileRealName varchar2(200) CONSTRAINT fileRealName_nn NOT NULL -- 실제 저장될 파일명
	-- uploaded date CONSTRAINT fileRealName_nn NOT NULL -- 업로드일
);

INSERT INTO uploadFile VALUES ('업로드파일1', 'TEST');
SELECT * FROM uploadFile;
-- INSERT INTO uploadFile VALUES (?, ?);