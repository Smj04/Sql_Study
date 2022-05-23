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

-- DEPT테이블에 데이터 삽입
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP테이블에 데이터 삽입
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

-- SALGRADE테이블에 데이터 삽입
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

commit;

select * from emp; -- emp테이블에 있는 내용을 읽어서 모든 컬럼을 화면에 출력한다.
select * from dept; -- dept테이블에 있는 내용을 읽어서 모든 컬럼을 화면에 출력한다.
select empno, ename, sal, comm from emp;
select sal from emp;
select empno, ename, sal , sal+300 from emp; -- sal에 300을 더한 새로운 급여컬럼을 추가한다.
select empno, ename, sal , 2*sal+300 from emp;
select empno, ename, sal , 2*(sal+300) from emp; -- 우선순위에 따라 괄호부터 연산한다 때문에 위에 결과랑 다르다.

select empno, ename, sal , comm ,comm+300 from emp; -- 알 수 없는 값null
-- comm+300에서 comm값이 NULL값이면 그 결과도 NULL이 된다.

select ename AS name, sal, sal + 12 "Annual Salary"
FROM emp; -- sal에 12를 더한 컬럼이름을 "Annual Salary"로 지정한다.

select ename 결과1, 'ABCde' 결과2, sal 결과3, 500 결과4 --뒤에 한글이 필드명이 된다
from emp;

select ename || ':' || empno || ':' || job "이름사원업무"
from emp;

select ename || ' is a ' || job As "Employee Details"
from emp;

select ename || ' : 1 Year Salary = ' || sal * 12 Monthly -- ||은 결과값과 글씨를 연결해주는 것이다
from emp; -- sal*12는 월급 1년(12개월)을 곱하면 연봉이 된다.

select distinct job 
from emp;

select All * from emp;
select * from emp; -- All이 생략된 표현 
select distinct job from emp; -- job컬럼을 가지고 중복 제거
select distinct deptno, job from emp; -- deptno(부서번호)와 job컬럼의 값이 중복되지 않게 출력 (distinct명령어 : 분명한,뚜렷한)

select ROWID, rownum, ename, sal
from emp where rownum <= 3; -- Rownum이 3까지 출력 where 조건절

select empno, ename, job, sal
from emp where job = 'MANAGER'; -- 시험문제 : emp테이블에서 담당업무가 manager인 empno, ename, job, sal 사원의 정보를 조회

select empno, ename, job, sal from emp where job = 'Manager'; -- 실제 데이터는 모두 대문자로 저장되어 있다

select empno, ename, job, sal from emp where sal >= 3000; -- sal이 3000이거나 큰값 셀 출력

select empno, ename, job, sal, deptno from emp where  deptno != 30;
select empno, ename, job, sal, deptno from emp where  deptno <> 30;
select empno, ename, job, sal, deptno from emp where  deptno ^= 30; --위에 3개다 결과값이 동일하다

select ename, job, sal, deptno from emp where sal BETWEEN 1300 AND 1700; --  sal(급여)가 1300  ~ 1700이 출력된다(between A and B 명령어)

select empno, ename, job, sal, hiredate from emp where empno IN (7902, 7788, 7566); -- empno필드 7902, 7788, 7566인 셀 출력
select empno, ename, job, sal, hiredate from emp where empno = 7902 OR empno = 7788 OR empno = 7566; -- 위와 동일한 코드 위코드가 가독성이 좋다

select ename, sal, job from emp where ename LIKE '_A%';
-- ename 값이 두번째 글자가 A인 모든 데이터를 출력                   _는 1개 %는 0개이상

select ename, sal, job from emp where ename LIKE '%A%'; -- ename에 'A'문자가 포함되면 TRUE를 리턴한다 시험문제!!!!!!!!! #이 붙은 %는 데이터 %  ESCAPE whildcard문자

select empno, ename, job, sal, comm, deptno from emp where comm = NULL; -- 결과가 없음. NULL의 결과는 NULL
select empno, ename, job, sal, comm, deptno from emp where comm < NULL;
select empno, ename, job, sal, comm, deptno from emp where comm ^= NULL;

select empno, ename, job, sal, comm, deptno from emp where comm IS NULL; -- comm 에 있는 데이터가 NULL이면 TRUE값이 리턴

