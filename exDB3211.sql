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
    
    
  insert into custTbl3211 values('SMJ','������',1991, '011', '22222222','����','���Ǳ� ���Ƿ�', 1173, 'E', '2004.10.05');
  insert into custTbl3211 values('LWN','������',1990, '019', '33333333','�泲','â���� ����������', 770, 'H', '2001.01.23');
  insert into custTbl3211 values('JNB','�ܳ���',1979, '018', '77777777','����','������ ������', 172, 'H', '2001.07.13');
  insert into custTbl3211 values('AML','�ظ���',1983, '010', '88888888','���','�Ȼ�� ��ϱ�', 765, 'F', '2005.08.25');
  insert into custTbl3211 values('BHS','��ȿ��',1986, '011', '11111111','����','���Ǳ� ���μ�ȯ��', 1802, 'C', '2005.10.19');
  insert into custTbl3211 values('JBJ','�����',1978, '011', '44444444','��õ','���� ������', 2626, 'B', '2008.05.10');
  insert into custTbl3211 values('LJH','������',1989, '', '','�λ�','������ �߾Ӵ��', 286, 'G', '1998.02.14');
  insert into custTbl3211 values('KBT','���ź',1981, '016', '55555555','���','�︪�� �︪��',182, 'H', '2003.06.25');
  insert into custTbl3211 values('PSR','�ڻ�����',1985, '','','���','������ �ȴޱ�',370, 'G', '2013.05.05');
  insert into custTbl3211 values('TAY','�¿�',1993, '011','66666666','����','���ı� �ø��ȷ�',474, 'F', '1997.05.03');
  

  select * from custTbl3211;
  
  insert into buyTbl3211 values(101,'LWN','�ȭ', '', 30000, 5);
  insert into buyTbl3211 values(102,'SMJ','����', '����', 15000, 9);
  insert into buyTbl3211 values(103,'AML','�����', '����', 200000, 7);
  insert into buyTbl3211 values(104,'LWN','�ȭ', '', 30000, 10);
  insert into buyTbl3211 values(105,'PSR','��Ʈ��', '����', 1000000, 1);
  insert into buyTbl3211 values(106,'LJH','�ȭ', '', 30000, 3);
  insert into buyTbl3211 values(107,'AML','��ǳ��', '', 28000, 1);
  insert into buyTbl3211 values(108,'SMJ','�����', '����', 200000, 1);
  insert into buyTbl3211 values(109,'JBJ','û����', '�Ƿ�', 50000, 3);
  insert into buyTbl3211 values(110,'PSR','�޸�', '����', 80000, 12);
  insert into buyTbl3211 values(111,'BHS','�����', '����', 200000, 5);
  insert into buyTbl3211 values(112,'LJH','����', '����', 15000, 21);
  insert into buyTbl3211 values(113,'KBT','û����', '�Ƿ�', 50000, 1);
  
  select * from buyTbl3211;
  
 -- select trim('AML', customerId), * from buyTbl3211;
 
 insert into buyTbl3211 values(114,'SMJ','��ǳ��', '����', 13500, 1);
 
 select * from buyTbl3211 where customerId = 'LWN';
 
 select pfname, price from buyTbl3211 order by productname;
 
 select * from buyTbl3211 where productname = '�޸�' or productname ='�����' or productname ='�ȭ';
 
 select * from custTbl3211 where joindate < '1999.12.31';
 
 select * from custTbl3211 where contact is not null;
 
 select * from buyTbl3211 where price >= 30000 and price < 80000;
 
 select * from custTbl3211  order by joindate desc;
 
 select cname || '�� �ּҴ� ' || address || '�Դϴ�.' from custTbl3211;
 
 select distinct customerId, productname from buyTbl3211 order by productname desc;
 
 select customerId, cname from custTbl3211 where customerId like '%L%' order by birthdate;
 
 select customerId, cname, address, joindate from custTbl3211 where substr(customerId, 1) > 'B' and substr(customerId, 1) < 'P';
 
-- select replace(productname, '�', '�౸') from buyTbl3211 where customerId = 'LWN';