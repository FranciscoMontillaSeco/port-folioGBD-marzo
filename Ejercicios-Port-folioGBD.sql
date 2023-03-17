--JOIN ON/USING || 18.3

select a.nombre as localidad,
       b.nombre as provincia,
       c.nombre AS comunidad
from LOCALIDADES a
JOIN PROVINCIAS b using(n_provincia)
JOIN COMUNIDADES c using(ID_COMUNIDAD);

--CROSS JOIN || 17.15

SELECT a.nombre,b.nombre,a.PROVINCIA
FROM EMPRESAS a
CROSS JOIN EMPRESAS b
WHERE a.cif>b.cif and a.PROVINCIA=b.PROVINCIA;

--LEFT OUTER JOIN || 19.3

select a.NOMBRE as NOMBRE,
       b.NOMBRE as PADRE,
       c.NOMBRE as MADRE
from personas a
left outer join personas b on(b.N_PERSONA=a.N_PADRE)
left outer join personas c on (c.N_PERSONA=a.N_MADRE);

--COUNT || 19.4

SELECT b.nombre as "Padre",
       c.nombre as "Madre",
       COUNT(*) as "Número de hijos"
FROM PERSONAS a
JOIN PERSONAS b on (a.N_PADRE=b.N_PERSONA)
JOIN PERSONAS c on (a.N_MADRE=c.N_PERSONA)
GROUP BY b.nombre, c.nombre
ORDER BY 3 DESC,1,2 ;

--HAVING || 21.5

SELECT NOMBRE,CIUDAD
FROM EQUIPOS
GROUP BY CIUDAD, NOMBRE
HAVING COUNT(*)>1;

--EJERCICIOS PERSONALES

--1

SELECT a.TIPO,
       b.CANTIDAD,
       b.N_ALMACEN,
       a.DESCRIPCION
FROM TIPOS_PIEZA a
JOIN EXISTENCIAS b ON (a.TIPO=b.TIPO);

--2

SELECT TIPO,AVG(PRECIO)
FROM LINEAS_PEDIDO
GROUP BY TIPO;