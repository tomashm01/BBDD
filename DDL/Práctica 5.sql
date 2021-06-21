CREATE TABLE Clientes(
    codigo number(5),
    nif varchar2(9),
    nombre varchar2(30),
    direccion varchar2(30),
    ciudad varchar2(15),
    telefono varchar2(9)
);

CREATE TABLE Materiales(
    codigo_material number(10),
    nombre varchar2(30),
    precio number(5)
);

CREATE TABLE Operaciones(
    codigo_operacion number(10),
    descripcion varchar2(100),
    horas_MO number(1)
);

CREATE TABLE PiezasPorOperacion(
    codigoMaterial number(10),
    codigoOperacion number(10),
    cantidad number(3) 
);

CREATE TABLE Coches(
    matricula varchar2(7),
    marca varchar2(20),
    modelo varchar2(20),
    color varchar2(12),
    pvp number(5),
    codigoCliente varchar2(5)
);

CREATE TABLE Revisiones(
    codigo_revision number(10),
    fechaRevision date,
    matriculaCoche varchar2(7)
);

--1. Color es verde, rojo, amarillo o blanco.
alter table Coches
    add CONSTRAINT ck_color CHECK(color IN('verde','rojo','amarillo','blanco'));
--2.Matricula es cuatro números y tres letras o bien una o dos letras, un guión, cuatronúmeros, un guión y una o dos letras. (Ejs: 2345DFV, M-2332-NV,SE-3445-DF)

alter table Coches
    add CONSTRAINT ck_matricula CHECK(REGEXP_LIKE(matricula,'[0-9]{4}[A-Z]{3} | [A-Z]{1,2}-[0-9]{4}-[A-Z]{1,2}'));

--3.Las revisiones se hacen de 8 de la mañana a 5 de la tarde.
alter table Revisiones
    modify fechaRevision TIMESTAMP;
alter table Revisiones
    add CONSTRAINT ck_horario CHECK(fechaRevision BETWEEN '08:00' AND '17:00');

--4.. Los DNI tienen 9 caractere, siendo el último una letra

alter table Clientes
    add CONSTRAINT ck_dni CHECK(REGEXP_LIKE(nif,'[0-9]{8}[A-Z]{1}'));

--5.Las Horas MO de una operación nunca pasan de 4.

alter table Operaciones
    add CONSTRAINT ck_horas CHECK(horas_MO<=4);

--6.Todas las claves primarias, ajenas y candidatas.

alter table Clientes 
    add CONSTRAINT pk_clientes PRIMARY KEY(codigo);
alter table Coches 
    add CONSTRAINT pk_coche PRIMARY KEY(matricula);
alter table Coches
    add CONSTRAINT fk_coche FOREIGN KEY (codigoCliente) REFERENCES Clientes (codigo);
alter table Revisiones
    add CONSTRAINT pk_revisiones PRIMARY KEY(codigo_revision);
alter table Revisiones
    add CONSTRAINT fk_revisiones FOREIGN KEY (matriculaCoche) REFERENCES Coches(matricula);
alter table Operaciones
    add CONSTRAINT pk_operaciones PRIMARY KEY(codigo_operacion);
alter table PiezasPorOperacion
    add CONSTRAINT pk_piezas_por_operacion PRIMARY KEY(codigoMaterial,codigoOperacion);
alter table Materiales
    add CONSTRAINT pk_material PRIMARY KEY(codigo_material);

--7.La cantidad de Piezas por Operación por defecto es 1.

alter table PiezasPorOperacion
    modify cantidad number(3) DEFAULT 1;

--8.. La marca y modelo del coche no pueden dejarse en blanco.

alter table Coches
    MODIFY (marca varchar2(20) NOT NULL);
alter table Coches
    MODIFY (modelo varchar2(20) NOT NULL);

--9.Los teléfonos empiezan por 6, 7, 8 o 9

alter table Clientes
    add CONSTRAINT ck_telefono CHECK(REGEXP_LIKE(telefono,'[6789]{1}[0-9]{8}'));

--10.El precio de un coche está entre 10000 y 60000.

alter table Coches
    add Constraint ck_precio CHECK(pvp<10000 AND pvp>60000);