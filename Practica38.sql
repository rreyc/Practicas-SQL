--Ejercicio 1
SELECT a.N_ALMACEN,p.tipo,p.modelo
  FROM almacenes a,piezas p,existencias e
WHERE p.tipo=e.tipo and p.modelo=e.modelo and e.n_almacen=a.N_ALMACEN and cantidad>=1000 and cantidad<=2000;

--Ejercicio 2

--SQL 92
SELECT p.tipo,p.modelo,precio_venta,a.n_almacen,CANTIDAD
  FROM almacenes a,piezas p,EXISTENCIAS E
WHERE a.n_almacen=e.n_almacen and e.tipo=p.tipo and e.modelo=p.modelo;

--SQL 99
SELECT tipo,modelo,precio_venta,n_almacen,CANTIDAD
  FROM piezas
NATURAL JOIN EXISTENCIAS;

--Ejercicio 3
--SQL 92
SELECT nombre,localidad,s.tipo,s.modelo,PRECIO_VENTA
  FROM EMPRESAS e, SUMINISTROS s, PIEZAS p
WHERE e.cif=s.CIF and p.tipo=s.tipo and s.modelo=p.modelo;

--SQL 99
SELECT nombre,localidad,tipo,modelo,PRECIO_VENTA
  FROM EMPRESAS
JOIN SUMINISTROS USING (cif)
JOIN PIEZAS USING (tipo,modelo);


--Ejercicio 4
--SQL 92
SELECT nombre,localidad,s.tipo,s.modelo,PRECIO_VENTA
  FROM EMPRESAS e, SUMINISTROS s, PIEZAS p
WHERE e.cif=s.CIF and p.tipo=s.tipo and s.modelo=p.modelo and PRECIO_COMPRA>PRECIO_VENTA;

--SQL 99
SELECT nombre,localidad,tipo,modelo,PRECIO_VENTA
  FROM EMPRESAS
JOIN SUMINISTROS USING (cif)
JOIN PIEZAS USING (tipo,modelo)
WHERE PRECIO_COMPRA>PRECIO_VENTA;

--Ejercicio 5
--SQL 92
SELECT p.N_PEDIDO,nombre,to_char(fecha,'Day dd "de" month "del año" yyyy')
  FROM EMPRESAS e,PEDIDOS p
WHERE e.cif=p.cif;

--SQL 99
SELECT N_PEDIDO,nombre,to_char(fecha,'Day dd "de" month "del año" yyyy')
  FROM EMPRESAS
JOIN PEDIDOS USING (cif);

--Ejercio 6
--SQL 92
SELECT p.N_PEDIDO,nombre,to_char(fecha,'"Trimestre" Q dy dd#mm#yyyy')
  FROM EMPRESAS e,PEDIDOS p
WHERE e.cif=p.cif;

--SQL 99
SELECT N_PEDIDO,nombre,to_char(fecha,'"Trimestre" Q dy dd#mm#yyyy')
  FROM EMPRESAS
JOIN PEDIDOS USING (cif);


--Ejercicio 7
SELECT nombre,telefono
  FROM EMPRESAS
WHERE substr(TELEFONO,9)=1 OR substr(TELEFONO,9)=3 OR substr(TELEFONO,9)=5 OR substr(TELEFONO,9)=6;

--Ejercicio 8
SELECT nombre,telefono
  FROM EMPRESAS
WHERE substr(TELEFONO,3,1)=2 OR substr(TELEFONO,3,1)=4 OR substr(TELEFONO,3,1)=6 OR substr(TELEFONO,3,1)=8 or substr(TELEFONO,3,1)=0;

--Ejercicio 9
SELECT DISTINCT PROVINCIA
  FROM EMPRESAS;

--Ejercicio 10
SELECT tipo,modelo,PRECIO_VENTA,round(0.21*PRECIO_VENTA+PRECIO_VENTA,3) AS "PRECIO CON IVA"
  FROM PIEZAS;

--Ejercico 11
SELECT a.descripcion,e.tipo,e.modelo,e.cantidad,p.PRECIO_VENTA,
  decode(e.N_ALMACEN,1,'Primer almacen',2,'Segundo almacen',3,'Tercer almacen')
  FROM almacenes a,EXISTENCIAS e,PIEZAS p
WHERE e.N_ALMACEN=a.N_ALMACEN and e.tipo=p.tipo and e.MODELO=p.modelo
ORDER BY a.n_almacen,e.TIPO,e.MODELO;

