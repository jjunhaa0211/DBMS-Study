

DROP DATABASE IF EXISTS scott;

CREATE DATABASE scott;

USE scott;

CREATE TABLE DEPT (
    DEPTNO DECIMAL(2), # 부서번호
    DNAME VARCHAR(14), # 부서명
    LOC VARCHAR(13), # 부서위치
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4), # 사원번호
    ENAME VARCHAR(10), # 사원명
    JOB VARCHAR(9), # 직무(직급)
    MGR DECIMAL(4), # 상사
    HIREDATE DATE, # 고용일 , 입사일
    SAL DECIMAL(7,2), #월급
    COMM DECIMAL(7,2), 
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE TINYINT,
    LOSAL SMALLINT,
    HISAL SMALLINT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);


#1. 사원 테이블의 모든 레코드를 조회하시오.

select * from EMP;

#2. 사원명과 입사일을 조회하시오.

select ENAME, HIREDATE from EMP;

#3. 사원번호와 이름을 조회하시오.

select EMPNO, ENAME from EMP;

#4. 사원테이블에 있는 직책의 목록을 조회하시오. (hint : distinct, group by)

select JOB from Emp group by JOB;
# select distinct job from emp;

#6. 부서번호가 10인 사원을 조회하시오.

select ENAME, if(DEPTNO = 10, '10', 'none') from EMP;

#7. 월급여가 2500이상 되는 사원을 조회하시오.

select ENAME, if(SAL <= 2500,'25000 이상','2500이 되지 않음') from EMP;

#8. 이름이 'KING'인 사원을 조회하시오.

select * from EMP where ENAME LIKE '%KING%';

#9. 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오. (hint : like)

select EMPNO, ENAME from EMP where ENAME LIKE 'S%';

#11. 커미션이 300, 500, 1400 인 사원의 사번,이름,커미션을 조회하시오. (hint : OR, in )

select EMPNO, ENAME, COMM from EMP where COMM = 300 or COMM = 500 or COMM = 1400;
# select EMPNO, ENAME, COMM from EMP where COMM in (300 ,500 ,1400);

#12. 월급여가 1200 에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오. (hint : AND, between)

select EMPNO, ENAME, SAL from EMP where SAL between 1200 and 3500;

#13. 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오. 

select ename, empno, job, deptno from emp where job = 'MANAGER' and deptno = 30;

select ENAME from EMP where ENAME LIKE 'S%';
