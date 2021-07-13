create database sales;
use sales;

create table CusTbl (
	CusId VARCHAR(20) NOT NULL,
	CusName VARCHAR(10) NOT NULL,
	Age INT,
	Grade VARCHAR(10) NOT NULL,
	Job VARCHAR(20),
	Money INT DEFAULT 0,
	PRIMARY KEY(CusId)
);


CREATE TABLE ProTbl (
	ProId CHAR(3) NOT NULL,
	ProName VARCHAR(20),
	Inventory INT CHECK (Inventory >= 0 AND Inventory <= 10000),
	Price INT,
	Factory VARCHAR(20),
	PRIMARY KEY (ProId)
);

CREATE TABLE OrdTbl (
	OrdId CHAR(3) NOT NULL,
	OrdName VARCHAR(20),
    OrdPro CHAR(3),
    Quantity INT,
    Addr VARCHAR(30),
    OrdDate DATE,
    PRIMARY KEY (OrdId),
    FOREIGN KEY (OrdName) REFERENCES custbl(CusId),
	FOREIGN KEY (OrdPro) REFERENCES ProTbl(ProId)
    );
    
    INSERT INTO cusTbl VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO cusTbl VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
    INSERT INTO cusTbl VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
    INSERT INTO cusTbl VALUES ('orange', '김용옥', 22, 'silver', '학생', 0);
    INSERT INTO cusTbl VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
    INSERT INTO cusTbl VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);
    INSERT INTO cusTbl VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);
    
	INSERT INTO ProTbl VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
    INSERT INTO ProTbl VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
    INSERT INTO ProTbl VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
    INSERT INTO ProTbl VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');
    INSERT INTO ProTbl VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
    INSERT INTO ProTbl VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
    INSERT INTO ProTbl VALUES ('p07', '달콤비스킷', 1650, 1500, '한빛제과');
    
    INSERT INTO OrdTbl VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '2019-01-01');
    INSERT INTO OrdTbl VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '2019-01-10');
    INSERT INTO OrdTbl VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '2019-01-11');
    INSERT INTO OrdTbl VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '2019-02-01');
    INSERT INTO OrdTbl VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '2019-02-20');
    INSERT INTO OrdTbl VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '2019-03-02');
    INSERT INTO OrdTbl VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '2019-03-15');
    INSERT INTO OrdTbl VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '2019-04-10');
    INSERT INTO OrdTbl VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '2019-04-11');
    INSERT INTO OrdTbl VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2019-05-22');

SELECT CUSID, CUSNAME, AGE, GRADE, JOB, MONEY
	FROM custbl;
    
select factory
	from protbl;
    
select distinct factory
from protbl;

select proname as 제품명, price as 가격
	from protbl;
    
select proname, price + 500 as '조정 단가'
	from protbl;
    
select proname, inventory, price
	from protbl
	where factory = '한빛제과';
    
select ordpro, quantity, OrdDate
	from ordtbl
    where ordname='apple' and Quantity >= 15;
    
select *
	from ordtbl
    where ordpro='p01' or Quantity < 10;
    
select ordpro, Quantity, OrdDate, OrdName
	from ordtbl
    where ordname='apple' or Quantity >= 15;
    
select ordpro, Quantity, OrdDate, OrdName
	from ordtbl
    where Quantity >=20 and Quantity <40;
    
select ordpro, Quantity, OrdDate, OrdName
	from ordtbl
    where Quantity >=40 or Quantity <20;
    
select cusname, age, grade, money 
	from custbl
    where cusname like '김%';
    
select *
	from ordtbl
    where Addr like '__시%';
    
select AVG(price)
	From protbl;
    
select sum(inventory) as '재고량 합계'
	from protbl
    where factory = "한빛제과";
    
select count(*) as '고객수'
	from custbl;

select count(age) as '고객수'
	from custbl; -- null값은 안세니까 6개로나옴

select count(distinct factory) as '제조업체 수'
	from protbl; -- factory앞에 써야됌 중복제외
    
select ordpro, sum(quantity) as 총주문수량
	from ordtbl
    group by ordpro;
    
select Factory, count(*) as 제품수, max(price) as 최고가
	from protbl
    group by factory;
    
select Factory, count(inventory) as 제품수, max(price) as 최고가
	from protbl
    group by factory having count(*) >= 3;
    
select grade, count(*) as 고객수, avg(money) as 평균적립금
	from custbl
    group by grade having avg(money) >= 1000;
    
