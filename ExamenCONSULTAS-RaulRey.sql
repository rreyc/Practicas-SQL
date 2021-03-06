SELECT *
FROM PELICULAS_COMPLET;

--Ejercicio 1
SELECT upper(TITULO)||': '||'crítica de '||substr(NOMBRE_CRITICO,1,1)||'.'||APELLIDO_CRITICO||','||to_char(FECHA,'fm day dd "de" month "de" yyyy')||', '||decode(ESTRELLAS,5,'*****',4,'****',3,'***',2,'**',1,'*')
  FROM PELICULAS_COMPLETO
ORDER BY length(TITULO),FECHA DESC ;


--Ejercicio 2
SELECT DISTINCT TITULO,DURACION
  FROM PELICULAS_COMPLETO
WHERE DURACION BETWEEN INTERVAL '1:15' HOUR TO MINUTE AND INTERVAL '1:45' HOUR TO MINUTE
ORDER BY TITULO;

--Ejercicio 3
SELECT initcap(TITULO),decode(extract( HOUR FROM DURACION),'1','60','2','120','3','180')+extract(minute FROM DURACION) AS MINUTOS,NOMBRE_CRITICO as nombre,APELLIDO_CRITICO as apellido,to_char(FECHA,'dd-mm-yyyy') AS fecha
  FROM PELICULAS_COMPLETO
WHERE FECHA BETWEEN '1/01/2018' and '01/01/2019'
ORDER BY DURACION DESC,nombre,apellido ;


--Ejercicio 4
SELECT TITULO,PAISES,LENGUA
  FROM PELICULAS_COMPLETO
WHERE PAISES like '%Estados Unidos%'  AND LENGUA<>'Inglés'
ORDER BY TITULO;

--Ejericio 5
SELECT DISTINCT TITULO, instr(PAISES,',',1) AS minutos
  FROM PELICULAS_COMPLETO
ORDER BY TITULO;

--Ejercicio 6
SELECT DISTINCT TITULO,PAISES
FROM PELICULAS_COMPLETO
WHERE PAISES<>'Estados Unidos';