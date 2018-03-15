--Ejercicio 1
SELECT ABS(57)
FROM dual;
--Ejercicio 2
SELECT SQRT(23)
  FROM dual;
--Ejercicio 3
SELECT replace(round(SQRT(23),3),'.',',')
  FROM dual;
--Ejercicio 4
SELECT nombre, upper(substr(nombre,-3))
  FROM alumnos
ORDER BY nombre  DESC ;
--Ejercicio 5
SELECT dni,NOMBRE,APELLIDO1,APELLIDO2,DIRECCION,substr(TELEFONO,1,3)||' '||substr(TELEFONO,4,3)||' '||substr(TELEFONO,7,3),edad,CIF
  FROM alumnos
ORDER BY APELLIDO1,APELLIDO2,NOMBRE;
--Ejercicio 6
SELECT N_CURSO,fecha_inicio+interval '1' month,fecha_fin+INTERVAL '1' MONTH
FROM cursos;
--Ejercicio 7
SELECT N_CURSO,fecha_inicio+interval '45' minute,fecha_fin+0.03125
FROM cursos;
--Ejercicio 8
SELECT n_curso,fecha_inicio,fecha_fin,extract(day from fecha_fin-fecha_inicio)
  FROM cursos;
SELECT n_curso,fecha_inicio,fecha_fin,fecha_fin-fecha_inicio
  FROM cursos;

--Ejercicio 9
SELECT replace(to_char(fecha_inicio,'fm Day dd / Month / yyyy hh:mm AM'),'/','de'),
      replace(to_char(fecha_fin,'fm Day dd / Month / yyyy hh:mm AM'),'/','de')
  FROM CURSOS;
--Ejercicio 10
SELECT extract(day FROM last_day(sysdate))
FROM dual;
SELECT to_char(last_day(sysdate),'dd')
  FROM dual;
--Ejercicio 11
SELECT to_Date('01/01/2019')-sysdate
  FROM dual;
--Ejercicio 12
--Ejercicio 13
