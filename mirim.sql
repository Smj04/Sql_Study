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

--실습
select * from emp;
select ename, sal, sal+300 from emp;
select  deptno, ename, sal, comm, comm+300 from emp;
select ename, sal , sal *12 from emp;

--앞에다가 값을 쓰고 뒤에 컬럼이름을 쓴다
select ename 결과1, 'Abc' 결과2, sal 결과3, ename from emp;
-- 연결연산자 ||
select ename || ':' || empno || ':' || ':' || job from emp;
select ename || ' is a ' || job from emp;
select ename || ' : 1 Year salary = ' || sal*12 Monthly from emp;

-- distinct 중복제거 키워드 (select바로 뒤에 써야한다!)
select distinct job from emp;
select distinct deptno,job from emp;

-- rownum은 order by 정렬이전에 부여, rowid는 특정한 행을 유일하게 구별
select rownum, rowid from emp;

-- where절 like, in, between, is null, is not null 등등이 모여 조건절 구성
-- 비교 연산자   =(같음), <>, !=, ^=(같지않음)

-- where절에 조건줄때 대소문자 구분!!
select empno, ename, job, sal from emp where job ='MANAGER';
select  ename, sal, deptno from emp where deptno!=30 ;

-- 비교 연산자
-- BETWEEN A값 AND B값 : a값과 b값 사이에 포함되는지 비교한다
-- IN : 여러값 중 어느하나와 일치하는지 비교한다 (=ANY, SOME)    여러값이 안에 있는지 확인할때사용()
-- LIKE : 특정 패턴에 속하는 값을 조회하고자 하는 경우              '%' : 0개/1개 이상 문자와 대응, '_' : 1개 문자와 대응   뒤에 %꼭 써주기 한글자 아니면!
-- 포함되면 _%
-- IS NULL : 널 여부를 확인한다

-- between을 사용할 경우 a값에는 작은값을 먼저 지정해야한다
select ename, job, sal, deptno from emp where sal between 1300 and 1700 ;

select empno, ename, job, sal, hiredate from emp where empno in (7902, 7788, 7566);

select ename, sal, job from emp where ename like '_A%';
select ename, sal, job from emp where ename like '%A%';

select empno, ename, job, sal, comm, deptno from emp where comm is null;
-- null보다 작을 수 없으므로 에러가 난다
select empno, ename, job, sal, comm, deptno from emp where comm < null;

-- 논리 연산자 (), NOT, AND, OR순
select empno, ename, job, sal, hiredate, deptno from emp where sal>=2800 and job = 'MANAGER';
select empno, ename, job, sal, hiredate, deptno from emp where sal>=2800 or job = 'MANAGER';

-- NOT 연산자
-- not 컬럼명 : ~와 같지않다 not컬럼명> : ~보다크지않다(작거나 같다)등등 ,between, in, like등 앞에 사용 (ex. not in ~)
select empno, ename, job, sal, deptno from emp where not job in ('MANAGER', 'CLERK', 'ANALYST');
select ename, sal, job from emp where not sal between 1000 and 3000;
-- A문자가 포함되지 않는것 -> 1개 이상%
select ename, sal, deptno from emp where ename not like '%A%';
-- is null의 not연산자를 붙이면 is not null이 된다
select ename, sal, comm, deptno from emp where comm is not null;

-- order by절 : 조회된 데이터를 오름차순으로 정렬한다 -> 숫자는 작은값부터 날짜는 과거부터 문자는 영문자 순
-- desc절 : 내림차순 -> 높은값부터, 최신날짜 등 
-- **order by절은 항상 select문의 마지막에 사용!!**

-- 입사일자가 제일 빠른 사원이니까 날짜는과거부터 조회해야함 -> order by
select empno, ename, job, sal, hiredate, deptno from emp order by hiredate;


-- emp테이블에서 부서번호로 오름차순으로 정렬후 부서번호가 같을 경우 급여가 많은 순으로 정렬하여 사원번호, 성명, 업무, 부서번호, 급여를 출력 
select empno, ename, job, deptno, sal from emp order by deptno, sal desc;

select distinct deptno, job from emp order by job;




