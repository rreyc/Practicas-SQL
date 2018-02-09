CREATE TABLE precios (
  fecha_inicio DATE ,
  fecha_fin DATE CONSTRAINT ,
  cod_art CHAR(7) CONSTRAINT precios_fk1 REFERENCES articulos(cod_art) ON DELETE CASCADE ,
  precio NUMBER(7,2) CONSTRAINT precios_ck(precio>0),
  CONSTRAINT precios_pk PRIMARY KEY (fecha_inicio,cod_art)
);


CREATE TABLE articulos (
  cod_art CHAR(7) CONSTRAINT articulos_pk PRIMARY KEY ,
  nombre VARCHAR2(40) CONSTRAINT articulos_nn1 NOT NULL ,
  marca VARCHAR2(20) CONSTRAINT articulos_nn2 NOT NULL ,
  modelo VARCHAR2(15) CONSTRAINT articulos_nn3 NOT NULL ,
);

CREATE TABLE secciones (
  id_sec NUMBER(3) CONSTRAINT secciones_pk PRIMARY KEY ,
  id_supersec NUMBER(3) CONSTRAINT secciones_fk1 REFERENCES secciones(id_sec) ,
  nombre VARCHAR2(40) CONSTRAINT secciones_uk1 UNIQUE
                      CONSTRAINT secciones_nn1 NOT NULL
);

CREATE TABLE pertenecer (
  cod_art CHAR(7) CONSTRAINT pertenecer_fk1 REFERENCES articulos(cod_art) ,
  id_sec NUMBER(3) CONSTRAINT pertenecer_fk2 REFERENCES secciones(id_sec),
  CONSTRAINT pertenecer_pk PRIMARY KEY (cod_art,id_sec)
);