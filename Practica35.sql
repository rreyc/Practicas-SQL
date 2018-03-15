--Ejercicio 1
SELECT fecha_prestamo, SYSDATE-Fecha_prestamo
  FROM prestamos
ORDER BY fecha_prestamo DESC ;

--Ejercicio 2
SELECT fecha_prestamo,n_copia,fecha_tope
  FROM PRESTAMOS
WHERE FECHA_ENTREGA is NULL ;

--Ejercicio 3
SELECT id_prestamo,dni
  FROM PRESTAMOS
WHERE extract(month from fecha_prestamo)=extract(month from to_date('31/3/2018'));

--Ejercicio 4
SELECT dni,to_char(fecha_prestamo,'fmdd/mm/yyyy'), to_char(fecha_entrega, 'fmdd/mm/yyyy'),to_char(fecha_tope,'fmdd/mm/yyyy')
  FROM prestamos;

--Ejercicio 5
SELECT titulo
FROM peliculas
WHERE INSTR(TITULO,' ')=0;
--Ejercicio 6
SELECT titulo
  FROM peliculas
WHERE instr(titulo,' ',1,2)=0 AND instr(TITULO,' ')!=0;
--Ejercicio 7
SELECT titulo
  FROM peliculas
WHERE length(TITULO)>length(CRITICA);
--Ejercicio 8
SELECT upper(translate(titulo,'áéíóúü','aeiouu'))
  FROM peliculas;
--Ejercicio 9
SELECT titulo,año
  FROM peliculas
WHERE SUBSTR(año,1,1)+SUBSTR(año,2,1)+SUBSTR(año,3,1)+SUBSTR(4,1)<10;
--Ejercicio 10
SELECT NVL(substr(titulo,1,instr(titulo,' ',1,3)),titulo)AS titulo_comprimido
  FROM peliculas;
--Ejercicio 11
SELECT NOMBRE
  FROM clientes
WHERE instr(translate(upper(nombre),'Á','A'),'A') IN (1,3,5) OR
      instr(translate(upper(nombre),'É','E'),'E') IN (1,3,5);
--Ejercicio 12
SELECT titulo
  FROM peliculas
WHERE instr(titulo,' ')=0 AND
      instr(translate(upper(TITULO),'ÁAÉEÓOÍIÚUÜ','***********'),'*')!=0 AND
      instr(translate(upper(TITULO),'ÁAÉEÓOÍIÚUÜ','***********'),'*',1,2)=0;
--Ejercicio 13
SELECT nombre||' '||apellido1||' '||apellido2||' '||NVL2(EMAIL,'('||email||')','sin email') AS DATOS
  FROM CLIENTES;
--Ejercicio 14
SELECT n_copia,decode(deteriorada,1,'Si',0,'No'), decode(formato,1,'DVD',2,'BlueRay')
  FROM copias;
--Ejercicio 15

--Ejercicio 16
--Ejercicio 17
--Ejercicio 18










