/******************
Ejercicio 1: 
Crear un bloque en el que se pida el nombre y la edad de usuario, se guarde en variables
y posteriormente se muestre por pantalla su contenido
*******************/

DECLARE
    v_nombre varchar2(20);
    v_edad number(2);
BEGIN
-- Leer por teclado (entrada estandar) --
    v_nombre:='Juan';
    v_edad:='25';

-- Mostrar por pantalla (salida estandar) --
    dbms_output.put_line ('Tu nombre es: ' || v_nombre);
    dbms_output.put_line ('Tu edad es: ' || v_edad);
END; 

DECLARE
    v_nombre varchar2(20);
    v_edad number(2);
BEGIN
-- Leer por teclado (entrada estandar) --
    v_nombre:='&nombre';   --'Juan';
    v_edad:=&edad;         --'25';

-- Mostrar por pantalla (salida estandar) --
    dbms_output.put_line ('Tu nombre es: ' || v_nombre);
    dbms_output.put_line ('Tu edad es: ' || v_edad);
END; 

/************************
Ejercicio 2: 
Crea una tabla "Numeros" con un atributo "valor" de tipo NUMBER.
Cree un bloque que inserte numeros del 1 al 50. 
Compruebe los daots mostrados en la tabla (mostrarlos).
*************************/
-- drop table numeros;
declare
    i integer; 
BEGIN 
delete from numeros;
i:=1;
loop
    dbms_output.put_line (i);
    insert into numeros values (i); 
    exit when i>49;
    i:=i+1;
end loop;
END;


/*************************
Ejercicio3.
Borrar el contenido de la tabla NUMEROS utilizando la sentencia DELETE.
Cree un bloque que inserte 8 numeros en la tabla con valores del 1 al 10 excepto el 4 y el 5.
Comprobar los datos de nuevo.
**************************/

DECLARE
    i INTEGER; 
BEGIN 
DELETE FROM numeros;
-- Variable contador que empiza por 1
i:=1;
-- Carga la tabla con numeros
LOOP
    IF (i!=4 AND i!=5 ) THEN
        dbms_output.put_line (i);
        INSERT INTO numeros VALUES (i); 
    END IF;
    i:=i+1;
    EXIT WHEN i>10;
END LOOP;
END;

/**********************************
Ejercicio 4:  Tabla ART�CULOS
********************************/

CREATE TABLE tabla_articulos (
    codigo varchar (5) primary key,
    nombre varchar (20),
    precio number,
    IVA number
);
    
INSERT INTO tabla_articulos VALUES ('A001','Alberto','20','12');

/***********  
Apartado A.
Construye un bloque que compruebe si el precio del art�culo cuyo c�digo es
'A001' es mayor que 10�, y, en caso afirmativo, imprima el nombre y el precio.
***********/
DECLARE 
    v_nombre varchar(20) ;
    v_precio number;
BEGIN 
    SELECT nombre, precio INTO v_nombre, v_precio FROM tabla_articulos WHERE codigo='A001';
    IF ( v_precio > 10) THEN 
        dbms_output.put_line ('El precio del producto ' || v_nombre || ' con precio: ' || v_precio || ' es mayor que 10.');
    ELSE 
        dbms_output.put_line ('EL precio del producto es menor de 10');
    END IF;    
END;
