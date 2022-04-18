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

-- DEPT���̺��� ������ ����
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP���̺��� ������ ����
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

-- SALGRADE���̺��� ������ ����
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

commit;

--�ǽ�
select * from emp;
select ename, sal, sal+300 from emp;
select  deptno, ename, sal, comm, comm+300 from emp;
select ename, sal , sal *12 from emp;

--�տ��ٰ� ���� ���� �ڿ� �÷��̸��� ����
select ename ���1, 'Abc' ���2, sal ���3, ename from emp;
-- ���Ῥ���� ||
select ename || ':' || empno || ':' || ':' || job from emp;
select ename || ' is a ' || job from emp;
select ename || ' : 1 Year salary = ' || sal*12 Monthly from emp;

-- distinct �ߺ����� Ű���� (select�ٷ� �ڿ� ����Ѵ�!)
select distinct job from emp;
select distinct deptno,job from emp;

-- rownum�� order by ���������� �ο�, rowid�� Ư���� ���� �����ϰ� ����
select rownum, rowid from emp;

-- where�� like, in, between, is null, is not null ����� �� ������ ����
-- �� ������   =(����), <>, !=, ^=(��������)

-- where���� �����ٶ� ��ҹ��� ����!!
select empno, ename, job, sal from emp where job ='MANAGER';
select  ename, sal, deptno from emp where deptno!=30 ;

-- �� ������
-- BETWEEN A�� AND B�� : a���� b�� ���̿� ���ԵǴ��� ���Ѵ�
-- IN : ������ �� ����ϳ��� ��ġ�ϴ��� ���Ѵ� (=ANY, SOME)    �������� �ȿ� �ִ��� Ȯ���Ҷ����()
-- LIKE : Ư�� ���Ͽ� ���ϴ� ���� ��ȸ�ϰ��� �ϴ� ���              '%' : 0��/1�� �̻� ���ڿ� ����, '_' : 1�� ���ڿ� ����   �ڿ� %�� ���ֱ� �ѱ��� �ƴϸ�!
-- ���ԵǸ� _%
-- IS NULL : �� ���θ� Ȯ���Ѵ�

-- between�� ����� ��� a������ �������� ���� �����ؾ��Ѵ�
select ename, job, sal, deptno from emp where sal between 1300 and 1700 ;

select empno, ename, job, sal, hiredate from emp where empno in (7902, 7788, 7566);

select ename, sal, job from emp where ename like '_A%';
select ename, sal, job from emp where ename like '%A%';

select empno, ename, job, sal, comm, deptno from emp where comm is null;
-- null���� ���� �� �����Ƿ� ������ ����
select empno, ename, job, sal, comm, deptno from emp where comm < null;

-- ���� ������ (), NOT, AND, OR��
select empno, ename, job, sal, hiredate, deptno from emp where sal>=2800 and job = 'MANAGER';
select empno, ename, job, sal, hiredate, deptno from emp where sal>=2800 or job = 'MANAGER';

-- NOT ������
-- not �÷��� : ~�� �����ʴ� not�÷���> : ~����ũ���ʴ�(�۰ų� ����)��� ,between, in, like�� �տ� ��� (ex. not in ~)
select empno, ename, job, sal, deptno from emp where not job in ('MANAGER', 'CLERK', 'ANALYST');
select ename, sal, job from emp where not sal between 1000 and 3000;
-- A���ڰ� ���Ե��� �ʴ°� -> 1�� �̻�%
select ename, sal, deptno from emp where ename not like '%A%';
-- is null�� not�����ڸ� ���̸� is not null�� �ȴ�
select ename, sal, comm, deptno from emp where comm is not null;

-- order by�� : ��ȸ�� �����͸� ������������ �����Ѵ� -> ���ڴ� ���������� ��¥�� ���ź��� ���ڴ� ������ ��
-- desc�� : �������� -> ����������, �ֽų�¥ �� 
-- **order by���� �׻� select���� �������� ���!!**

-- �Ի����ڰ� ���� ���� ����̴ϱ� ��¥�°��ź��� ��ȸ�ؾ��� -> order by
select empno, ename, job, sal, hiredate, deptno from emp order by hiredate;


-- emp���̺����� �μ���ȣ�� ������������ ������ �μ���ȣ�� ���� ��� �޿��� ���� ������ �����Ͽ� �����ȣ, ����, ����, �μ���ȣ, �޿��� ��� 
select empno, ename, job, deptno, sal from emp order by deptno, sal desc;

select distinct deptno, job from emp order by job;




