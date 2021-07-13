create database univ;
use univ;

create table ProTbl(
	ProId varchar(10) not null,
    Proname varchar(5),
    ProAge int,
    ProRank varchar(5),
    ProSpec varchar(10),
    foreign key
    primary key(ProId)
    );
    
create table DeptTbl(
	DepNum int not null,
    DepName varchar(10),
    DepOffice varchar(10),
    primary key(DepNum)
    );
    
create table GrdTbl(
	GrdId varchar(10) not null,
    GrdName varchar(5),
    GrdAge int,
	GrdMajor varchar(2),
    check (GrdMajor in ('석사', '박사')),
    primary key(GrdId)