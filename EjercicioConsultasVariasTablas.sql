SELECT titulo,n_curso,FECHA_INICIO,FECHA_FIN,NOMBRE,APELLIDO1,APELLIDO2
  from tipos_curso t,cursos c,profesores p
WHERE t.COD_CURSO=c.COD_CURSO and p.DNI=c.DNI_PROFESOR;

SELECT t.titulo,a.NOMBRE,a.APELLIDO1,a.APELLIDO2,c.fecha_inicio,c.fecha_fin
  from tipos_curso t,cursos c,alumnos a, asistir asi
WHERE t.COD_CURSO=c.COD_CURSO and c.n_curso=asi.n_curso and a.DNI=asi.dni;


/* REGLAS DE TABLES EN CONSULTAS DE VARIAS TABLAR
   1)Hay que colocar las tablas de las que queremos datos
   2)Hay que colocar las tablas necesarias para relacionar las tablas anteriores
   3)HAY QUE COLOCAR LAS MENOS TABLAS POSIBLES(CUANTO MENOS,MEJOR)  */

SELECT titulo, n_curso,FECHA_INICIO, FECHA_FIN
  from CURSOS
JOIN TIPOS_CURSO USING (cod_curso);

SELECT titulo, n_curso,fecha_inicio,fecha_fin,nombre,apellido1,APELLIDO2
  FROM CURSOS
JOIN TIPOS_CURSO USING (cod_curso)
JOIN PROFESORES ON (dni=DNI_PROFESOR);