select empno, ename, job, sal, deptno from emp where sal>=2800 AND job ='MANAGER'; -- 데이터는 대소문자 구별한다!

select empno, ename, job, sal, deptno from emp where sal>=2800 OR job ='MANAGER';

select empno, ename, job, sal, deptno from emp where job NOT IN('MANAGER',' CLERK', 'ANALYST');

select ename, sal, job from emp where sal NOT BETWEEN 1000 AND 3000;

select * from emp where ename LIKE 'A%'; --A문자로 시작하는 이름을 출력.
select * from emp where ename NOT LIKE 'A%'; -- A가 안들어가는 이름을 출력.

select ename, sal, comm, deptno from emp where comm IS NOT NULL; -- 보너스(comm)이 NULL인 데이터를 출력

select ename, sal, comm, deptno from emp where (NVL(comm, 0)=0); -- comm이 NULL이면 0값으로 변경하시오.

select empno, ename, job, sal from emp where sal > 1500 AND job = 'PRESIDENT' OR job = 'SALESMAN'; -- 급여가 1500이상이고 직업이 president거나 job이 salesman을 출력
select empno, ename, job, sal from emp where sal > 1500 AND job IN( 'PRESIDENT' , 'SALESMAN'); -- 위와 결과가 동일하다 IN('');

select empno, ename, job, sal, hiredate from emp order by hiredate; -- 입사일자를 오름 차순(과거날짜에서 현재날짜순으로)

select empno, ename, job, sal, hiredate from emp order by hiredate DESC;

select empno, ename, job, sal, deptno, hiredate from emp order by deptno, sal DESC;

select empno, ename, job, sal, deptno, hiredate from emp order by 4; -- 1:empno, 2:ename, 3:job ,4:sal 그래서 sal을 기준으로 오름차순이 된다.

select empno, ename, job, deptno, sal, hiredate from emp order by 4,5 desc; -- 4번째 컬럼 deptno는 오름차순, 5번째 컬럼 sal은 내림차순

select DISTINCT deptno, job from emp order by job;
 -- 별칭으로 컬럼이름을 ANN_SAL을 지정하였음 이때 Ann_SAL은 sal*12한 값이 할당된다

select DISTINCT deptno, job from emp order by job; -- job을 기준으로 중복제거(distinct)오름차순

select empno, sal, sal*12 ANN_SAL from emp order by deptno; -- DISTINCT를 사용하지 않으면 emp테이블에 있는 모든 컬럼을 정렬 기준으로 사용할 수 있다

-- 오류 발생! DISTINCT를 사용할 경우 없는 컬럼을 부를시 오류발생(sal은 select절에 없기 때문에) select DISTINCT job, sal+comm from emp order by sal; 

select empno, sal, sal*12 ANN_SAL from emp order by 2;
--4/22 수행예정

--함수
select empno, ename , LOWER(job), UPPER(job), INITCAP(job) from emp where deptno = 10;

select empno, ename, job, 
CONCAT(empno, ename) ename1, 
CONCAT(empno, empno) e_empno,
CONCAT(ename, job) e_job
from emp where deptno = 10; -- 컬럼을 연결하는 함수 CONCAT()
--CONCAT(ename, job)은 ename과 job을 연결해서 하나의 컬럼을 만든다.

--시험문제 잘 나옴
select empno, ename, job, sal, deptno from emp where SUBSTR(ename, 1, 1) > 'K' AND SUBSTR(ename, 1, 1) < 'Y';  --SUBSTR(ename)ename값에서 첫번째 문자 한개를 반환한다

select empno, ename, LENGTH(ename), sal,LENGTH(sal) from emp; --인덱스 번호대로x 그냥 번호대로

select ename, 
            INSTR(ename, 'L') e_null, 
            INSTR(ename, 'L', 1,1) e_11,
            INSTR(ename, 'L', 1,2) e_12,
            INSTR(ename, 'L', 4,1) e_41
            from emp order by ename; --L자를 처음부터 찾아서 각각의 별칭컬럼에 할당한다
            
            --substr(ename, 1, 3); --ename의 문자열 데이터에서 첫번째 위치부터 3개의 문자열을 반호나
            
