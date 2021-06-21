CREATE TABLE Centros(
    numce number(4) not null,
    nomce varchar2(25),
    dirce varchar2(25),

    CONSTRAINT pkCentros PRIMARY KEY (numce)
);

CREATE TABLE DEPARTAMENTOS (
    NUMDE   NUMBER(3)   PRIMARY KEY,
    NUMCE   NUMBER(4) REFERENCES CENTROS(NUMCE),
    DIREC   NUMBER(3),
    TIDIR   CHAR(1),
    PRESU   NUMBER(3,1),
    DEPDE   NUMBER(3) REFERENCES DEPARTAMENTOS(NUMDE),
    NOMDE   VARCHAR2(30)
);


CREATE TABLE Empleados(
    numem number(3) not null,
    extel number(3),
    fecna date,
    fecin date,
    salar number(5),
    comis number(3),
    numhi number(1),
    nomem varchar2(10),
    numde number(3),

    CONSTRAINT pkEmpleados PRIMARY KEY(numem),
    CONSTRAINT fk1Empleados FOREIGN KEY(numde) REFERENCES Departamentos(numde)
);

--CENTROS INSERCIONES
INSERT INTO CENTROS VALUES(10,'SEDE CENTRAL','C/ ATOCHA, 820, MADRID');
INSERT INTO CENTROS VALUES(20,'RELACIÓN CON CLIENTES','C/ ATOCHA, 405,MADRID');

--DEPARTAMENTOS INSERCIONES
INSERT INTO DEPARTAMENTOS VALUES(100,10,260,'P',72,NULL,'DIRECCIÓN GENERAL');
INSERT INTO DEPARTAMENTOS VALUES(110,20,180,'P',90,100,'DIRECC.COMERCIAL');
INSERT INTO DEPARTAMENTOS VALUES(111,20,180,'F',66,110,'SECTOR INDUSTRIAL');
INSERT INTO DEPARTAMENTOS VALUES(112,20,270,'P',54,110,'SECTOR SERVICIOS');
INSERT INTO DEPARTAMENTOS VALUES(120,10,150,'F',18,100,'ORGANIZACIÓN');
INSERT INTO DEPARTAMENTOS VALUES(121,10,150,'P',12,120,'PERSONAL');
INSERT INTO DEPARTAMENTOS VALUES(122,10,350,'P',36,120,'PROCESO DE DATOS');
INSERT INTO DEPARTAMENTOS VALUES(130,10,310,'P',12,100,'FINANZAS');

--EMPLEADOS INSERCIONES
INSERT INTO EMPLEADOS
VALUES(110,350,'10/11/1970','15/02/1985',1800,NULL,3,'CESAR',121);
INSERT INTO EMPLEADOS
VALUES(120,840,'09/06/1968','01/10/1988',1900,110,1,'MARIO',112);
INSERT INTO EMPLEADOS
VALUES(130,810,'09/09/1965','01/02/1981',1500,110,2,'LUCIANO',112);
INSERT INTO EMPLEADOS
VALUES(150,340,'10/08/1972','15/01/1997',2600,NULL,0,'JULIO',121);
INSERT INTO EMPLEADOS
VALUES(160,740,'09/07/1980','11/11/2005',1800,110,2,'AUREO',111);
INSERT INTO EMPLEADOS
VALUES(180,508,'18/10/1974','18/03/1996',2800,50,2,'MARCOS',110);
INSERT INTO EMPLEADOS
VALUES(190,350,'12/05/1972','11/02/1992',1750,NULL,4,'JULIANA',121);
INSERT INTO EMPLEADOS
VALUES(210,200,'28/09/1970','22/01/1999',1910,NULL,2,'PILAR',100);
INSERT INTO EMPLEADOS
VALUES(240,760,'26/02/1967','24/02/1989',1700,100,3,'LAVINIA',111);
INSERT INTO EMPLEADOS
VALUES(250,250,'27/10/1976','01/03/1997',2700,NULL,0,'ADRIANA',100);
INSERT INTO EMPLEADOS
VALUES(260,220,'03/12/1973','12/07/2001',720,NULL,6,'ANTONIO',100);
INSERT INTO EMPLEADOS
VALUES(270,800,'21/05/1975','10/09/2003',1910,80,3,'OCTAVIO',112);
INSERT INTO EMPLEADOS
VALUES(280,410,'10/01/1978','08/10/2010',1500,NULL,5,'DOROTEA',130);
INSERT INTO EMPLEADOS
VALUES(285,620,'25/10/1979','15/02/2011',1910,NULL,0,'OTILIA',122);
INSERT INTO EMPLEADOS
VALUES(290,910,'30/11/1967','14/02/1988',1790,NULL,3,'GLORIA',120);
INSERT INTO EMPLEADOS
VALUES(310,480,'21/11/1976','15/01/2001',1950,NULL,0,'AUGUSTO',130);
INSERT INTO EMPLEADOS
VALUES(320,620,'25/12/1977','05/02/2003',2400,NULL,2,'CORNELIO',122);
INSERT INTO EMPLEADOS
VALUES(330,850,'19/08/1958','01/03/1980',1700,90,0,'AMELIA',112);
INSERT INTO EMPLEADOS
VALUES(350,610,'13/04/1979','10/09/1999',2700,NULL,1,'AURELIO',122);
INSERT INTO EMPLEADOS
VALUES(360,750,'29/10/1978','10/10/1998',1800,100,2,'DORINDA',111);
INSERT INTO EMPLEADOS
VALUES(370,360,'22/06/1977','20/01/2000',1860,NULL,1,'FABIOLA',121);
INSERT INTO EMPLEADOS
VALUES(380,880,'30/03/1978','01/01/1999',1100,NULL,0,'MICAELA',112);
INSERT INTO EMPLEADOS
VALUES(390,500,'19/02/1976','08/10/2010',1290,NULL,1,'CARMEN',110);
INSERT INTO EMPLEADOS
VALUES(400,780,'18/08/1979','01/11/2011',1150,NULL,0,'LUCRECIA',111);
INSERT INTO EMPLEADOS
VALUES(410,660,'14/07/1968','13/10/1989',1010,NULL,0,'AZUCENA',122);
INSERT INTO EMPLEADOS
VALUES(420,450,'22/10/1966','19/11/1988',2400,NULL,0,'CLAUDIA',130);
INSERT INTO EMPLEADOS
VALUES(430,650,'26/10/1967','19/11/1988',1260,NULL,1,'VALERIANA',122);
INSERT INTO EMPLEADOS
VALUES(440,760,'26/09/1966','28/02/1986',1260,100,0,'LIVIA',111);
INSERT INTO EMPLEADOS
VALUES(450,880,'21/10/1966','28/02/1986',1260,100,0,'SABINA',112);
INSERT INTO EMPLEADOS
VALUES(480,760,'04/04/1965','28/02/1986',1260,100,1,'DIANA',111);
INSERT INTO EMPLEADOS
VALUES(490,880,'06/06/1964','01/01/1988',1090,100,0,'HORACIO',112);
INSERT INTO EMPLEADOS
VALUES(500,750,'08/10/1965','01/01/1987',1200,100,0,'HONORIA',111);
INSERT INTO EMPLEADOS
VALUES(510,550,'04/05/1966','01/11/1986',1200,NULL,1,'ROMULO',110);
INSERT INTO EMPLEADOS
VALUES(550,780,'10/01/1970','21/01/1998',600,120,0,'SANCHO',111);

