-- 12102638 유성근

create database mall;

use mall;

create table member
(    
     id varchar(20) primary key, -- 회원 id
     name varchar(20), -- 회원명
     gender varchar(20), -- 회원성별
     joindate varchar(20) -- 가입일자
);

insert into member values('hkd', '홍길동', 'm', '2001-01-01');
insert into member values('lss', '이순신', 'm', '2003-02-01');
insert into member values('hj', '황진이', 'f', '2002-11-13');
insert into member values('wg', '왕건', 'm', '2005-12-21');
insert into member values('pms ','박문수', 'm', '2006-11-09');

create table goods (    
	goodsNo int primary key, -- 상품의 인덱스번호
    goodName varchar(20), -- 상품명
    price int -- 상품가격
);

insert into goods values(1, 'mp3', 10000);
insert into goods values(2, 'camera', 50000);
insert into goods values(3, 'pc', 700000);


create table orders (
	no int primary key, -- 주문 인덱스번호
    id varchar(20), -- 회원 id
    orderDate varchar(20) -- 주문일자
);


insert into orders values(1, 'hkd', '2001-03-27');
insert into orders values(2, 'wg', '2005-04-17');
insert into orders values(3, 'hkd', '2006-02-07');


create table ordersDetail -- 주문내역
(    
     num int,
     orderNo int,  -- 주문번호
     goodsNo int, -- 상품번호
     qty int -- 상품수량
);


insert into ordersDetail values(1,1,1,1); -- mp3 1대
insert into ordersDetail values(2,1,3,1); -- pc 1대
insert into ordersDetail values(3,2,2,2); -- camera 2대
insert into ordersDetail values(4,3,2,1); -- camera 1대

select * from MEMBER;
select * from goods;
select * from orders;
select * from ordersDetail;

