CREATE TABLE DEPT ( 
DEPTNO NUMBER(2), 
DNAME VARCHAR2(14),
 LOC VARCHAR2(13), 
CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) ); 

CREATE TABLE EMP ( 
EMPNO NUMBER(4), 
ENAME VARCHAR2(10),
 JOB VARCHAR2(9), 
MGR NUMBER(4), 
HIREDATE DATE, 
SAL NUMBER(7, 2),
 COMM NUMBER(7, 2), 
DEPTNO NUMBER(2), 
CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO), 
CONSTRAINT PK_EMP PRIMARY KEY (EMPNO) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
INSERT INTO EMP VALUES(7369, 'SMITH', 'CLERK', 7902,'17-DIC-1980', 800, NULL, 20);
INSERT INTO EMP VALUES(7499, 'ALLEN', 'SALESMAN', 7698,'20-FEB-1981',1600, 300, 30);
INSERT INTO EMP VALUES(7521, 'WARD', 'SALESMAN', 7698,'22-FEB-1981',1250, 500, 30);
INSERT INTO EMP VALUES(7566, 'JONES', 'MANAGER', 7839,'2-ABR-1981', 2975, NULL, 20);
INSERT INTO EMP VALUES(7654, 'MARTIN', 'SALESMAN', 7698,'28-SEP-1981',1250, 1400, 30);
INSERT INTO EMP VALUES(7698, 'BLAKE', 'MANAGER', 7839,'1-MAY-1981', 2850, NULL, 30);
INSERT INTO EMP VALUES(7782, 'CLARK', 'MANAGER', 7839,'9-JUN-1981', 2450, NULL, 10);
INSERT INTO EMP VALUES(7788, 'SCOTT', 'ANALYST', 7566,'09-DIC-1982', 3000, NULL, 20);
INSERT INTO EMP VALUES(7839, 'KING', 'PRESIDENT', NULL,'17-NOV-1981', 5000, NULL, 10);
INSERT INTO EMP VALUES(7844, 'TURNER', 'SALESMAN', 7698,'8-SEP-1981', 1500, 0, 30);
INSERT INTO EMP VALUES(7876, 'ADAMS', 'CLERK', 7788,'12-ENE-1983', 1100, NULL, 20);
INSERT INTO EMP VALUES(7900, 'JAMES', 'CLERK', 7698,'3-DIC-1981', 950, NULL, 30);
INSERT INTO EMP VALUES(7902, 'FORD', 'ANALYST', 7566,'3-DIC-1981', 3000, NULL, 20);
INSERT INTO EMP VALUES(7934, 'MILLER', 'CLERK', 7782,'23-ENE-1982', 1300, NULL, 10);

--ejercicio 1
select ename as "Nombre"
from EMP
where COMM is NULL;

--ejercicio 2 ESTA MAL
select dname as "Nombre Departamento", ename as "Nombre empleado",sal as "Salario"
from emp, dept
where ceil(15000);

--ejercicio 3


--ejercicio 4
select count(job) as "Num de jefes"
from emp
where job='CLERK';

--ejercicio 5
select (max(sal)-min(sal)) as "Diferencia"
from emp;

--ejercicio 6
select max(sal) as "Maximo", trunc(avg(sal),0) as "Medio",min(sal) as "Minimo"
from emp
where (select dname as "Nombre departamento" from dept)
order by 1;

--ejercicio 7
select deptno as "Numero departamento"
from dept
where deptno=(select deptno as "Numero empleados" from emp);

--ejercicio 8
select deptno as "Numero departamento"
from dept
where 5<=(select count(empno) as "Numero empleados" from emp);

--ejercicio 9
select deptno as "Numero departamento"
from dept
where 3<=(select count(job) as "Numero empleados" from emp);