CREATE TABLE puestos (
  cod_puesto NUMBER(2) CONSTRAINT puesto_pk PRIMARY KEY ,
  titulo_puesto VARCHAR2(25) CONSTRAINT puesto_uk1 UNIQUE
                             CONSTRAINT puesto_nn1 NOT NULL ,
  salario_min  NUMBER(11,2),
  salario_max NUMBER(11,2)
);

CREATE TABLE localizaciones (
  cod_localizacion NUMBER(3) CONSTRAINT localizaciones_pk PRIMARY KEY ,
  localidad VARCHAR2(50) CONSTRAINT localizaciones_nn1 NOT NULL ,
  direccion VARCHAR2(50),
  cp CHAR(5),
  provincia VARCHAR2(25)
);

CREATE TABLE departamentos (
  cod_dep NUMBER(2) CONSTRAINT departamentos_pk PRIMARY KEY ,
  nombre_dep VARCHAR2(25) CONSTRAINT  departamentos_uk1 UNIQUE
                          CONSTRAINT  departamentos_nn1 NOT NULL ,
  cod_resp NUMBER(4),
  cod_loc NUMBER(3) CONSTRAINT departamentos_fk2 REFERENCES localizaciones(cod_localizacion)
);

CREATE TABLE historial (
  cod_puesto NUMBER(2),
  cod_emp NUMBER(4),
  fecha_inicio DATE CONSTRAINT historial_nn1 NOT NULL,
  fecha_fin DATE,
  cod_dep NUMBER(3) CONSTRAINT historial_fk3 REFERENCES departamentos(cod_dep),
   CONSTRAINT historial_pk PRIMARY KEY (cod_puesto, cod_emp)
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

ALTER TABLE empleados ADD CONSTRAINT empleados_fk2 FOREIGN KEY(cod_dep) REFERENCES departamentos(cod_dep);
ALTER TABLE historial ADD CONSTRAINT historial_fk1 FOREIGN KEY(cod_puesto) REFERENCES puestos(cod_puesto);
ALTER TABLE historial ADD CONSTRAINT historial_fk2 FOREIGN KEY(cod_emp) REFERENCES empleados(cod_emp);
ALTER TABLE departamentos ADD CONSTRAINT departamentos_fk1 FOREIGN KEY(cod_resp) REFERENCES empleados(cod_emp);


