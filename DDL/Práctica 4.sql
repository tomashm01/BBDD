CREATE TABLE pub(
    cod_pub varchar2(10) NOT NULL,
    nombre varchar2(20) NOT NULL,
    licencia_fiscal varchar2(20) NOT NULL,
    domicilio varchar2(20),
    fecha_apertura date NOT NULL,
    horario varchar2(10) NOT NULL,
    cod_localidad number(5) NOT NULL,

    CONSTRAINT ck_horario CHECK(horario IN('HOR1','HOR2','HOR3')),
    CONSTRAINT pk_pub PRIMARY KEY(cod_pub)
);

CREATE TABLE titular(
    dni_titular varchar2(9) NOT NULL,
    nombre varchar2(20) NOT NULL,
    domicilio varchar2(20),
    cod_pub varchar2(10) NOT NULL,

    CONSTRAINT pk_titular PRIMARY KEY(dni_titular)
);

CREATE TABLE empleado(
    dni_empleado varchar2(9) NOT NULL, 
    nombre varchar2(20) NOT NULL,
    domicilio varchar2(20),

    CONSTRAINT pk_empleado PRIMARY KEY(dni_empleado)
);

CREATE TABLE existencias(
    cod_articulo varchar2(10) NOT NULL, 
    nombre varchar2(20) NOT NULL,
    cantidad number(3) NOT NULL,
    precio number(3) NOT NULL,
    cod_pub varchar2(10) NOT NULL,

    CONSTRAINT ck_precio CHECK(precio>0),
    CONSTRAINT pk_existencias PRIMARY KEY(cod_articulo)
);

CREATE TABLE localidad(
    cod_localidad number(5) NOT NULL,
    nombre varchar2(20) NOT NULL,

    CONSTRAINT pk_localidad PRIMARY KEY(cod_localidad)
);

CREATE TABLE pub_empleado(
    cod_pub varchar2(10) NOT NULL,
    dni_empleado varchar2(9) NOT NULL,
    funcion varchar2(20) NOT NULL,

    CONSTRAINT ck_funcion CHECK(funcion IN('CAMRERO','SEGURIDAD','LIMPIEZA')),
    CONSTRAINT pk_pub_empleado PRIMARY KEY(cod_pub,dni_empleado,funcion)
);