--59page
select ename, LPAD(ename , 15,'*'), sal, LPAD(sal, 10, '$') from emp where deptno = 10; -- LPAD()왼쪽에 숫자자리만큼 특수문자로 채운다
select ename, RPAD(ename , 15,'*'), sal, RPAD(sal, 10, '$') from emp where deptno = 10; -- RPAD() 오른쪽에 숫자자리만큼 문자로 채운다


select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1) from emp where deptno = 20; -- LTRIM()값의 왼쪽 숫자자리만큼을 제거.
--LITRIM(job, 'A')에서 job데이터가 맨 왼쪽에서 'A'문자가 있으면 삭제
--LITRIM(sal, 1)에서 급여 데이터가 맨 왼쪽에 1의 숫자가 있으면 삭제되고, 연속해서 있을 경우에도 계속삭제한다.

select ename, job, RTRIM(job, 'T'), sal, RTRIM(sal, 0) from emp where deptno = 10; -- RTRIM()은 오른쪽 숫자자리만큼을 제거

--REPLACE() vs TRANSLATE() REPLACE()는 문자열 전체값비교, TRANSLATE()는 문자값 각각 하나씩 비교
select ename, REPLACE(ename, 'SC', '*?') AS 변경결과 from emp where deptno = 20; -- REPLACE(대체할 컬럼이름, 대체할문자선택, '대체할 값바꿈') AS 별칭컬럼에 결과값할당
select ename, TRANSLATE(ename, 'SC','*?') 변경결과2 from emp where deptno = 20; -- TRANSLATE()     TRANSLATE('sc','*?'); s와 c 따로 각각 하나씩 비교해서 모두가 같은 경우에만 변경  --> s문자는 *로 변경하고 c문자는 ?로 변경한다


--65P
select ename, hiredate, hiredate+3, hiredate+5/24 from emp where deptno = 30;
alter SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD-HH24:MI:SS'; -- 날짜형식을 변경

----66P 시험문제 예제
--SELECT ename, hiredate, sysdate, sysdate - hiredate "Total Days", 
--    TRUNC((sysdate-hiredate)/7, 0) Weeks,--소수점버림
--    ROUND(MOD(sysdate-hiredate), 7,0) Days
--FROM emp order by sysdate-hiredate;

--오늘 날짜 출력하기(일자,월,년도) EXTRACT(? from sysdate)함수  숫자를 반환함
select EXTRACT (day from sysdate) 일자,
        EXTRACT (month from sysdate) 월,
        EXTRACT (year from sysdate) 년도
from DUAL;

DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE LOCATIONS;
DROP TABLE SALGRADE;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14),
	LOC_CODE VARCHAR2(2) 
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

-- DEPT테이블에 데이터 삽입
INSERT INTO DEPT VALUES(10,'ACCOUNTING','A1');
INSERT INTO DEPT VALUES(20,'RESEARCH','B1');
INSERT INTO DEPT VALUES(30,'SALES','C1');
INSERT INTO DEPT VALUES(40,'OPERATIONS','A1');
INSERT INTO DEPT VALUES(50,'INSA',NULL);

-- EMP테이블에 데이터 삽입
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

-- SALGRADE테이블에 데이터 삽입
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

-- LOCATIONS 테이블에 데이터 삽입
INSERT INTO LOCATIONS VALUES ('A1','SEOUL');
INSERT INTO LOCATIONS VALUES ('B1','DALLAS');
INSERT INTO LOCATIONS VALUES ('C1','CHICAGO');
INSERT INTO LOCATIONS VALUES ('D1','BOSTON');
commit;

-- 예제2
select e.empno, e.ename, e.deptno, d.deptno, d.dname, d.loc_code from emp e, dept  d where d.deptno = e.deptno and e.job = 'SALESMAN';

select * from emp; --14행
select * from dept; --5행

-- 예제3
select e.ename, d.dname, e.deptno ed, d.deptno ddd, d.loc_code d1, l.loc_code ll, e.sal, 1.city 
from emp e, dept d, locations l
where d.deptno = e.deptno and d.loc_code = l.loc_code
and e.sal > 1500 and l.city = 'DALLAS';

-- NON EQUIT JOIN : '='이 아닌것
select e.ename, d.dname, e.deptno ed, d.deptno ddd, d.loc_code d1, l.loc_code ll, e.sal, 1.city 
from emp e, dept d, locations l
where d.deptno = e.deptno and d.loc_code = l.loc_code