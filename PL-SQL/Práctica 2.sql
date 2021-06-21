/*************************
1. Escribir un bloque que inserte los 100 primeros números enteros desde el 0 al 99
usando LOOP, WHILE y FOR
**************************/
create table numeros (
	num number(2) PRIMARY KEY
);

/* LOOP  */
declare
i number(3);
begin
-- 100 veces .. donde i vale 0 y alcanza su valor máximo con i valiendo 9
i:=0;
loop
    insert into numeros values (i);
i:=i+1;
exit when i>99;
end loop;
end;

/* WHILE */
declare
i number(3);
begin
-- 100 veces .. donde i vale 0 y alcanza su valor máximo con i valiendo 9
i:=0;
delete from numeros; -- para borrar los que metí anteriormente.
while i<100 loop
    insert into numeros values (i);
i:=i+1;
end loop;
end;

/* FOR  */
declare
i number(3);
begin
-- 100 veces .. donde i vale 0 y alcanza su valor máximo con i valiendo 9
i:=0;
delete from numeros; -- para borrar los que metí anteriormente.
for i in 0..99 loop
    insert into numeros values (i);
end loop;
end;

/*********************
2. EJERCICIO
Escribir un codigo que borre las filas de la tabla numeros e inserte los numeros pares menores que 20.
Mostrar las filas de la tabla una vez generadas.
De forma que la tabla numeros quedaria cargada con las filas:0,2,4,6,8....n
************************/

declare
    i number (2); 
BEGIN 
delete from numeros;
-- Variable contador que empiza por 1
i:=0;
-- Carga la tabla con numeros
loop
    dbms_output.put_line (i);
    insert into numeros values (i); 
    i:=i+2;
    exit when i>20;
end loop;
END;


/***********************
3. EJERCICIO 
Tabla Multiplicar  .
Crear un procedimiento que inserte en la tabla NUMEROS la tabla de multiplicar del numero que se pasa como parámetro al 
procedimiento llamado tabla_multiplicar 
*************************/
create or replace procedure tabla_multiplicar (p_num number) is
BEGIN
    dbms_output.put_line ('TABLA DE MULTIPLICAR DEL ' || p_num);
    for i in 1..10 loop
        dbms_output.put_line (p_num || ' x ' || i || ' = ' || i*p_num);
    end loop;
END;
/
call tabla_multiplicar(7);
/
call tabla_multiplicar(2);

/*****************************************************************
4. Codificar un procedimiento que reciba una cadena y la visualice al revés.
Nota: En el for, se puede usar REVERSE para hacer la cuenta atrás
Nota2: usar la función LENGTH y SUBSTR
******************************************************************/
create or replace procedure MostrarAlReves( p_cad VARCHAR2) is
	v_aux VARCHAR2(30):='';
begin
	for i in reverse 1..length(p_cad) loop
		v_aux:=v_aux||substr(p_cad,i,1);
	end loop;
	dbms_output.put_line(v_aux);
end  MostrarAlReves;
/
CALL MostrarAlReves('Hola');

/********************************o también
create or replace procedure MostrarAlReves( p_cad VARCHAR2)
is
	v_aux VARCHAR2(30):='';
begin
	for i in 1..length(p_cad) loop
		v_aux:=v_aux||substr(p_cad,-i,1);
	end loop;
	dbms_output.put_line(v_aux);
end  MostrarAlReves;
/
CALL MostrarAlReves('Hola');

/************************************************************************************************
5. Escribir un procedimiento que reciba una fecha (DATE) y escriba el año (EN NÚMERO) correspondiente a esa fecha.
****************************************************************************************************/
create or replace procedure MostrarAnyo(p_fecha DATE) is
	v_anyo	NUMBER;
begin
	v_anyo := to_number(to_char(p_fecha,'YYYY'));
	dbms_output.put_line('Año: '||v_anyo);
end MostrarAnyo;


/******************************************************************************************
6. Codificar un procedimiento que reciba una lista de 2 números (PARÁMETROS) y visualice su suma.
*******************************************************************************************/
CREATE OR REPLACE PROCEDURE MostrarSuma(p_num1 NUMBER, p_num2 NUMBER) IS
    v_suma NUMBER;
