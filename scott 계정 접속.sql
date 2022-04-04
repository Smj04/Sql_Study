--DROP TABLE EMP;
--DROP TABLE DEPT;
--DROP TABLE LOCATIONS;
--DROP TABLE SALGRADE;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) 
);
CREATE TABLE EMP(
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

CREATE TABLE SALGRADE( 
    GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER 
);
CREATE TABLE LOCATIONS (
     LOC_CODE  CHAR(2) ,
     CITY      VARCHAR2(12)
) ;

-- DEPT���̺� ������ ����
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP���̺� ������ ����
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('09-12-1982','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('12-1-1983','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

-- SALGRADE���̺� ������ ����
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

commit;

select * from emp; -- emp���̺� �ִ� ������ �о ��� �÷��� ȭ�鿡 ����Ѵ�.
select * from dept; -- dept���̺� �ִ� ������ �о ��� �÷��� ȭ�鿡 ����Ѵ�.
select empno, ename, sal, comm from emp;
select sal from emp;
select empno, ename, sal , sal+300 from emp; -- sal�� 300�� ���� ���ο� �޿��÷��� �߰��Ѵ�.
select empno, ename, sal , 2*sal+300 from emp;
select empno, ename, sal , 2*(sal+300) from emp; -- �켱������ ���� ��ȣ���� �����Ѵ� ������ ���� ����� �ٸ���.

select empno, ename, sal , comm ,comm+300 from emp; -- �� �� ���� ��null
-- comm+300���� comm���� NULL���̸� �� ����� NULL�� �ȴ�.

select ename AS name, sal, sal + 12 "Annual Salary"
FROM emp; -- sal�� 12�� ���� �÷��̸��� "Annual Salary"�� �����Ѵ�.

select ename ���1, 'ABCde' ���2, sal ���3, 500 ���4 --�ڿ� �ѱ��� �ʵ���� �ȴ�
from emp;

select ename || ':' || empno || ':' || job "�̸��������"
from emp;

select ename || ' is a ' || job As "Employee Details"
from emp;

select ename || ' : 1 Year Salary = ' || sal * 12 Monthly -- ||�� ������� �۾��� �������ִ� ���̴�
from emp; -- sal*12�� ���� 1��(12����)�� ���ϸ� ������ �ȴ�.

select distinct job 
from emp;

select All * from emp;
select * from emp; -- All�� ������ ǥ�� 
select distinct job from emp; -- job�÷��� ������ �ߺ� ����
select distinct deptno, job from emp; -- deptno(�μ���ȣ)�� job�÷��� ���� �ߺ����� �ʰ� ��� (distinct��ɾ� : �и���,�ѷ���)

select ROWID, rownum, ename, sal
from emp where rownum <= 3; -- Rownum�� 3���� ��� where ������

select empno, ename, job, sal
from emp where job = 'MANAGER'; -- ���蹮�� : emp���̺��� �������� manager�� empno, ename, job, sal ����� ������ ��ȸ

select empno, ename, job, sal from emp where job = 'Manager'; -- ���� �����ʹ� ��� �빮�ڷ� ����Ǿ� �ִ�

select empno, ename, job, sal from emp where sal >= 3000; -- sal�� 3000�̰ų� ū�� �� ���

select empno, ename, job, sal, deptno from emp where  deptno != 30;
select empno, ename, job, sal, deptno from emp where  deptno <> 30;
select empno, ename, job, sal, deptno from emp where  deptno ^= 30; --���� 3���� ������� �����ϴ�

select ename, job, sal, deptno from emp where sal BETWEEN 1300 AND 1700; --  sal(�޿�)�� 1300  ~ 1700�� ��µȴ�(between A and B ��ɾ�)

select empno, ename, job, sal, hiredate from emp where empno IN (7902, 7788, 7566); -- empno�ʵ� 7902, 7788, 7566�� �� ���
select empno, ename, job, sal, hiredate from emp where empno = 7902 OR empno = 7788 OR empno = 7566; -- ���� ������ �ڵ� ���ڵ尡 �������� ����

select ename, sal, job from emp where ename LIKE '_A%';
-- ename ���� �ι�° ���ڰ� A�� ��� �����͸� ���                   _�� 1�� %�� 0���̻�

select ename, sal, job from emp where ename LIKE '%A%'; -- ename�� 'A'���ڰ� ���ԵǸ� TRUE�� �����Ѵ� ���蹮��!!!!!!!!! #�� ���� %�� ������ %  ESCAPE whildcard����

select empno, ename, job, sal, comm, deptno from emp where comm = NULL; -- ����� ����. NULL�� ����� NULL
select empno, ename, job, sal, comm, deptno from emp where comm < NULL;
select empno, ename, job, sal, comm, deptno from emp where comm ^= NULL;

select empno, ename, job, sal, comm, deptno from emp where comm IS NULL; -- comm �� �ִ� �����Ͱ� NULL�̸� TRUE���� ����

select empno, ename, job, sal, deptno from emp where sal>=2800 AND job ='MANAGER'; -- �����ʹ� ��ҹ��� �����Ѵ�!

select empno, ename, job, sal, deptno from emp where sal>=2800 OR job ='MANAGER';

select empno, ename, job, sal, deptno from emp where job NOT IN('MANAGER',' CLERK', 'ANALYST');

select ename, sal, job from emp where sal NOT BETWEEN 1000 AND 3000;

select * from emp where ename LIKE 'A%'; --A���ڷ� �����ϴ� �̸��� ���.
select * from emp where ename NOT LIKE 'A%'; -- A�� �ȵ��� �̸��� ���.

select ename, sal, comm, deptno from emp where comm IS NOT NULL; -- ���ʽ�(comm)�� NULL�� �����͸� ���

select ename, sal, comm, deptno from emp where (NVL(comm, 0)=0); -- comm�� NULL�̸� 0������ �����Ͻÿ�.

select empno, ename, job, sal from emp where sal > 1500 AND job = 'PRESIDENT' OR job = 'SALESMAN'; -- �޿��� 1500�̻��̰� ������ president�ų� job�� salesman�� ���
select empno, ename, job, sal from emp where sal > 1500 AND job IN( 'PRESIDENT' , 'SALESMAN'); -- ���� ����� �����ϴ� IN('');

select empno, ename, job, sal, hiredate from emp order by hiredate; -- �Ի����ڸ� ���� ����(���ų�¥���� ���糯¥������)

select empno, ename, job, sal, hiredate from emp order by hiredate DESC;

select empno, ename, job, sal, deptno, hiredate from emp order by deptno, sal DESC;

select empno, ename, job, sal, deptno, hiredate from emp order by 4; -- 1:empno, 2:ename, 3:job ,4:sal �׷��� sal�� �������� ���������� �ȴ�.

select empno, ename, job, deptno, sal, hiredate from emp order by 4,5 desc; -- 4��° �÷� deptno�� ��������, 5��° �÷� sal�� ��������

select DISTINCT deptno, job from emp order by job;
 -- ��Ī���� �÷��̸��� ANN_SAL�� �����Ͽ��� �̶� Ann_SAL�� sal*12�� ���� �Ҵ�ȴ�

select DISTINCT deptno, job from emp order by job; -- job�� �������� �ߺ�����(distinct)��������

select empno, sal, sal*12 ANN_SAL from emp order by deptno; -- DISTINCT�� ������� ������ emp���̺� �ִ� ��� �÷��� ���� �������� ����� �� �ִ�

-- ���� �߻�! DISTINCT�� ����� ��� ���� �÷��� �θ��� �����߻�(sal�� select���� ���� ������) select DISTINCT job, sal+comm from emp order by sal; 

select empno, sal, sal*12 ANN_SAL from emp order by 2;
--4/22 ���࿹��

--�Լ�
select empno, ename , LOWER(job), UPPER(job), INITCAP(job) from emp where deptno = 10;

select empno, ename, job, 
CONCAT(empno, ename) ename1, 
CONCAT(empno, empno) e_empno,
CONCAT(ename, job) e_job
from emp where deptno = 10; -- �÷��� �����ϴ� �Լ� CONCAT()
--CONCAT(ename, job)�� ename�� job�� �����ؼ� �ϳ��� �÷��� �����.

--���蹮�� �� ����
select empno, ename, job, sal, deptno from emp where SUBSTR(ename, 1, 1) > 'K' AND SUBSTR(ename, 1, 1) < 'Y';  --SUBSTR(ename)ename������ ù��° ���� �Ѱ��� ��ȯ�Ѵ�

select empno, ename, LENGTH(ename), sal,LENGTH(sal) from emp; --�ε��� ��ȣ���x �׳� ��ȣ���

select ename, 
            INSTR(ename, 'L') e_null, 
            INSTR(ename, 'L', 1,1) e_11,
            INSTR(ename, 'L', 1,2) e_12,
            INSTR(ename, 'L', 4,1) e_41
            from emp order by ename; --L�ڸ� ó������ ã�Ƽ� ������ ��Ī�÷��� �Ҵ��Ѵ�
            
            --substr(ename, 1, 3); --ename�� ���ڿ� �����Ϳ��� ù��° ��ġ���� 3���� ���ڿ��� ��ȣ��
            
--59page
select ename, LPAD(ename , 15,'*'), sal, LPAD(sal, 10, '$') from emp where deptno = 10; -- LPAD()���ʿ� �����ڸ���ŭ Ư�����ڷ� ä���
select ename, RPAD(ename , 15,'*'), sal, RPAD(sal, 10, '$') from emp where deptno = 10; -- RPAD() �����ʿ� �����ڸ���ŭ ���ڷ� ä���


select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1) from emp where deptno = 20; -- LTRIM()���� ���� �����ڸ���ŭ�� ����.
--LITRIM(job, 'A')���� job�����Ͱ� �� ���ʿ��� 'A'���ڰ� ������ ����
--LITRIM(sal, 1)���� �޿� �����Ͱ� �� ���ʿ� 1�� ���ڰ� ������ �����ǰ�, �����ؼ� ���� ��쿡�� ��ӻ����Ѵ�.

select ename, job, RTRIM(job, 'T'), sal, RTRIM(sal, 0) from emp where deptno = 10; -- RTRIM()�� ������ �����ڸ���ŭ�� ����

--REPLACE() vs TRANSLATE() REPLACE()�� ���ڿ� ��ü����, TRANSLATE()�� ���ڰ� ���� �ϳ��� ��
select ename, REPLACE(ename, 'SC', '*?') AS ������ from emp where deptno = 20; -- REPLACE(��ü�� �÷��̸�, ��ü�ҹ��ڼ���, '��ü�� ���ٲ�') AS ��Ī�÷��� ������Ҵ�
select ename, TRANSLATE(ename, 'SC','*?') ������2 from emp where deptno = 20; -- TRANSLATE()     TRANSLATE('sc','*?'); s�� c ���� ���� �ϳ��� ���ؼ� ��ΰ� ���� ��쿡�� ����  --> s���ڴ� *�� �����ϰ� c���ڴ� ?�� �����Ѵ�


--65P
select ename, hiredate, hiredate+3, hiredate+5/24 from emp where deptno = 30;
alter SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD-HH24:MI:SS'; -- ��¥������ ����

----66P ���蹮�� ����
--SELECT ename, hiredate, sysdate, sysdate - hiredate "Total Days", 
--    TRUNC((sysdate-hiredate)/7, 0) Weeks,--�Ҽ�������
--    ROUND(MOD(sysdate-hiredate), 7,0) Days
--FROM emp order by sysdate-hiredate;

--���� ��¥ ����ϱ�(����,��,�⵵) EXTRACT(? from sysdate)�Լ�  ���ڸ� ��ȯ��
select EXTRACT (day from sysdate) ����,
        EXTRACT (month from sysdate) ��,
        EXTRACT (year from sysdate) �⵵
from DUAL;

