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