BEGIN
    v_suma:=p_num1+p_num2;
    dbms_output.put_line('Suma: ' || v_suma);
END MostrarSuma;

/****************************************************************************************
7. Implementar un procedimiento que reciba un importe y visualice el desglose del cambio 
en unidades monetarias de 0.01, 0.02, 0.05, 0.10, 0.20, 0.50, 1, 2, 5, 10, 20, 50, 100, 
200, 500€ en orden inverso al que aparecen aquí enumeradas.
*****************************************************************************************/
CREATE OR REPLACE PROCEDURE MostrarCambio(p_importe NUMBER)
IS
    v_cambio NUMBER:=p_importe;
    v_moneda NUMBER;
    v_cantidad NUMBER;
BEGIN
    dbms_output.put_line('Desglose de: ' || p_importe || '€.');
    WHILE v_cambio > 0 LOOP
        CASE
            WHEN v_cambio > 500 THEN v_moneda:=500;
            WHEN v_cambio > 200 AND v_cambio < 500 THEN v_moneda:=200;
            WHEN v_cambio > 100 AND v_cambio < 200 THEN v_moneda:=100;
            WHEN v_cambio > 50 AND v_cambio < 100 THEN v_moneda:=50;
            WHEN v_cambio > 20 AND v_cambio < 50 THEN v_moneda:=20;
            WHEN v_cambio > 10 AND v_cambio < 20 THEN v_moneda:=10;
            WHEN v_cambio > 5 AND v_cambio < 10 THEN v_moneda:=5;
            WHEN v_cambio > 2 AND v_cambio < 5 THEN v_moneda:=2;
            WHEN v_cambio > 1 AND v_cambio < 2 THEN v_moneda:=1;
            WHEN v_cambio > 0.5 AND v_cambio < 1 THEN v_moneda:=0.5;
            WHEN v_cambio > 0.2 AND v_cambio < 0.5 THEN v_moneda:=0.2;
            WHEN v_cambio > 0.1 AND v_cambio < 0.2 THEN v_moneda:=0.1;
            WHEN v_cambio > 0.05 AND v_cambio < 0.1 THEN v_moneda:=0.05;
            WHEN v_cambio > 0.02 AND v_cambio < 0.05 THEN v_moneda:=0.02;
            ELSE v_moneda:=0.01;
        END CASE;
        v_cantidad:=TRUNC(v_cambio/v_moneda);
        v_cambio:=MOD(v_cambio,v_moneda);
        dbms_output.put_line('Billetes/monedas de ' || v_moneda || '€: ' || v_cantidad);
    END LOOP;
END MostrarCambio;

/
CALL MostrarCambio(15.35);

/********************************************************************************
8. Realiza un procedimiento que reciba dos números 'nota' y 'edad' 
y un carácter 'sexo' y muestre el mensaje 'ACEPTADA' si la nota es 
mayor o igual a cinco, la edad es mayor o igual a dieciocho y el sexo es 'M'. 
En caso de que se cumpla lo mismo, pero el sexo sea 'V', debe imprimir 'POSIBLE'.
**********************************************************************************/
CREATE OR REPLACE PROCEDURE AptoNoApto(p_nota NUMBER, p_edad NUMBER, p_sexo CHAR)
IS
BEGIN
    IF p_nota >= 5 AND p_edad >= 18 THEN
        IF p_sexo = 'M' THEN
            dbms_output.put_line('ACEPTADA');
        ELSIF p_sexo = 'V' THEN
            dbms_output.put_line('POSIBLE');
        END IF;
    ELSE
        dbms_output.put_line('NO APTO');
    END IF;
END AptoNoApto;
/
/
call AptoNoApto (5, 23, 'V');

/********************************************************************
9. Procedimiento que recibe una letra e imprima si es vocal o consonante.
************************************************************************/
create or replace procedure MostrarVocaloConsonante (p_letra CHAR)
is
  v_resultado VARCHAR2(10):='Consonante';
begin
  if p_letra in ('A','E','I','O','U') then
    v_resultado := 'Vocal';
  end if;
  dbms_output.put_line(p_letra||' es una '||v_resultado);
end MostrarVocaloConsonante;

