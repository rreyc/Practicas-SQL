CREATE TABLE equipos (
  id_equipo NUMBER(2) CONSTRAINT equipo_pk PRIMARY KEY ,
  nombre VARCHAR2(50) CONSTRAINT equipos_uk1 UNIQUE
                      CONSTRAINT equipos_nn1 NOT NULL ,
  estadio VARCHAR2(50) CONSTRAINT equipos_uk2 UNIQUE ,
  aforo NUMBER(6) ,
  ano_fundacion VARCHAR2(50) ,
  ciudad VARCHAR2(50) CONSTRAINT equipos_nn2 NOT NULL
);

CREATE TABLE jugadores (
id_jugador NUMBER(3) CONSTRAINT jugadores_pk PRIMARY KEY ,
nombre VARCHAR2(50) CONSTRAINT jugadores_nn1 NOT NULL ,
fecha_nac DATE ,
id_equipo  NUMBER(2) CONSTRAINT jugadores_fk1 REFERENCES equipos(id_equipo) ON DELETE SET NULL
);


CREATE TABLE partidos (
  id_equipo_casa NUMBER(2) CONSTRAINT partidos_fk1 REFERENCES equipos(id_equipo) ON DELETE CASCADE ,
  id_equipo_fuera NUMBER(2) CONSTRAINT partidos_fk2 REFERENCES equipos(id_equipo) ON DELETE CASCADE ,
  fecha TIMESTAMP ,
  goles_casa NUMBER(2),
  goles_fuera NUMBER(2),
  observaciones VARCHAR2(1000) ,
  CONSTRAINT partidos_pk PRIMARY KEY (id_equipo_casa,id_equipo_fuera) ,
  CONSTRAINT partidos_ck CHECK (id_equipo_casa!=id_equipo_fuera)
  );


CREATE TABLE goles (
  id_equipo_casa NUMBER(2) ,
  id_equipo_fuera NUMBER(2) ,
  minuto INTERVAL DAY TO SECOND ,
  descripcion VARCHAR2(2000) ,
  id_jugador NUMBER(3) CONSTRAINT goles_fk2 REFERENCES jugadores(id_jugador) ON DELETE CASCADE ,
  CONSTRAINT goles_pk PRIMARY KEY (id_equipo_casa,id_equipo_fuera,minuto) ,
  CONSTRAINT goles_fk1 FOREIGN KEY (id_equipo_casa,id_equipo_fuera) REFERENCES partidos(id_equipo_casa,id_equipo_fuera) ON DELETE CASCADE
);



ALTER TABLE equipos MODIFY aforo CONSTRAINT equipos_nn3 NOT NULL;
ALTER TABLE equipos MODIFY estadio CONSTRAINT equipos_nn4 NOT NULL;
ALTER TABLE equipos MODIFY ano_fundacion DATE;
ALTER TABLE jugadores DROP CONSTRAINT jugadores_nn1;