create database mart;
use mart;

create table CusTbl(
	CusId VARCHAR(10) NOT NULL,
    CusPw varchar(20),
    CusName varchar(5),
    CusAge INT,
    CusJob varchar(10),
    CusGrade varchar(10),
    CusMoney INT default 0,
    primary key(CusId)
    );
    
create table ProTbl(
	ProId varchar(10) not null,
    ProName varchar(10),
    ProInventory int,
    ProPrice int,
    SupName varchar(10) not null,
    SupDate date not null,
    SupFlow int not null,
    primary key (ProId),
    foreign key (SupName) REFERENCES FacTbl(FacName)
    );
    
create table FacTbl(
	FacName varchar(10) not null,
    FacNumber varchar(15),
    FacLocation varChar(50),
    FacManager varChar(5),
    primary key (FacName)
    );

create table PostTbl(
	PostNum INT not null,
    PostTitle varchar(30),
    PostContent varchar(100),
    PostDate Date,
    PostId varchar(10) not null,
    primary key (PostNum),
    foreign key (PostId) references CusTbl(CusId)
    );
    
create table OrdTblR(
	CusId varchar(10) not null,
    ProId varchar(10) not null,
    OrdId INT,
    OrdQuatity INT,
    OrdAddress varchar(30),
    OrdDate date,
    primary key(CusId, ProId)
    );
    
    INSERT INTO cusTbl VALUES ('c001', 'abcde', '홍길동', 20, '학생', 'vip', 5000);
	INSERT INTO cusTbl VALUES ('c002', 'aaaaa', '김땡땡', 23, '회사원', 'silver', 2000);
    
    INSERT INTO ProTbl VALUES ('p0001', '고향만두', 100, 8000, '농심', '2021-05-25', 200);
    
	INSERT INTO FacTbl VALUES ('농심', '010-0000-0000','대전시 서구 둔산동 ㅇㅇ','박담당');

	INSERT INTO PostTbl VALUES (1 , '문의합니다.','환불 문의드립니다 뿅뿅','2021-05-20', 'c001');
    
	INSERT INTO OrdTblR VALUES ('c001' , 'p0001' ,1 ,2 , '홍길동 집', '2021-05-23');


select *
from custbl;

select *
from protbl;

select *
from factbl;
    
select *
from Posttbl;

select *
from ordtblR;

select factbl.facname as '업체명' ,FacNumber as '전화번호'
from factbl, protbl, custbl, ordtblr
where custbl.cusid = ordtblr.cusid && ordtblr.proid = protbl.proid && protbl.supname = factbl.facname;
