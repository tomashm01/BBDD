/*********************
PRACTICA CURSORES 6.5
*********************/

CREATE TABLE DEPT(
 DEPTNO NUMBER(2),
 DNAME VARCHAR2(14),
 LOC VARCHAR2(13),
 CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO)
);

CREATE TABLE EMP(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10),
 JOB VARCHAR2(9),
 MGR NUMBER(4),
 HIREDATE DATE,
 SAL NUMBER(7, 2),
 COMM NUMBER(7, 2),
 DEPTNO NUMBER(2),
 CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
 CONSTRAINT PK_EMP PRIMARY KEY (EMPNO)
);

/*******  AWS  ************/
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
INSERT INTO EMP VALUES(7369, 'SMITH', 'CLERK', 7902,TO_DATE('17-DIC-1980', 'DD-MON-YYYY'), 800, NULL, 20);
INSERT INTO EMP VALUES(7499, 'ALLEN', 'SALESMAN', 7698,TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600, 300, 30);
INSERT INTO EMP VALUES(7521, 'WARD', 'SALESMAN', 7698,TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250, 500, 30);
INSERT INTO EMP VALUES(7566, 'JONES', 'MANAGER', 7839,TO_DATE('2-ABR-1981', 'DD-MON-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES(7654, 'MARTIN', 'SALESMAN', 7698,TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES(7698, 'BLAKE', 'MANAGER', 7839,TO_DATE('1-MAY-1981', 'DD-MON-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES(7782, 'CLARK', 'MANAGER', 7839,TO_DATE('9-JUN-1981', 'DD-MON-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES(7788, 'SCOTT', 'ANALYST', 7566,TO_DATE('09-DIC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES(7839, 'KING', 'PRESIDENT', NULL,TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES(7844, 'TURNER', 'SALESMAN', 7698,TO_DATE('8-SEP-1981', 'DD-MON-YYYY'), 1500, 0, 30);
INSERT INTO EMP VALUES(7876, 'ADAMS', 'CLERK', 7788,TO_DATE('12-ENE-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES(7900, 'JAMES', 'CLERK', 7698,TO_DATE('3-DIC-1981', 'DD-MON-YYYY'), 950, NULL, 30);
INSERT INTO EMP VALUES(7902, 'FORD', 'ANALYST', 7566,TO_DATE('3-DIC-1981', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES(7934, 'MILLER', 'CLERK', 7782,TO_DATE('23-ENE-1982', 'DD-MON-YYYY'), 1300, NULL, 10);

/*****   SQL LIVE       ***********/
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
INSERT INTO EMP VALUES(7369, 'SMITH', 'CLERK', 7902,TO_DATE('17-DEC-1980', 'DD-MON-YYYY'), 800, NULL, 20);
INSERT INTO EMP VALUES(7499, 'ALLEN', 'SALESMAN', 7698,TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600, 300, 30);
INSERT INTO EMP VALUES(7521, 'WARD', 'SALESMAN', 7698,TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250, 500, 30);
INSERT INTO EMP VALUES(7566, 'JONES', 'MANAGER', 7839,TO_DATE('2-APR-1981', 'DD-MON-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES(7654, 'MARTIN', 'SALESMAN', 7698,TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES(7698, 'BLAKE', 'MANAGER', 7839,TO_DATE('1-MAY-1981', 'DD-MON-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES(7782, 'CLARK', 'MANAGER', 7839,TO_DATE('9-JUN-1981', 'DD-MON-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES(7788, 'SCOTT', 'ANALYST', 7566,TO_DATE('09-DEC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES(7839, 'KING', 'PRESIDENT', NULL,TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES(7844, 'TURNER', 'SALESMAN', 7698,TO_DATE('8-SEP-1981', 'DD-MON-YYYY'), 1500, 0, 30);
INSERT INTO EMP VALUES(7876, 'ADAMS', 'CLERK', 7788,TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES(7900, 'JAMES', 'CLERK', 7698,TO_DATE('3-DEC-1981', 'DD-MON-YYYY'), 950, NULL, 30);
INSERT INTO EMP VALUES(7902, 'FORD', 'ANALYST', 7566,TO_DATE('3-DEC-1981', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES(7934, 'MILLER', 'CLERK', 7782,TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);

/*******************
EJ1. Desarrollar un procedimiento que visualice el apellido y la fecha de alta 
de todos los empleados ordenados por apellido.
*********************/ 

CREATE OR REPLACE PROCEDURE ej1 IS
--crear un cursor con la consulta  
CURSOR lista IS
    SELECT ename, hiredate FROM emp ORDER BY ename;
BEGIN
    FOR registro IN lista LOOP  --No hace falta declarar registro.
        dbms_output.put_line ('Nombre del empleado:  ' || registro.ename || ' | Fecha de alta en la emrpesa: ' || registro.hiredate);
    END LOOP;
END ej1;

/
CALL ej1
/
SELECT ename, hiredate FROM emp ORDER BY ename;


/*****************
EJ2. Desarrollar un procedimiento que encuentre el primer empleado con un sueldo mayor de 2.000 �.
******************/
CREATE OR REPLACE PROCEDURE ej2 IS
    v_ename emp.ename%TYPE;
    v_sal emp.sal%TYPE;
BEGIN
    -- cursor implicito. No hace falta declararlo.
    SELECT ename, sal INTO v_ename, v_sal 
    FROM emp
    WHERE sal > 2000
    FETCH FIRST 1 ROW ONLY;
    dbms_output.put_line('Primer empleado que gana al menos 2000�: ');
    dbms_output.put_line(v_ename || ' gana ' || v_sal);
END ej2;

/
CALL ej2;
/

SELECT ename, sal FROM emp WHERE sal>2000 FETCH FIRST 1 ROW ONLY;

/************
3. Realizar un procedimiento que visualice el n�mero y apellido de
un empleado, as� como la localidad de su departamento, ordenado por el nombre de la localidad
*************/
CREATE OR REPLACE PROCEDURE ej3 IS
CURSOR cur IS 
    SELECT empno, ename, loc 
    FROM emp INNER JOIN dept
    ON emp.deptno=dept.deptno
    ORDER BY loc;
BEGIN
    FOR registro IN cur LOOP
        dbms_output.put_line ('ID del empleado: ' || registro.empno || ' Nombre del empleado: ' || registro.ename || ' Localidad de trabajo: ' || registro.loc);
    END LOOP;
END ej3;

/
CALL ej3;
/
SELECT empno, ename, loc FROM emp INNER JOIN dept ON emp.deptno=dept.deptno;


/*********************
EJ4. En la tabla EMPLE incrementar el salario el 10% a los empleados que tengan una comisi�n superior al 5% del salario.
*********************/
CREATE TABLE EMPLE(
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(10),
    salold NUMBER(7,2),
    salnew NUMBER(7,2)
);

CREATE OR REPLACE PROCEDURE ej4 IS
CURSOR cur IS
    SELECT empno, ename, sal, comm FROM emp;
comision NUMBER; -- Variable para guardar el c�lculo del 5% de la comisi�n sobre su salario

BEGIN
    DELETE FROM emple; -- Limpio la tabla.
    FOR registro IN cur LOOP
        comision:=registro.sal*5/100;
        IF (registro.comm > comision) THEN
            INSERT INTO emple VALUES (registro.empno, registro.ename, registro.sal, registro.sal*1.10);
        END IF;
    END LOOP;
END ej4;
/
CALL ej4;
/
SELECT * FROM emple;

/********************************
EJ5. Realizar un procedimiento que incremente el salario el 10% a los empleados que tengan una comisi�n superior al 5% del
salario, y visualice el nombre, comisi�n y salario antiguo, y el nombre, comisi�n y salario nuevo de todos los empleados.
**********************************/ 
CREATE OR REPLACE PROCEDURE ej5 IS
    CURSOR cur IS
        SELECT ename, salold, salnew FROM emple; 
BEGIN
    FOR registro IN cur LOOP
        dbms_output.put_line ('Nombre: ' || registro.ename || ' | Salario antiguo: ' || registro.salold || ' | Salario nuevo: ' || registro.salnew);
    END LOOP;
END ej5;
/
CALL ej5;

/***********************************************
EJ6. Escribir un procedimiento que reciba una cadena y visualice el apellido y el n�mero de empleado de todos los empleados cuyo
apellido contenga la cadena especificada. Al finalizar visualizar el n�mero de empleados mostrados
***************************************************/
CREATE OR REPLACE PROCEDURE ej6 (p_cad VARCHAR) IS
    CURSOR cur IS
        SELECT ename, empno
        FROM emp
        WHERE ename LIKE concat ('%', concat (p_cad, '%'));
    i NUMBER:=0;
BEGIN
    FOR registro IN cur LOOP
        dbms_output.put_line ('Nombre: ' || registro.ename || ' | N�mero: ' || registro.empno);
        i:=i+1;
    END LOOP;
        dbms_output.put_line ('Total de Personas: ' || i);
END ej6;
/
CALL ej6('O');

/***************************************************
EJ7. Crear un procedimiento que muestre el nombre de todos los departamentos y el n�mero de empleados que tiene 
(incLuso si no tiene empleados).
*****************************************************/
CREATE OR REPLACE PROCEDURE ej7 IS
    CURSOR cur IS
        SELECT dname, count(empno) AS total
        FROM emp RIGHT JOIN dept
        ON emp.deptno = dept.deptno
        GROUP BY dname;
BEGIN
    FOR registro IN cur LOOP
        dbms_output.put_line ('Departamento: ' || registro.dname || ' Numero de empleados: ' || registro.total);
    END LOOP;
END ej7;
/
CALL ej7;

/*********************************************
EJ8. Buscar todos los empleados que tienen un salario + comisi�n superior a 2000 y 
asignarles como nuevo salario esta suma.  S�lo para los que tienen comisi�n.
*********************************************/
CREATE OR REPLACE PROCEDURE ej8 IS
    CURSOR cur IS
        SELECT empno, ename, sal+comm as newsal
        FROM emp
        WHERE sal+comm > 2000 AND comm IS NOT NULL;
BEGIN
    FOR registro IN cur LOOP
        dbms_output.put_line ('N.empleado: ' || registro.empno || ' | Nombre: ' || registro.ename || ' | Nuevo salario: ' || registro.newsal);
    END LOOP;
END ej8;

/
CALL ej8;

/*************************************
EJ9. Escribir un programa que visualice el apellido y el salario de los cinco empleados que tienen el salario m�s alto.
*****************************************/
CREATE OR REPLACE PROCEDURE ej9 IS
    CURSOR cur IS
        SELECT ename, sal 
        FROM emp
        ORDER BY sal DESC
        FETCH FIRST 5 ROWS ONLY;
BEGIN
    FOR registro IN cur LOOP
        dbms_output.put_line ('Empleado: '|| registro.ename || ' | Salario: ' || registro.sal);
    END LOOP;
END ej9;
/
CALL ej9;

/******************************************
EJ10.Codificar un programa que visualice los dos empleados queganan menos de cada oficio.
************************************************/
CREATE OR REPLACE PROCEDURE ej10 IS
    CURSOR cur IS
        SELECT ename, job, sal FROM emp
        ORDER BY job, sal ASC;
    oldjob emp.job%type:='-';
    i NUMBER;
BEGIN
    FOR registro IN cur LOOP
        IF oldjob <> registro.job THEN
            oldjob:=registro.job;
            i:=0;
        END IF;
        IF i<2 THEN
            dbms_output.put_line ('Puesto: ' || registro.job || ' Empleado: '|| registro.ename || ' | Salario: ' || registro.sal);
            i:=i+1;
        END IF;
    END LOOP;
END ej10;
/
CALL ej10;

/******************************************
EJ15.Realizar un procedimiento para borrar un empleado recibiendo como par�metro
el n�mero de empleado
************************************************/
CREATE OR REPLACE PROCEDURE ej15 (p_num NUMBER) IS 
BEGIN
    DELETE FROM EMP WHERE empno=p_num;
END;
/
CALL proc15('7369');