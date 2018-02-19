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





