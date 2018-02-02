CREATE TABLE tipos_pieza (
  tipo CHAR(2) CONSTRAINT tipos_pieza_pk PRIMARY KEY ,
  descripcion VARCHAR2(25) CONSTRAINT tipos_piezas_nn1 NOT NULL
);

CREATE TABLE empresas (
  cif CHAR(9) CONSTRAINT empresas_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT empresas_nn1 NOT NULL
                      CONSTRAINT empresas_uk1 UNIQUE,
  telefono CHAR(9),
  direccion VARCHAR2(50),
  localidad VARCHAR2(50),
  provincia VARCHAR2(50)
);

CREATE TABLE pedidos (
  n_pedido NUMBER(4) CONSTRAINT pedidos_pk PRIMARY KEY ,
  cif CHAR(9) CONSTRAINT pedidos_nn1 NOT NULL
              CONSTRAINT pedidos_fk1 REFERENCES empresas(cif),
  fecha DATE  CONSTRAINT pedidos_nn2 NOT NULL
);

CREATE TABLE almacenes (
  n_almacen NUMBER(2) CONSTRAINT almacenes_pk PRIMARY KEY ,
  descripcion VARCHAR2(1000) CONSTRAINT almacenes_nn1 NOT NULL ,
  direccion VARCHAR2(100)
);

CREATE TABLE piezas (
  tipo CHAR(2) CONSTRAINT piezas_fk1 REFERENCES tipos_pieza(tipo),
  modelo NUMBER(2),
  precio_venta NUMBER(11,4) CONSTRAINT piezas_nn1 NOT NULL ,
  CONSTRAINT piezas_pk PRIMARY KEY (tipo,modelo)
);

CREATE TABLE existencias (
  tipo CHAR(2),
  modelo NUMBER(2),
  n_almacen NUMBER(2) CONSTRAINT existencias_fk2 REFERENCES almacenes(n_almacen),
  cantidad NUMBER(9)  CONSTRAINT existencias_nn1 NOT NULL
                      CONSTRAINT existencias_ch CHECK (cantidad>0),
  CONSTRAINT existencias_fk1 FOREIGN KEY (tipo,modelo) REFERENCES piezas(tipo,modelo),
  CONSTRAINT existencias_pk PRIMARY KEY (tipo,modelo,n_almacen)
);

CREATE TABLE suministros (
  tipo CHAR(2),
  modelo NUMBER(2),
  cif CHAR(9) CONSTRAINT suministros_fk2 REFERENCES empresas(cif),
  precio_compra NUMBER(11,4) CONSTRAINT suministros_nn1 NOT NULL
                             CONSTRAINT suministros_ck CHECK (precio_compra>0),
  CONSTRAINT suministros_pk PRIMARY KEY (tipo,modelo,cif),
  CONSTRAINT suministros_fk1 FOREIGN KEY(tipo,modelo) REFERENCES piezas(tipo,modelo)
);

CREATE TABLE lineas_pedido (
  tipo CHAR(2) CONSTRAINT linas_pedido_nn1 NOT NULL,
  modelo NUMBER(2) CONSTRAINT lineas_pedido_nn2 NOT NULL ,
  n_pedido NUMBER(4) CONSTRAINT lineas_pedido_fk1 REFERENCES pedidos(n_pedido),
  n_linea NUMBER(2),
  cantidad NUMBER(5),
  precio NUMBER(11,4),

  CONSTRAINT lineas_pedido_fk2 FOREIGN KEY (tipo,modelo) REFERENCES  piezas(tipo,modelo),
  CONSTRAINT lineas_pedido_pk PRIMARY KEY (n_pedido,n_linea)
);