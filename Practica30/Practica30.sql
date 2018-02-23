CREATE TABLE puestos (
  cod_puesto NUMBER(2) CONSTRAINT puesto_pk PRIMARY KEY ,
  titulo_puesto VARCHAR2(25) CONSTRAINT puesto_uk1 UNIQUE
                             CONSTRAINT puesto_nn1 NOT NULL ,
  salario_min  NUMBER(11,2),
  salario_max NUMBER(11,2),
  CONSTRAINT puestos_ck1 CHECK (salario_max>salario_min)
);

CREATE TABLE localizaciones (
  cod_localizacion NUMBER(3) CONSTRAINT localizaciones_pk PRIMARY KEY ,
  localidad VARCHAR2(50) CONSTRAINT localizaciones_nn1 NOT NULL ,
  direccion VARCHAR2(50),
  cp CHAR(5)CONSTRAINT localizaciones_ck1 CHECK (cp<51000),
  provincia VARCHAR2(25)
);

CREATE TABLE departamentos (
  cod_dep NUMBER(2) CONSTRAINT departamentos_pk PRIMARY KEY ,
  nombre_dep VARCHAR2(25) CONSTRAINT  departamentos_uk1 UNIQUE
                          CONSTRAINT  departamentos_nn1 NOT NULL ,
  cod_resp NUMBER(4),
  cod_loc NUMBER(3) CONSTRAINT departamentos_fk2 REFERENCES localizaciones(cod_localizacion) ON DELETE CASCADE
);

CREATE TABLE historial (
  cod_puesto NUMBER(2),
  cod_emp NUMBER(4),
  fecha_inicio DATE CONSTRAINT historial_nn1 NOT NULL
                    CONSTRAINT historial_ck2 CHECK (fecha_inicio>to_date('1/1/1970','dd/mm/yyyy')) ,
  fecha_fin DATE,
  cod_dep NUMBER(3) CONSTRAINT historial_fk3 REFERENCES departamentos(cod_dep) ON DELETE CASCADE ,
   CONSTRAINT historial_pk PRIMARY KEY (cod_puesto, cod_emp),
   CONSTRAINT historial_ck1 CHECK (fecha_fin>fecha_inicio)
);

CREATE TABLE empleados (
  cod_emp NUMBER(4) CONSTRAINT empleados_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT empleados_nn1 NOT NULL ,
  apellido1 VARCHAR2(50) CONSTRAINT empleados_nn2 NOT NULL,
  apellido2 VARCHAR2(50) CONSTRAINT empleados_nn3 NOT NULL,
  telefono CHAR(9),
  direccion VARCHAR2(50),
  email VARCHAR2(50) CONSTRAINT empleados_uk1 UNIQUE ,
  cod_jefe NUMBER(4) CONSTRAINT empleados_fk1 REFERENCES empleados(cod_emp),
  cod_dep NUMBER(3)
);

ALTER TABLE localizaciones MODIFY provincia CONSTRAINT localizaciones_nn2 NOT NULL ;
ALTER TABLE empleados ADD CONSTRAINT empleados_fk2 FOREIGN KEY(cod_dep) REFERENCES departamentos(cod_dep) ON DELETE CASCADE ;
ALTER TABLE historial ADD CONSTRAINT historial_fk1 FOREIGN KEY(cod_puesto) REFERENCES puestos(cod_puesto) ON DELETE CASCADE ;
ALTER TABLE historial ADD CONSTRAINT historial_fk2 FOREIGN KEY(cod_emp) REFERENCES empleados(cod_emp) ON DELETE CASCADE;
ALTER TABLE departamentos ADD CONSTRAINT departamentos_fk1 FOREIGN KEY(cod_resp) REFERENCES empleados(cod_emp) ON DELETE CASCADE ;

ALTER TABLE localizaciones ADD (principal NUMBER(1) DEFAULT(0) CONSTRAINT localizaciones_ck2 CHECK(principal=0 or principal=1));

