

CREATE TABLE fabricante (
  codigo INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigoProd INT PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio number(5,2) NOT NULL,
  codigo_fabricante INT not null,
  FOREIGN KEY(codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

--ejercicio 1 
select producto.nombre as "Nombre producto",producto.precio,fabricante.nombre as "Nombre Fabricante"
from fabricante,producto;

--ejercicio 2
select producto.nombre as "Nombre producto",producto.precio,fabricante.nombre as "Nombre Fabricante"
from fabricante,producto
order by 3;

--ejercicio 3
select producto.codigoProd as "Codigo producto", producto.nombre as "Nombre producto",
fabricante.codigo as "Codigo fabricante",fabricante.nombre as "Nombre fabricante"
from fabricante cross join producto;

--ejercicio 4 NO SE HACERLO
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto
where producto.precio=(select min(precio) from producto);

--ejercicio 5 NO SE HACERLO
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante f,producto p
where producto.precio=(select max(precio) from producto);

--ejercicio 6
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto
where fabricante.nombre='Lenovo';
--ejercicio 7
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto
where fabricante.nombre='Crucial'
and producto.precio>200;

--ejercicio 8
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto
where fabricante.nombre='Asus'
or fabricante.nombre='Hewlett-Packard'
or fabricante.nombre='Seagate';

--ejercicio 9
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto 
where fabricante.nombre in('Asus','Hewlett-Packard','Seagate');

--ejercicio 10 
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto 
where substr(reverse(fabricante.nombre),1,1) = 'e';

--ejercicio 11
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto 
where instr(fabricante.nombre,'w')!=0;

--ejercicio 12
select producto.nombre as "Nombre producto", producto.precio, fabricante.nombre as "Nombre fabricante"
from fabricante,producto 
where producto.precio>=180
order by 2 DESC,3 ASC;

--ejercicio 13
select fabricante.codigo, fabricante.nombre
from fabricante inner join producto
on producto.codigoProd = fabricante.codigo;


