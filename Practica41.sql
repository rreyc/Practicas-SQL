--Ejercicio 1
SELECT p.nombre, sum(orejas),sum(rabos)
  FROM plazas p,toros t, corridas c
WHERE p.id_plaza=c.id_plaza AND c.ID_CORRIDA=t.ID_CORRIDA
  GROUP BY p.NOMBRE;

--Ejercicio 2
SELECT g.nombre, sum(orejas), sum(RABOS)
  FROM GANADERIAS g, CORRIDAS c, TOROS t
WHERE g.id_ganaderia=c.id_ganaderia and c.id_corrida=t.id_corrida
GROUP BY g.nombre
ORDER BY sum(orejas) DESC;

--Ejercicio 3
SELECT count(id_corrida),p.NOMBRE
  FROM  plazas p, corridas c
WHERE p.id_plaza=c.id_plaza
GROUP BY p.nombre;
--Ejercicio 4
SELECT substr(t.nombre,1,1), count(*)
  FROM toros t
GROUP BY substr(t.nombre,1,1)
ORDER BY substr(t.nombre,1,1);
--Ejercicio 5
SELECT max(sum(orejas))
  FROM toros t, toreros tor
WHERE tor.id_torero=t.id_torero and orejas!=0
GROUP BY tor.NOMBRE;
--Ejercicio 6
SELECT PROPIETARIO, count(nombre)
  FROM GANADERIAS
  GROUP BY  propietario
HAVING count(propietario)>1;
--Ejercicio 7
SELECT tor.nombre, p.ID_PLAZA
  FROM toreros tor, toros t, corridas c, plazas p
WHERE tor.id_torero=t.id_torero and t.id_corrida=c.id_corrida and c.id_plaza=p.id_plaza;

SELECT tor.nombre, count(DISTINCT p.id_plaza)
  FROM toreros tor, toros t, corridas c, plazas p
WHERE tor.id_torero=t.id_torero and t.id_corrida=c.id_corrida and c.id_plaza=p.id_plaza
GROUP BY tor.NOMBRE
HAVING count(DISTINCT p.id_plaza)>1;
--Ejercicio 8
SELECT DISTINCT tor.nombre
  FROM toreros tor, toros t, corridas c
WHERE  tor.id_torero=t.id_torero and t.id_corrida=c.id_corrida
    GROUP BY tor.nombre, t.ID_CORRIDA
HAVING sum(orejas)>=2;
--Ejercicio 9
SELECT to_char(c.FECHA_CORRIDA,'month'),count(*)
  FROM corridas c
GROUP BY  to_char(c.FECHA_CORRIDA,'month')
ORDER BY 2 DESC ;
--Ejercicio 10
--Ejercicio 11
--Ejercicio 12
--Ejercicio 13
--Ejercicio 14
