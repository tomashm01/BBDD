set serveroutput on;
CREATE TABLE HOTEL (ID NUMBER(2) PRIMARY KEY, NHABS NUMBER(3) );

/* E insertamos los siguientes valores: */
INSERT INTO HOTEL VALUES (1, 10);
INSERT INTO HOTEL VALUES (2, 60);
INSERT INTO HOTEL VALUES (3, 200);
INSERT INTO HOTEL VALUES (99, NULL);

/* En esta tabla tenemos datos de hoteles, en concreto el nÃºmero de habitaciones de cada hotel.

Crea un procedimiento  TAMANOHOTEL que nos diga si el hotel es de tamaÃ±o: PequeÃ±o, Mediano o Grande, en función del número de
habitaciones.
Si el nÃºmero de habitaciones es menor que 50 se considera "PequeÃ±o", si el nÃºmero de habitaciones estÃ¡ comprendido
entre 50 y 70 es considerado "Mediano", y si el nÃºmero de habitaciones es superior a 70 es considerado "Grande".

Al procedimiento se le pasarÃ¡ un parÃ¡metro, que serÃ¡ el ID de un Hotel, y nos indicarÃ¡ mediante un mensaje, el tamaÃ±o del Hotel.
TAMANOHOTEL (ID NUMBER)*/
CREATE OR REPLACE PROCEDURE TAMANOHOTEL (IDH IN NUMBER) IS
    hoteles HOTEL%ROWTYPE;
BEGIN
    SELECT * INTO hoteles FROM HOTEL WHERE ID = IDH;
    IF hoteles.NHABS < 50 THEN
        DBMS_OUTPUT.PUT_LINE('Hotel ' || hoteles.ID || ' pequeÃ±o.');
    ELSIF hoteles.NHABS > 50 AND hoteles.NHABS < 70 THEN
        DBMS_OUTPUT.PUT_LINE('Hotel ' || hoteles.ID || ' mediano.');
    ELSIF hoteles.NHABS > 70 THEN
        DBMS_OUTPUT.PUT_LINE('Hotel ' || hoteles.ID || ' grande.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Datos nulos');
    END IF;
END;
/

BEGIN
    TAMANOHOTEL(1);
    TAMANOHOTEL(2);
    TAMANOHOTEL(3);
    TAMANOHOTEL(99);
END;
/


/* 2.  Añade las siguientes tablas al esquema anterior:  */
create table habitaciones (
 piso integer NOT NULL,
 habitacion varchar(2) NOT NULL,
 tipo varchar(10) DEFAULT 'Doble'
                  CONSTRAINT nn_tipo NOT NULL
                  CONSTRAINT ch_Tipo  CHECK (tipo IN ('Individual','Doble', 'Suite')),
 primary key(piso,habitacion));

create table reservas (
 planta integer,
 habitacion varchar(2),
 fechaentrada date DEFAULT SYSDATE,
 noches integer,
 primary key(planta, habitacion, fechaentrada),
 foreign key (piso, habitacion) references habitaciones
);

create table temporadas (
 nombre varchar(10) not null,
 mesInicio integer not null,
 diaInicio integer not null,
 mesFin integer not null,
 diaFin integer not null,
 primary key(nombre,mesInicio,diaInicio)
);

insert into temporadas values('Alta',6,1,8,30);
insert into temporadas values('Baja',1,1,5,31);
insert into temporadas values('Baja',1,9,12,31);

/*  Escribir un procedimiento sin parÃ¡metros creaHabitaciones para rellenar la tabla habitaciones con los datos del hotel. E
l hotel dispone de 12 plantas de habitaciones, numeradas de la 1 a la 12.  En cada planta de la 1 a la 11 hay 25 habitaciones:
20 dobles (numeradas de 1 a 20) y 5 sencillas (de la 21 a la 25).  En la planta 12 sÃ³lo tiene 8 suites numeradas de la 1 a la 8.

Notas:

- El procedimiento debe poder llamarse varias veces, por lo que conviene que borre las habitaciones al comienzo. */
CREATE OR REPLACE PROCEDURE creaHabitaciones IS
    habitacion HABITACIONES%ROWTYPE;
BEGIN
    DELETE HABITACIONES;
    for planta IN 1..11 LOOP
        for habs IN 1..20 LOOP
            INSERT INTO HABITACIONES VALUES(planta, habs, 'Doble');
        END LOOP;
        for habs IN 21..25 LOOP
            INSERT INTO HABITACIONES VALUES(planta, habs, 'Individual');
        END LOOP;
    END LOOP;
    for habs IN 1..8 LOOP
        INSERT INTO HABITACIONES VALUES(12, habs, 'Suite');
    END LOOP;
END;
/


execute     creaHabitaciones();