--함수
-- LOWER : 대상 문자열 소문자로 변환
-- UPPER : 모든 문자를 대문자로 변경
-- INITCAP : 문자열의 첫문자는 대문자 나머지는 소문자로 변경
-- CONCAT(s1, s2) : 두 문자열을 연결
-- SUBSTR(s, m , n) : 문자열 중 지정한 위치에서 지정한 길이만큼의 문자열을 추출 (인덱스번호) -는 뒤로
-- INSTR(s1, s2, m, n) : 문자열 내의 특정 문자열의 위치를 숫자로 표시
-- LENGTH(s) : 문자의 길이를 숫자 값으로 표시
-- CHR(n) : ascii 코드값이 n인 문자 반환
-- ASCII(s) : s문자의 ascii 코드값 반환

-- emp테이블에서 10번 부서원들의 사원번호, 성명, 담당업무, 업무를 모두 소문자로 업무 첫글자만 대문자로 나오도록 조회
select empno, ename, job, lower(job), initcap(job) from emp where deptno = 10;

-- emp테이블에서 이름의 첫글자가 'K'보다 크고 'Y'보다 작은 사원의 사원번호, 이름, 업무, 급여, 부서번호를 조회, 결과는 이름순으로 정렬
select empno, ename, job, sal, deptno from emp where substr(ename,1, 1) > 'K' and substr(ename,1, 1) < 'Y' order by ename;

select empno, length(ename), sal, length(sal) from emp;

-- emp테이블에서 이름 중 'L'자의 위치 조회
select ename, instr(ename, 'L') e_null, instr(ename, 'L', 1,1) e_11, instr(ename, 'L',1,2) e_12, instr(ename,'L',3,1) e_31 from emp order by ename;

--문자함수
-- LPAD(s1, s2) : 문자열을 제외한 왼쪽 공간에 지정한 문자로 채움!  (s1까지 포함해서 셈)
-- RPAD(s1, s2) : '' 오른쪽 채움

-- LTRIM(s, c) : 대상 문자열의 오른쪽부터 지정한 문자들을 제거!    -> set 생략시 기본 공백문자로 적용
-- RTRIM(s, c) '' 오른쪽 제거
-- TRIM() : 앞, 뒤에 나오는 특정 문자를 제거             -> ex) TRIM(LEADING 'A' FROM 'AABDCADD') : BDCADD로 출력('A'특정문자제거!!)
-- TRANSLATE(s, from, to) : 첫 문자는 탐색집합의 첫 문자로 대체(2번째도 동일)       //지정한 문자로 대체
-- REPLACE(s, p, r) : 특정문자열을 다른 문자열로 대체

-- emp테이블에서 20번 부서의 사원 담당업무 중 좌측 'A'삭제하고 급여 중 좌측 1을 삭제 후 출력
select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1) from emp where deptno = 20;
-- 우측
select ename, job, RTRIM(job, 'T'), sal,RTRIM(sal, 0) from emp where deptno = 10;

-- 20번 부서 사원이름중 sc문자를 *?로 교체
select ename, REPLACE(ename,'SC','*?') from emp where deptno = 20;

-- TRANSLATE()로 부서번호 20번의 사원이름에 SC문자열을 *?로 변경조회
select ename, TRANSLATE(ename, 'SC', '*?') 변경결과 from emp where deptno = 20;

-- 부서번호10번의 사원이름을 translate함수이용하여 소문자로 바꾸어 조회
select empno, ename, translate(ename, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnop') u_lower from emp where deptno = 10;

--숫자 함수
-- ROUND : 지정된 자리로 반올림 수행           //0이 생략되므로 기본이 0이니까 2면 소수점뒤로 0,1,2 이렇게 생각
-- TRUNC : 지정된 자리에서 버림 수행
-- MOD(M, N) : M을 N으로 나눈 나머지(%)
-- ABS : 절대값
-- FLOOR : 해당 수보다 작거나 같은 정수 중 가장 큰 정수값 리턴           (반올림)
-- CEIL : 해당 수보다 크거나 같은 정수 중 가장 작은 정수값 리턴           (반내림?)
-- SIGN : 숫자가 양수면 1, 음수면 -1, 0이면 0반환
-- POWER(M, N) : M의 N제곱

-- *M값을 생략하면 디폴트값은 0으로 적용!!*

-- EMP테이블에서 부서번호 10번 사원의 급여를 30으로 나눈 나머지를 구해서 출력
SELECT SAL, MOD(SAL , 30) 변경결과 FROM EMP WHERE DEPTNO = 10;

--날짜 계산