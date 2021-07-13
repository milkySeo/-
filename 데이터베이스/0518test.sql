Select bookname, price
from book;

select bookid, bookname, publisher, price
from book;

select publisher
from book;

select distinct publisher
from book;

select price
from book
where price < 20000; -- between 10000 and 20000;

select *
from book
where publisher in('굿스포츠', '대한미디어')
-- 조건이 다른걸 가지고할땐 and or 사용 조건이 같은걸 비교할땐 in이나 between 사용

select bookname, publisher
from book
where bookname = '축구의 역사'; -- bookname like '축구의 역사';

select bookname, publisher
from book
where bookname like '%축구%'; -- '축구' 포함하는

select *
from book
where bookname like '_구%';

select *
from book
where bookname like '%축구%' and price >= 20000;

select *
from book
order by bookname; -- 오름차순

select *
from book
order by price, bookname;

select *
from book
order by price DESC, publisher;

select sum(saleprice) 
from orders;

select sum(saleprice) as '총매출'
from orders
where custid = 2;

select sum(saleprice) as total
		avg(saleprice) as 'avg'
        min(saleprice) as min
        max(saleprice) as max
from orders;

select custid, count(*) as 도서수량, sum(saleprice) as 총액
from orders
group by custid;

-- 20번문제
select custid, count(*) as 도서수량
from orders
where saleprice >= 8000 
group by custid
having count(*) >= 2;

select *
from customer, orders;

select *
from customer, orders
where customer.custid = orders.custid;

select name, saleprice
from customer, orders
where orders.custid = customer.custid;

select name, sum(saleprice) as '총판매액'
from customer, orders
where customer.custid = orders.custid
group by name
order by name;

select name, bookname
from customer, book, orders
where orders.bookid = book.bookid and customer.custid = orders.custid;

select customer.name, book.bookname
from customer, book, orders
where book.price = 20000 and orders.bookid = book.bookid and customer.custid = orders.custid;

select customer.name, saleprice
from customer left outer join orders -- 왼쪽에 이름값에 대해서 비어있는것도 찾아서 붙여라잉
		on customer.custid = orders.custid; -- from절에서 함 그전엔 where에한거

-- 28
select bookname
from book
where price = (select Max(price)
				from book);

select customer.name
from customer
where customer.custid in (select distinct custid
							from orders);		
                            


select customer.name
from customer, orders,book
where customer.custid = (select custid
							from orders
							where bookid in (select bookid
											from book
											where publisher = '대한미디어'));

select bookname
from book
where price >= (select avg(price)
				from book);
                
select name
from customer
where address like '대한민국%'
union
select name
from customer
where custid in (select custid from orders);

select customer.name, address
from customer
where exists (select *
			from orders
			where customer.custid = orders.custid);