--�Լ�
-- LOWER : ��� ���ڿ� �ҹ��ڷ� ��ȯ
-- UPPER : ��� ���ڸ� �빮�ڷ� ����
-- INITCAP : ���ڿ��� ù���ڴ� �빮�� �������� �ҹ��ڷ� ����
-- CONCAT(s1, s2) : �� ���ڿ��� ����
-- SUBSTR(s, m , n) : ���ڿ� �� ������ ��ġ���� ������ ���̸�ŭ�� ���ڿ��� ���� (�ε�����ȣ) -�� �ڷ�
-- INSTR(s1, s2, m, n) : ���ڿ� ���� Ư�� ���ڿ��� ��ġ�� ���ڷ� ǥ��
-- LENGTH(s) : ������ ���̸� ���� ������ ǥ��
-- CHR(n) : ascii �ڵ尪�� n�� ���� ��ȯ
-- ASCII(s) : s������ ascii �ڵ尪 ��ȯ

-- emp���̺����� 10�� �μ������� �����ȣ, ����, ������, ������ ��� �ҹ��ڷ� ���� ù���ڸ� �빮�ڷ� �������� ��ȸ
select empno, ename, job, lower(job), initcap(job) from emp where deptno = 10;

-- emp���̺����� �̸��� ù���ڰ� 'K'���� ũ�� 'Y'���� ���� ����� �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ��ȸ, ����� �̸������� ����
select empno, ename, job, sal, deptno from emp where substr(ename,1, 1) > 'K' and substr(ename,1, 1) < 'Y' order by ename;

select empno, length(ename), sal, length(sal) from emp;

-- emp���̺����� �̸� �� 'L'���� ��ġ ��ȸ
select ename, instr(ename, 'L') e_null, instr(ename, 'L', 1,1) e_11, instr(ename, 'L',1,2) e_12, instr(ename,'L',3,1) e_31 from emp order by ename;

--�����Լ�
-- LPAD(s1, s2) : ���ڿ��� ������ ���� ������ ������ ���ڷ� ä��!  (s1���� �����ؼ� ��)
-- RPAD(s1, s2) : '' ������ ä��

-- LTRIM(s, c) : ��� ���ڿ��� �����ʺ��� ������ ���ڵ��� ����!    -> set ������ �⺻ ���鹮�ڷ� ����
-- RTRIM(s, c) '' ������ ����
-- TRIM() : ��, �ڿ� ������ Ư�� ���ڸ� ����             -> ex) TRIM(LEADING 'A' FROM 'AABDCADD') : BDCADD�� ���('A'Ư����������!!)
-- TRANSLATE(s, from, to) : ù ���ڴ� Ž�������� ù ���ڷ� ��ü(2��°�� ����)       //������ ���ڷ� ��ü
-- REPLACE(s, p, r) : Ư�����ڿ��� �ٸ� ���ڿ��� ��ü

-- emp���̺����� 20�� �μ��� ��� ������ �� ���� 'A'�����ϰ� �޿� �� ���� 1�� ���� �� ���
select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1) from emp where deptno = 20;
-- ����
select ename, job, RTRIM(job, 'T'), sal,RTRIM(sal, 0) from emp where deptno = 10;

-- 20�� �μ� ����̸��� sc���ڸ� *?�� ��ü
select ename, REPLACE(ename,'SC','*?') from emp where deptno = 20;

-- TRANSLATE()�� �μ���ȣ 20���� ����̸��� SC���ڿ��� *?�� ������ȸ
select ename, TRANSLATE(ename, 'SC', '*?') ������ from emp where deptno = 20;

-- �μ���ȣ10���� ����̸��� translate�Լ��̿��Ͽ� �ҹ��ڷ� �ٲپ� ��ȸ
select empno, ename, translate(ename, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnop') u_lower from emp where deptno = 10;

--���� �Լ�
-- ROUND : ������ �ڸ��� �ݿø� ����           //0�� �����ǹǷ� �⺻�� 0�̴ϱ� 2�� �Ҽ����ڷ� 0,1,2 �̷��� ����
-- TRUNC : ������ �ڸ����� ���� ����
-- MOD(M, N) : M�� N���� ���� ������(%)
-- ABS : ���밪
-- FLOOR : �ش� ������ �۰ų� ���� ���� �� ���� ū ������ ����           (�ݿø�)
-- CEIL : �ش� ������ ũ�ų� ���� ���� �� ���� ���� ������ ����           (�ݳ���?)
-- SIGN : ���ڰ� ����� 1, ������ -1, 0�̸� 0��ȯ
-- POWER(M, N) : M�� N����

-- *M���� �����ϸ� ����Ʈ���� 0���� ����!!*

-- EMP���̺����� �μ���ȣ 10�� ����� �޿��� 30���� ���� �������� ���ؼ� ���
SELECT SAL, MOD(SAL , 30) ������ FROM EMP WHERE DEPTNO = 10;

--��¥ ���