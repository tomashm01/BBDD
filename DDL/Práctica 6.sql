CREATE TABLE Alumnos(
    dni varchar2(10),
    nombre varchar2(20) NOT NULL,
    direccion varchar2(20),
    telefono varchar2(10),

    CONSTRAINT pk_alumnos PRIMARY KEY(dni),
    CONSTRAINT ck_dni CHECK(REGEXP_LIKE(dni,'[0-9]{3}-[A-Z]{1}')),
    CONSTRAINT ck_telefono CHECK(REGEXP_LIKE(telefono,'95[0-9]{8}'))
);

CREATE TABLE Empresas(
    cif varchar2(10),
    nombre varchar2(20) UNIQUE,
    direccion varchar2(20) NOT NULL,
    reponsable_legal varchar2(10),
    sector varchar2(15),

    CONSTRAINT pk_empresas PRIMARY KEY(cif)
);

CREATE TABLE Practicas(
    dni_alumno varchar2(10),
    nif_empresa varchar2(10),
    fecha date,
    num_horas number(4) DEFAULT 0,

    CONSTRAINT pk_practicas PRIMARY KEY(dni_alumno,nif_empresa),
    CONSTRAINT fk_dni FOREIGN KEY (dni_alumno) REFERENCES Alumnos(dni),
    CONSTRAINT fk_nif FOREIGN KEY(nif_empresa) REFERENCES Empresas(cif)
);  

--CIF Empresa: Empieza y termina con una letra mayúscula
alter table Empresas
    add CONSTRAINT ck_cif CHECK(REGEXP_LIKE(cif,'[A-Z]{1}.{8}[A-Z]{1}'));
--FechaInicio: En Abril o Mayo.
alter table Practicas 
    add CONSTRAINT ck_fecha CHECK(fecha IN('Abril','Mayo'));
--Sector: Es uno de los siguientes: ‘Informatica’, ‘I+D’ o ‘Electrónica’
alter table Empresas
    add CONSTRAINT ck_sector CHECK(sector IN('Informatica','I+D','Electrónica'));
-- Num Horas: Es múltiplo de 6.
alter table Practicas
    add CONSTRAINT ck_num_horas CHECK ((num_horas*6)%3!=0);