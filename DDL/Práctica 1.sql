CREATE TABLE PROFESOR(
    nombre varchar2(45) unique,
    apellido1 varchar2(45),
    apellido2 varchar2(45),
    dni_profesor varchar2(9),
    direccion varchar2(45),
    titulacion varchar2(45),
    cuota_h int NOT NULL,
    
    CONSTRAINT pk_dni PRIMARY KEY(dni_profesor)
);

CREATE TABLE CURSO(
    nombre varchar2(45) unique,
    codigo int,
    profesor_dni varchar2(9),
    max_alumnos int,
    fecha_ini DATE,
    fecha_fin DATE,
    num_horas int,
    
    CONSTRAINT pk_codigo PRIMARY KEY(codigo),
    CONSTRAINT fk1 FOREIGN KEY (profesor_dni) REFERENCES PROFESOR(dni_profesor),
    CONSTRAINT ck_fecha check(fecha_ini<fecha_fin)
);


CREATE TABLE ALUMNOS(
    nombre varchar2(45) ,
    apellido1 varchar2(45),
    apellido2 varchar2(45),
    dni varchar2(9),
    direccion varchar2(45),
    sexo varchar2(1),
    fecha DATE,
    curso_codigo int,

    
    CONSTRAINT ck_sexo1 CHECK(sexo='H' OR sexo='M'),
    CONSTRAINT pk_alumnos primary key(dni),
    CONSTRAINT ck_sexo2 check(sexo=upper(sexo)),
    CONSTRAINT fk2 FOREIGN KEY(curso_codigo) REFERENCES CURSO(codigo)
);


insert into PROFESOR values('Juan','Arch','López','32432455V','Puerta Negra, 4','Ing. Informática',1500);
insert into PROFESOR values('María','Oliva','Rubio','43215643F','Juan Alfonso 32','Lda. Fil. Inglesa',1400);

insert into CURSO values('Inglés básico',1,'43215643F',15,'01-11-2012','22-12-2012',120);
insert into CURSO values('Administración Linux',2,'32432455V',20,'01-09-2012','12-10-2012',180);

insert into ALUMNOS values('Lucas','Manilva','López','12345678P',' Alhamar 3','H','01-NOV-1979',1);
insert into ALUMNOS values('Antonia','López','Alcantara','2567567A','Maniquí 21','M',NULL, 2);
insert into ALUMNOS values('Manuel','Alcántara','Pedrós','31236894S','Julian 22','M',NULL,1);
insert into ALUMNOS values('José','Pérez','Caballar','48967656K','Jarcha 5','H','3-FEB-1977',1);
insert into ALUMNOS values('Sergio','Navas','Retal','12352368P',NULL, 'H',NULL ,NULL);


--ejercicio 4 y 5
alter table PROFESOR 
   add edad int 
   CONSTRAINT ck_edad CHECK((edad>=18) AND (edad<=65));

alter table CURSO
   add CONSTRAINT ck_curso CHECK(max_alumnos>=10)
   add CONSTRAINT ck_horas CHECK(num_horas>100);
--ejercicio 6
alter table ALUMNOS
    drop CONSTRAINT ck_sexo1;
--ejercicio 7 NO SE COMO SE HACE 
alter table PROFESOR
    modify (cuotas_h int NULL);
--ejercicio 8
alter table CURSO
    modify(fecha_ini DATE NOT NULL);
--ejercicio 9 NO SE COMO SE HACE
alter table PROFESOR
    modify dni_profesor auto_increment;
alter table PROFESOR
    drop primary key;
alter table PROFESOR
    add CONSTRAINT pk_profe primary key(nombre, apellido1,apellido2);
--ejercicio 10
update ALUMNOS
    set fecha='23-12-1976'
    where nombre='Antonia' AND apellido1='López';
--ejercicio 11 NO SE COMO SE HACE
update ALUMNOS 
    set curso_codigo=5
    where nombre='Antonia' AND apellido1='López';
--ejercicio 12
delete from ALUMNOS
    where nombre='Laura' AND apellido1='Jiménez';