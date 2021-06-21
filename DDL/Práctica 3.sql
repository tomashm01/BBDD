CREATE TABLE Equipos(
    codigo number(5),
    nombre varchar2(30),
    estadio varchar2(20),
    aforo number(7) DEFAULT 0,
    ciudad varchar2(15),
    anio_fundacion date,

    CONSTRAINT pk_equipo PRIMARY KEY (codigo)
);

CREATE TABLE  Presidentes(
    dni varchar2(9),
    nombre varchar2(30),
    apellidos varchar2(50),
    fecha_eleccion date,
    fecha_nacimiento date,
    codigo_equipo number(5),

    CONSTRAINT pk_presidente PRIMARY KEY (dni),
    CONSTRAINT fk_presidente FOREIGN KEY (codigo_equipo) REFERENCES Equipos(codigo)
);

CREATE TABLE Partidos(
    codigo number(5),
    fecha date NOT NULL,
    codigo_visitante number(5),
    codigo_local number(5),
    minutos number(3),

    CONSTRAINT ck_minuto CHECK(minutos<=100 AND minutos>0),
    CONSTRAINT pk_partido PRIMARY KEY (codigo),
    CONSTRAINT fk_codigo_local FOREIGN KEY (codigo_visitante) REFERENCES Equipos(codigo),
    CONSTRAINT fk_codigo_visitante FOREIGN KEY (codigo_local) REFERENCES Equipos(codigo),
    CONSTRAINT ck_horario CHECK (fecha!='25-DEC-2021' AND fecha!='01-JAN-2021' AND(fecha NOT BETWEEN '21-JUN-2021' AND '21-SEP-2021'))
);

CREATE TABLE Jugadores(
    codigo number(5),
    nombre varchar2(30),
    fecha_nacimiento date,
    posicion varchar2(20),
    codigo_equipo number(5),

    CONSTRAINT pk_jugador PRIMARY KEY (codigo),
    CONSTRAINT fk_jugadores FOREIGN KEY (codigo_equipo) REFERENCES Equipos(codigo),
    CONSTRAINT ck_posicion CHECK(posicion IN ('Portero','Defensa','Centrocampista','Delantero')),
    CONSTRAINT ck_nacimiento CHECK(fecha_nacimiento<'01-MAR-1999')
);

CREATE TABLE Goles(
    codigo_partido number(5),
    codigo_jugador number(5),
    minuto number(3),
    descripcion varchar2(30),

    CONSTRAINT pk_goles PRIMARY KEY (minuto,codigo_jugador,codigo_partido),
    CONSTRAINT fk_goles1 FOREIGN KEY(codigo_partido) REFERENCES Partidos(codigo),
    CONSTRAINT fk_goles2 FOREIGN KEY(codigo_jugador) REFERENCES Jugadores(codigo)
);
--Ejercicio 8
alter table Equipos
    add NumTitulos number(2);
--Ejercicio 9
alter table Equipos
    drop column aforo;
--Ejercicio 10
alter table Equipos
    add CONSTRAINT ck_fundacion CHECK(anio_fundacion>'1888');
--Ejercicio 11
ALTER TABLE Partidos
    ADD horaComienzo TIMESTAMP NOT NULL;
ALTER TABLE Partidos
    ADD CONSTRAINT ck_hora CHECK (fecha BETWEEN '10:00' AND '22:30');
--Insertar un equipo con los valores: 1 Betis Benito Villamarin Sevilla 1989 17:00 y 2 Cordoba Nuevo Arcangel 

insert into Equipos values(1,'Betis','Benito Villamarin','Sevilla',1989,17:00);
insert into Equipos(codigo,nombre,estadio) values(2,'Cordoba','Nuevo Arcangel');

--Actualizar el equipo y establecer que el num de titulos va a ser 4 para el equipo de codigo 2

update Equipos 
    set numTitulos=4
    where codigo=2;

--Actualizar tabla equipos y asignar cordoba al equipo de codigo 2

update Equipos
    set ciudad='Cordoba'
    where codigo=2;

--Borrar de tabla quien tenga codigo 1

delete from Equipos
 where codigo=1;