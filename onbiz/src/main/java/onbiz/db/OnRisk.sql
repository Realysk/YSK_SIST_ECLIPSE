DROP TABLE Onrisk;
CREATE TABLE Onrisk (
risk_no varchar2(10), --리스크 번호
risk_kind varchar2(30), --분류
pro_no varchar2(10), --프젝번호
task_no varchar2(10), --작업번호 
risk_name varchar2(50), --리스크명 
risk_content varchar2(1000), --리스크내용
risk_regdte DATE, --등록일
risk_uptdte DATE, --수정일 
risk_occdte DATE, --발생일 
risk_state varchar2(100), --상태
risk_viewcnt NUMBER , --조회수 
risk_no2 varchar2(10),--상위번호
mem_no varchar2(10) --작성자
);

SELECT * FROM Onrisk;
CREATE SEQUENCE Onrisk_seqence
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 999999;

CREATE SEQUENCE risk_file_seq 
 INCREMENT BY 1   
   START WITH 1001
   MINVALUE 1001
   MAXVALUE 9999999;

CREATE TABLE risk_file (
riskfile_no varchar2(10), --리스크파일번호
riskfile_name varchar2(50), --리스크파일명
riskfile_regDte DATE, --파일등록일 
risk_no varchar2(10) --번호 
);

INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업','pro1001','task000014','리스크명1', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1001');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업2','pro1001','task00015','리스크명2', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1002');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업3','pro1001','task00016','리스크명3', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1003');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업4','pro1001','task00017','리스크명4', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1004');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업5','pro1001','task00018','리스크명5', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1005');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업6','pro1002','task00019','리스크명6', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1006');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업7','pro1002','task00020','리스크명7', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1007');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업8','pro1002','task00021','리스크명8', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1008');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업9','pro1003','task00022','리스크명9', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1009');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업10','pro1003','task00023','리스크명10', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1010');
INSERT INTO Onrisk VALUES (Onrisk_seqence.nextval,'작업11','pro1003','task00024','리스크명11', '리스크내용', '2021/01/01','2021/01/01','2021/01/01','오픈',1,1,'mem1011');

SELECT * FROM Onrisk;


CREATE TABLE risk_result(
risk_no varchar2(10), --번호 
risk_resultno varchar2(20),
risk_actcontent varchar2(1000), --조치내용
risk_actdte DATE ,--조치일
mem_no varchar2(10) --조치자 
);