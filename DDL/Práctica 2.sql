/*
Nombre:Tomás Hidalgo
practica2.sql
*/
CREATE TABLE TIENDAS(
    nif varchar2(10),
    nombre varchar2(20),
    direccion varchar2(20),
    poblacion varchar2(20),
    provincia varchar2(20),
    codpostal number(5)
);
alter table TIENDAS
    add CONSTRAINT pk1 primary key(nif);
alter table TIENDAS
     add CONSTRAINT ck_upper1 CHECK(provincia=upper(provincia));
alter table TIENDAS
    MODIFY (nombre varchar2(30) not null);

CREATE TABLE FABRICANTES(
    cod_fabricante number(3),
    nombre varchar2(15),
    pais varchar2(15),

    CONSTRAINT pk2 primary key(cod_fabricante),
    CONSTRAINT ck_upper2 CHECK((pais=upper(pais)) AND (nombre=upper(nombre)))
);

CREATE TABLE ARTICULOS(
    articulo varchar2(20),
    cod_fabricante number(3),
    peso number(3),
    categoria varchar2(10),
    precio_venta number(6,2),
    precio_costo number(6,2),
    existencias number(5),

    CONSTRAINT pk3 primary key(articulo,cod_fabricante,peso,categoria),
    CONSTRAINT fk1 FOREIGN KEY(cod_fabricante) REFERENCES FABRICANTES(cod_fabricante),
    CONSTRAINT ck_mayorCero CHECK((precio_venta>0) AND (precio_costo>0) AND (peso>0)),
    CONSTRAINT ck_categoria1 CHECK ((categoria='Primera')OR(categoria='Segunda') OR (categoria='Tercera'))
);

CREATE TABLE VENTAS(
    nif varchar2(10),
    articulo varchar2(20),
    cod_fabricante number(3),
    peso number(3),
    categoria varchar2(10),
    fecha_venta date,
    unidades_vendidas number(4),

    CONSTRAINT pk4 primary key(fecha_venta),
    CONSTRAINT fk2 FOREIGN KEY(peso,articulo,cod_fabricante,categoria) REFERENCES ARTICULOS (peso,articulo,cod_fabricante,categoria),
    CONSTRAINT ck_unidades1 CHECK(unidades_vendidas>0),
    CONSTRAINT ck_categoria2 CHECK ((categoria='Primera')OR(categoria='Segunda') OR (categoria='Tercera'))
);

CREATE TABLE PEDIDOS(
    nif varchar2(10),
    articulo varchar2(20),
    cod_fabricante number(3),
    peso number(3),
    categoria varchar2(10),
    fecha_pedido date,
    unidades_pedidas number(4),
    existencias number(5),

    CONSTRAINT pk5 primary key(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
    CONSTRAINT fk3 FOREIGN KEY(peso,articulo,cod_fabricante,categoria) REFERENCES ARTICULOS (peso,articulo,cod_fabricante,categoria),
    CONSTRAINT ck_unidades2 CHECK(unidades_pedidas>0),
    CONSTRAINT ck_categoria3 CHECK ((categoria='Primera')OR(categoria='Segunda') OR (categoria='Tercera'))
);
