create table custTbl3211 (
    customerId char(8) not null,
    cname nvarchar2(10) not null,
    birthdate number(4) not null,
    areacode char(3),
    contact char(11),
    city nvarchar2(2) not null,
    address nvarchar2(20) not null,
    mileage number(10),
    grade char(1),
    joindate date);
    
    create table buyTbl3211 (
    orderId number(8) not null,
    customerId char(8) not null,
    productname nchar(6) not null,
    pfname nchar(4),
    price number(8) not null,
    quantity number(3) not null);
    
    
  insert into custTbl3211 values('SMJ','서민정',1991, '011', '22222222','서울','관악구 관악로', 1173, 'E', '2004.10.05');
  insert into custTbl3211 values('LWN','이위너',1990, '019', '33333333','경남','창원시 마산합포구', 770, 'H', '2001.01.23');
  insert into custTbl3211 values('JNB','잔나비',1979, '018', '77777777','전남','강진구 강진읍', 172, 'H', '2001.07.13');
  insert into custTbl3211 values('AML','앤마리',1983, '010', '88888888','경기','안산시 상록구', 765, 'F', '2005.08.25');
  insert into custTbl3211 values('BHS','박효신',1986, '011', '11111111','서울','관악구 남부순환로', 1802, 'C', '2005.10.19');
  insert into custTbl3211 values('JBJ','장범준',1978, '011', '44444444','인천','부평구 부평대로', 2626, 'B', '2008.05.10');
  insert into custTbl3211 values('LJH','임재현',1989, '', '','부산','금정구 중앙대로', 286, 'G', '1998.02.14');
  insert into custTbl3211 values('KBT','김방탄',1981, '016', '55555555','경북','울릉군 울릉읍',182, 'H', '2003.06.25');
  insert into custTbl3211 values('PSR','박새로이',1985, '','','경기','수원시 팔달구',370, 'G', '2013.05.05');
  insert into custTbl3211 values('TAY','태연',1993, '011','66666666','서울','송파구 올림픽로',474, 'F', '1997.05.03');
  

  select * from custTbl3211;
  
  insert into buyTbl3211 values(101,'LWN','운동화', '', 30000, 5);
  insert into buyTbl3211 values(102,'SMJ','도서', '서적', 15000, 9);
  insert into buyTbl3211 values(103,'AML','모니터', '전자', 200000, 7);
  insert into buyTbl3211 values(104,'LWN','운동화', '', 30000, 10);
  insert into buyTbl3211 values(105,'PSR','노트북', '전자', 1000000, 1);
  insert into buyTbl3211 values(106,'LJH','운동화', '', 30000, 3);
  insert into buyTbl3211 values(107,'AML','선풍기', '', 28000, 1);
  insert into buyTbl3211 values(108,'SMJ','모니터', '전자', 200000, 1);
  insert into buyTbl3211 values(109,'JBJ','청바지', '의류', 50000, 3);
  insert into buyTbl3211 values(110,'PSR','메모리', '전자', 80000, 12);
  insert into buyTbl3211 values(111,'BHS','모니터', '전자', 200000, 5);
  insert into buyTbl3211 values(112,'LJH','도서', '서적', 15000, 21);
  insert into buyTbl3211 values(113,'KBT','청바지', '의류', 50000, 1);
  
  select * from buyTbl3211;
  
 -- select trim('AML', customerId), * from buyTbl3211;
 
 insert into buyTbl3211 values(114,'SMJ','선풍기', '가전', 13500, 1);
 
 select * from buyTbl3211 where customerId = 'LWN';
 
 select pfname, price from buyTbl3211 order by productname;
 
 select * from buyTbl3211 where productname = '메모리' or productname ='모니터' or productname ='운동화';
 
 select * from custTbl3211 where joindate < '1999.12.31';
 
 select * from custTbl3211 where contact is not null;
 
 select * from buyTbl3211 where price >= 30000 and price < 80000;
 
 select * from custTbl3211  order by joindate desc;
 
 select cname || '의 주소는 ' || address || '입니다.' from custTbl3211;
 
 select distinct customerId, productname from buyTbl3211 order by productname desc;
 
 select customerId, cname from custTbl3211 where customerId like '%L%' order by birthdate;
 
 select customerId, cname, address, joindate from custTbl3211 where substr(customerId, 1) > 'B' and substr(customerId, 1) < 'P';
 
-- select replace(productname, '운동', '축구') from buyTbl3211 where customerId = 'LWN';