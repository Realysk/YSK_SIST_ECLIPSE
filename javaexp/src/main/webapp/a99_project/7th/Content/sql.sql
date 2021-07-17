create table fileboard(
	num number,
	author varchar(30),
	title varchar(30),
	fileName varchar(50),
	day varchar(30)
);

//시퀀스 생성
create sequence file_num
start with 1
increment by 1;

insert into fileboard values(1, '도스토예프스키', '죄와 벌', 'file1', to_char(sysdate,'YYYY-MM-DD'));
select * from fileboard;

delete from fileboard;