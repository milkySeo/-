create table CusTbl (
CusId varchar(20) NOT NULL,
CusName varchar(5) NOT NULL,
Age int(4),
Grade varChar(8),
Job varChar(6),
Money int(10) NOT NULL,
PRIMARY KEY(CusId)
);

create table ProTbl (
ProId char(5) not null,
proName varchar(7) not null, 
Inventory int(5),
Price int(5),
Factory varchar(5),
primary key(ProId)
);

create table OrdTbl(
OrdId char(3) not null,
OrdName varchar(20) not null,
OrdPro char(5),
Quant int(3),
Address char(50),
OrdDate date,
primary key(OrdId),
foreign key(OrdPro) references ProTbl(ProId),
foreign key(OrdName) references CusTbl(CusId)
);