--CONSULTAS SENCILLAS

--ejercicio 1
select nomde 
from departamentos
where tidir ='F'
order by 1;

--ejercicio 2
select nomem,numem,extel
from empleados
where numde=121
order by 1;

--ejercicio 3
select nomem,extel
from empleados
where numde=110
order by 1;

--ejercicio 4
select comis,nomem,salar
from empleados
where numhi=3
order by comis;

--ejercicio 5
select comis,nomem,salar
from empleados
where numhi=3 and comis is not null
order by comis;

--ejercicio 6
select salar,nomem
from empleados
where numhi=0 and salar>1200 and salar<1500
order by 1 desc,2;

--ejercicio 7
select distinct numde
from empleados
where salar<1500
order by 1;

--ejercicio 8
select distinct comis
from empleados
where numde=110;

--CONSULTAS CON PREDICADOS BASICOS

--ejercicio 1
select 'DEPARTAMENTO DE ' || nomde as "NOMBRE"
from departamentos
where presu<30
order by 1;

--ejercicio 2
select numde ||'-'|| nomde as "Numero-nombre",tidir as "Tipo de Director"
from departamentos
where presu <30
order by 1;

--ejercicio 3
select nomem "Nombre", 12*salar as "Salario 2014",12*1.02*salar as "Salario 2015", 12*1.02*1.02*salar as "Salario 2016"
from empleados
where numhi>4
order by 1;

--ejercicio 4
select nomem
from empleados
where 120*numhi>0.2*salar
order by 1;

--ejercicio 5
select nomem as "Nombre",comis+salar as "Salario total"
from empleados
where numde=112 
order by 2 desc,1;

--ejercicio 6
select nomem as "Nombre", comis+salar as "Salario total"
from empleados
where numde=112 and comis is not null
order by 2 desc,1;

--ejercicio 7
select nomem as "Nombre", comis+salar || '$' as "Salario total"
from empleados
where numde=112 and comis is not null
order by 2 desc,1;

--ejercicio 8
select nomem as "Nombre",salar+60*(numhi-3) || '$' as "Salario total"
from empleados
where numhi>=4
order by 1;

--ejercicio 9
select nomem as "Nombre",salar+60*(numhi-3) || '$' as "Salario total"
from empleados
where numhi>=(select numhi from empleados where nomem='JULIANA')
order by 1;

--ejercicio 10
select nomem
from empleados
where salar>1.15*(select salar from empleados where nomem='CLAUDIA')
order by 1;

--ejercicio 11
select nomde 
from departamentos
where depde is null;