ALTER TABLE empleados ADD CONSTRAINT empleados_uk2 UNIQUE (nombre,apellido1);
ALTER TABLE localizaciones RENAME COLUMN cp TO cod_postal;
ALTER TABLE empleados MODIFY email CONSTRAINT empleados_nn4 NOT NULL ;
ALTER TABLE localizaciones DROP CONSTRAINT localizaciones_nn2;

ALTER TABLE localizaciones DROP (cod_localizacion) CASCADE CONSTRAINTS ;
ALTER TABLE localizaciones ADD cod_localizacion CHAR(5) PRIMARY KEY ;
ALTER TABLE departamentos DROP (cod_loc);
ALTER TABLE departamentos ADD cod_loc CHAR(5) REFERENCES localizaciones(cod_localizacion);
ALTER TABLE empleados DISABLE CONSTRAINT empleados_nn4;
ALTER TABLE historial ADD salario NUMBER(11,2);


INSERT INTO puestos (cod_puesto, titulo_puesto, salario_min, salario_max) VALUES (1, 'Técnicos de mantenimiento',800,2100);
INSERT INTO puestos (cod_puesto, titulo_puesto, salario_min, salario_max) VALUES (2, 'Auxiliar de mantenimiento',700,1400);
INSERT INTO puestos (cod_puesto, titulo_puesto, salario_min, salario_max) VALUES (3, 'Director de mantenimiento',1400,3200);
INSERT INTO puestos (cod_puesto, titulo_puesto, salario_min, salario_max) VALUES (4, 'Jefe de producción',1200,2400);
INSERT INTO puestos (cod_puesto, titulo_puesto, salario_min, salario_max) VALUES (5, 'Director de marketing',1600,2800);

INSERT INTO departamentos (cod_dep, nombre_dep, cod_resp, cod_loc) VALUES (1,'Mantenimiento',null,null);
INSERT INTO departamentos (cod_dep, nombre_dep, cod_resp, cod_loc) VALUES (2,'Marketing',null,null);
INSERT INTO departamentos (cod_dep, nombre_dep, cod_resp, cod_loc) VALUES (3,'Producción',null,null);



INSERT INTO empleados(cod_emp, nombre, apellido1, apellido2, telefono, direccion, email, cod_jefe, cod_dep) VALUES (3,'María','Crespo','Rodríguez','979105641','C/ Marqués1 1','maria@empresa',NULL ,1);
INSERT INTO empleados(cod_emp, nombre, apellido1, apellido2, telefono, direccion, email, cod_jefe, cod_dep) VALUES (1,'Alfonso','Hernández','Crespo','979101010','C/ Los tilos 1',NULL,3,1);
INSERT INTO empleados(cod_emp, nombre, apellido1, apellido2, telefono, direccion, email, cod_jefe, cod_dep) VALUES (2,'Herminia','Salou','Bernet',NULL,'C/ Mayor 1','hsb@empresa.net',1,1);
INSERT INTO empleados(cod_emp, nombre, apellido1, apellido2, telefono, direccion, email, cod_jefe, cod_dep) VALUES (4,'Luisa','Fernández','Calvo','657123456','C/ Marques 1','luisa@empresa.net',NULL,2);
INSERT INTO empleados(cod_emp, nombre, apellido1, apellido2, telefono, direccion, email, cod_jefe, cod_dep) VALUES (5,'Avelino','González','Díaz','602666666','C/ Tinteros 17','eve@empresa.net',NULL,3);

INSERT INTO historial (cod_puesto, cod_emp, fecha_inicio, fecha_fin, cod_dep,salario) VALUES (1,1,to_date('02/05/2008','dd/mm/yyyy'),to_date('03/01/2009','dd/mm/yyyy'),1,1300);
INSERT INTO historial (cod_puesto, cod_emp, fecha_inicio, fecha_fin, cod_dep,salario) VALUES (3,1,to_date('04/01/2009','dd/mm/yyyy'),NULL,1,1800);