select ordpro, ordname, sum(quantity) as 총주문수량
	from ordtbl
    group by  ordpro, ordname;
    
select protbl.proname
	from protbl, ordtbl
    where ordtbl.ordname = 'banana' and protbl.proid = ordtbl.ordpro;

select ordtbl.ordpro, ordtbl.orddate
	from ordtbl, custbl
    where custbl.age >= 20 and custbl.CusId = ordtbl.ordname;
    
select *
	from ordtbl, custbl
    limit 10, 2; -- 10번째줄부터 두개

select proname
	from ordtbl, custbl, protbl
    where custbl.CusName = '고명석' and cusid = ordname and proid = ordpro;
    
select proname , price
	from protbl
    where factory = (select factory
						from protbl
                        where proname = '달콤비스킷');
                        
select cusname, money
	from custbl
    where money = (select max(money)
					from custbl);
                    
select proname, factory
	from protbl
    where proid in (select ordpro
					from ordtbl
                    where ordname = 'banana');
                    
select proname, factory
	from protbl
	where proid not in(select ordpro
						from ordtbl
                        where ordname = 'banana');
                        
select proname, price, factory
	from protbl
    where price > all (select price
						from protbl
                        where factory = '대한식품');
                        
select cusname
	from custbl
    where exists (select *
					from ordtbl
                    where orddate = '2019-03-15' and cusid = ordname);
    
select cusname
	from custbl
    where not exists (select *
					from ordtbl
                    where orddate = '2019-03-15' and cusid = ordname);
    
select *
	from ordtbl, custbl
	where orddate = '2019-03-15' and cusid = ordname;

update protbl
set proname = '통큰파이'
where proid = 'p03';
select * from protbl;

update ordtbl
set quantity = 5
where ordname in (select cusid
					from custbl
					where CusName = '정소화');

delete
from ordtbl
where orddate = '2019-01-01';
SELECT 
    *
FROM
    ordtbl;

delete from ordtbl;
select * from ordtbl;


create database bookStore;
use bookstore;
CREATE TABLE book (
    bookid INTEGER PRIMARY KEY,
    bookname VARCHAR(40),
    publisher VARCHAR(10),
    price INTEGER
);

CREATE TABLE customer (
    custid INTEGER PRIMARY KEY,
    name VARCHAR(40),
    address VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE orders (
    orderid INTEGER PRIMARY KEY,
    custid INTEGER,
    bookid INTEGER,
    saleprice INTEGER,
    orderdate DATE,
    FOREIGN KEY (custid)
        REFERENCES customer (custid),
    FOREIGN KEY (bookid)
        REFERENCES book (bookid)
);

insert into book values(1,'축구의 역사', '굿스포츠', 7000);
insert into book values(2,'축구아는 여자', '나무수', 13000);
insert into book values(3,'축구의 이해', '대한미디어', 22000);
insert into book values(4,'골프 바이블', '대한미디어', 35000);
insert into book values(5,'피겨 교본', '굿스포츠', 8000);
insert into book values(6,'역도 단계별기술', '굿스포츠', 6000);
insert into book values(7,'야구의 추억', '이상미디어', 20000);
insert into book values(8,'야구를 부탁해', '이상미디어', 13000);
insert into book values(9,'올림픽 이야기', '삼성당', 7500);
insert into book values(10,'Olympic Campions', 'Pearson', 13000);

insert into customer values(1, '박지성', '영국 멘체스타' , '000-5000-0001');
insert into customer values(2, '김연아', '대한민국 서울' , '000-6000-0001');
insert into customer values(3, '장미란', '대한민국 강원도' , '000-7000-0001');
insert into customer values(4, '추신수', '미국 클리블랜드' , '000-8000-0001');
insert into customer values(5, '박세리', '대한민국 대전' , NULL);

insert into orders values(1, 1, 1, 6000, '2014-07-01');
insert into orders values(2, 1, 3, 21000, '2014-07-03');
insert into orders values(3, 2, 5, 8000, '2014-07-03');
insert into orders values(4, 3, 6, 6000, '2014-07-04');
insert into orders values(5, 4, 7, 20000, '2014-07-05');
insert into orders values(6, 1, 2, 12000, '2014-07-07');
insert into orders values(7, 4, 8, 13000, '2014-07-07');
insert into orders values(8, 3, 10, 12000, '2014-07-08');
insert into orders values(9, 2, 10, 7000, '2014-07-09');
insert into orders values(10, 3, 8, 13000, '2014-07-10');
    
    

    

    
    
    
    
   
    



    



