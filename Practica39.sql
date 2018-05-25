--Ejercicio 1
--SQL 92
SELECT l.nombre,poblacion,p.nombre
  from LOCALIDADES l,PROVINCIAS p
WHERE l.n_provincia=p.N_PROVINCIA;

--SQL 99
SELECT l.nombre,poblacion,p.NOMBRE
  from localidades l
JOIN provincias p USING (n_provincia);


--Ejercicio 2
--SQL 92
SELECT  p.NOMBRE,l.NOMBRE
  from LOCALIDADES l, PROVINCIAS P
WHERE l.ID_LOCALIDAD=p.ID_CAPITAL;

--SQL 99
SELECT p.NOMBRE,l.NOMBRE
  from LOCALIDADES L
JOIN PROVINCIAS p ON (id_capital=ID_LOCALIDAD);


--Ejercicio 3
--SQL 92
SELECT l.nombre,p.nombre,c.NOMBRE
  FROM PROVINCIAS p, LOCALIDADES l, COMUNIDADES c
WHERE l.N_PROVINCIA=p.N_PROVINCIA and c.ID_COMUNIDAD=p.ID_COMUNIDAD;

--SQL 99
SELECT l.nombre,p.nombre,c.NOMBRE
  FROM PROVINCIAS p
JOIN LOCALIDADES l USING (n_provincia)
JOIN  COMUNIDADES c USING (id_comunidad);

--Ejercicio 4
--SQL 92
SELECT l.nombre AS  localidad,p.nombre as provincia,c.NOMBRE as comunidad,lo.nombre as capital
  FROM PROVINCIAS p, LOCALIDADES l, COMUNIDADES c, LOCALIDADES lo
WHERE l.N_PROVINCIA=p.N_PROVINCIA and c.ID_COMUNIDAD=p.ID_COMUNIDAD and p.id_capital=lo.ID_LOCALIDAD;


--SQL 99
SELECT l.nombre AS localidad,p.nombre as provincia,c.NOMBRE as comunidad, lo.nombre as capital
  FROM PROVINCIAS p
JOIN LOCALIDADES l USING (n_provincia)
JOIN  COMUNIDADES c USING (id_comunidad)
JOIN LOCALIDADES lo on(p.ID_CAPITAL=lo.ID_LOCALIDAD);

--Ejercicio 5
--SQL 92
SELECT l.nombre AS  localidad,p.nombre as provincia,c.NOMBRE as comunidad,lo.nombre as capital_provincia,loc.nombre as capital_comunidad
  FROM PROVINCIAS p, LOCALIDADES l, COMUNIDADES c, LOCALIDADES lo,LOCALIDADES loc
WHERE l.N_PROVINCIA=p.N_PROVINCIA and c.ID_COMUNIDAD=p.ID_COMUNIDAD and p.id_capital=lo.ID_LOCALIDAD and c.ID_CAPITAL=loc.ID_LOCALIDAD;

--SQL 99
SELECT l.nombre AS localidad,p.nombre as provincia,c.NOMBRE as comunidad, lo.nombre as capital,loc.nombre as capital_comunidad
  FROM PROVINCIAS p
JOIN LOCALIDADES l USING (n_provincia)
JOIN  COMUNIDADES c USING (id_comunidad)
JOIN LOCALIDADES lo on(p.ID_CAPITAL=lo.ID_LOCALIDAD)
JOIN localidades loc on(loc.ID_LOCALIDAD=c.ID_CAPITAL);

--Ejercicio 6
SELECT l.NOMBRE,POBLACION
  FROM LOCALIDADES l, PROVINCIAS p
WHERE p.id_capital=l.ID_LOCALIDAD and POBLACION>200000;

--Ejercicio 7
SELECT l.nombre,poblacion
  from LOCALIDADES l,COMUNIDADES c
WHERE l.ID_LOCALIDAD=c.ID_CAPITAL and POBLACION>200000;


--Ejercicio 8
SELECT l.nombre
  FROM LOCALIDADES l,PROVINCIAS p,LOCALIDADES lo
WHERE l.N_PROVINCIA=p.N_PROVINCIA AND l.POBLACION>lo.POBLACION AND p.ID_CAPITAL=lo.ID_LOCALIDAD;


