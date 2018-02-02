CREATE TABLE empresas (
    cif CHAR(9) CONSTRAINT empresas_pk PRIMARY KEY,
    nombre VARCHAR2(25) CONSTRAINT empresas_nn1 NOT NULL
                        CONSTRAINT empresas_uk1 UNIQUE,
    telefono CHAR(9),
    direccion VARCHAR2(50)
);

CREATE TABLE alumnos (
    dni CHAR(9) CONSTRAINT alumnos_pk PRIMARY KEY,
    nombre VARCHAR2(50) CONSTRAINT alumnos_nn1 NOT NULL,
    apellido1 VARCHAR2(50) CONSTRAINT alumnos_nn2 NOT NULL,
    apellido2 VARCHAR2(50) CONSTRAINT alumnos_nn3 NOT NULL,
    direccion VARCHAR2(50),
    telefono CHAR(9),
    edad NUMBER(2),
    cif CHAR(9) CONSTRAINT alumnos_fk1 REFERENCES empresas(cif)
);


CREATE TABLE profesores (
    dni CHAR(9) CONSTRAINT profesores PRIMARY KEY ,
    nombre VARCHAR2(50) CONSTRAINT profesores_nn1 NOT NULL ,
    apellido1 VARCHAR2(50) CONSTRAINT profesores_nn2 NOT NULL ,
    apellido2 VARCHAR2(50) CONSTRAINT profesores_nn3 NOT NULL ,
    direccion VARCHAR2(50),
    telefono CHAR(9)
    );


CREATE TABLE tipos_curso (
    cod_curso CHAR(8) CONSTRAINT tipos_curso_pk PRIMARY KEY ,
    titulo VARCHAR2(50) CONSTRAINT tipos_curso_uk1 UNIQUE ,
    duracion NUMBER(3),
    temario CLOB
);

CREATE TABLE cursos (
    n_curso NUMBER(3) CONSTRAINT cursos_pk PRIMARY KEY ,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    cod_curso CHAR(8) CONSTRAINT cursos_fk1 REFERENCES tipos_curso(cod_curso),
    dni_profesor CHAR(9) CONSTRAINT dni_pro_fk2 REFERENCES profesores(dni)
);

CREATE TABLE asistir (
    dni CHAR(9) CONSTRAINT asistir_fk1 REFERENCES alumnos(dni),
    n_curso NUMBER(3) CONSTRAINT  asistir_fk2 REFERENCES cursos(n_curso),
    nota NUMBER(4,2),
    CONSTRAINT asistir_pk PRIMARY KEY (dni,n_curso)
);



