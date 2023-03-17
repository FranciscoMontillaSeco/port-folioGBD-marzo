# port-folioGBD-marzo
## Tabla de contenidos
- [Resumen](#resumen)
     - [Tema 6](#tema-6)
     - [Tema 7](#tema-7)
- [Reflexiones personales](#reflexiones-personales)
- [Ejercicios significativos](#ejercicios-significativos)
     - [Ejercicios de invenión propia](#ejercicios-de-invención-propia)
- [Conclusiones](#conclusiones)
## Resumen
En este apartado vamos a resumir lo que se ha explicado a lo largo de este trimestre en la asignatura de Gestión de bases de datos, para ello vamos a dividir la información en 2 temas.
### *Tema 6*
En este tema hemos tocado los siguientes apartados:
- La cláusula Select en SQL, la cual es la única instrucción del lenguaje DQL y permite realizar consultas sobre las tablas (cálculos, agrupaciones ...).
- También hemos empezado a profundizar sobre esta con las funciones y operaciones numericas, utilizando funciones como sysdate y realizando operaciones sobre números.
- En el siguiente apartado aprendimos a utilizar instrucciones sobre textos y nulos, cortando textos, cambiando nulos por textos, etc.
- Despues pasamos a realizar calculos con fechas.
- A continuación, aprendimos a realizar conversiones de datos, haciendolos pasar de numeros a textos, de textos a fechas, etc.
- Por último, hemos aprendido a utilizar expresiones regulares, unas funciones capaces de facilitar mucho el trabajo a la hora de realizar ciertas consultas, utilizando codigos de exrpesiones regulares para cambiar textos de maneras más comodas.

### *Tema 7*
En este tema hemos realizado un estudio sobre las consultas sobre varias tablas.
- Hemos empezado con el producto cruzado, que es una operación para combinar cada fila de una tabla con cada fila de la otra. Esto no refleja la realidad de cómo se combinan los datos.
- La cláusula JOIN permitio especificar más facilmente las relaciones entre tablas dentro de una consulta.
     - JOIN USING  permite relacionar en una o varias columnas, estas columnas solos se pueden usar si el nombre de estas son iguales en ambas tablas.
     - JOIN ON Indica la relacion entre tablas de manera más completa, pero necesita cualificar las columnas para que no haya ambigüedad (igualando una columna con la otra).
     - NATURAL JOIN Es un JOIN USING en el que se sobreentiende que se asocian todas las columnas que tienen el mismo nombre (no se usa por su inespecificidad).
- La cláusula OUTER JOIN
     - INNER JOIN En estas consultas solo aparecen las filas que se relacionan.
     - OUTER JOIN En estas consultas pueden aparecer filas no relacionadas. (dos tipos)
          - LEFT OUTER JOIN  Aparecen datos de la tabla de la izquierda estén o no relacionados con la de la derecha de la consulta. (los datos sin relacion tendrán los datos como nulos en la consulta). Lo mismo ocurre pero al contrario con el RIGHT OUTER JOIN.
          - FULL OUTER JOIN Aparecen todos los datos relacionados y sin relacionar (estos apareceran como nulos).
          - Consultas de no coincidentes: Muestra datos de una tabla exclusivamente si no se relacionan con otra.
- Productos cruzados
     - CROSS JOIN muestra todas las combinaciones de las filas de una tabla con todas las de la segunda.

En la segunda parte del tema hemos estudiado las consultas de totales.
- Las consultas de totales estas nos permiten realizar cálculos con datos de diferentes filas de manera vertical.
- Funciones de totales 
     - COUNT Cuenta los valores que no tengan valor nulo de una fila.
     - SUM Suma los valores de una fila.
     - AVG Medida aritmética de una fila.
     - MAX Busca el máximo de la fila.
     - MIN Busca el mínimo de la fila.
     - STDDEV
     - VARIANCE
- Agrupar los resultados con la cláusula GROUP BY, la cuál sirve para realizar calculos por agrupaciones. 
- Cláusula HAVING funciona como sustituto a WHERE para las funciones totales.
## Reflexiones personales

En general me han parecido los temas más interesantes que se han explicado hasta la fecha, a parte de seguir un orden lógico, lo cuál me ayuda mucho más a entender como funciona el lenguaje SQL.
Bajo mi punto de vista, las bases de datos ganan mucha utilidad cuando se le aplican consultas, por lo cuál me parece un tema fundamental, el primero para aprender como manejar los datos de manera más especifica, y el segundo abriendote las puertas a relacionar estos datos sobre los que ya hemos realizado un trabajo, por lo cual me han aportado mucho conocimiento sobre bases de datos y a la hora de entender como funciona nuestra información en internet, como realizar busquedas especificas sobre temas complejos, etc.

De estos temas podemos destacar de manera positiva las expresiones regulares del primer tema, puesto que son herramientas muy potentes para realizar consultas (aunque estén limitadas a oracle enterprise), y las funciones totales del segundo, puesto que permiten realizar operaciones de una manera que no conocia y me ha resultado muy interesante.
Por destacar algo negativo diria que los calculos con fechas del primer tema me resultaron algo complicados y denso, aunque tengan su parte útil y buena, y del segundo tema no entiendo muy bien la necesidad de la cláusula HAVING.
## Ejercicios significativos

Ahora vamos a resaltar ciertos ejercicios de las prácticas que se han realizado durante el transcurso de las clases.

Para ver el documento SQL haz clic [aquí](./Ejercicios-Port-folioGBD.sql)

1.- Ejercicio con JOIN ON o JOIN USING

Hemos utilizado el ejercicio 3 de la práctica 18.
>En geografia muesta el nombre de cada localidad, la provincia en la que está y su comunidad.  
```
select a.nombre as localidad,
       b.nombre as provincia,
       c.nombre AS comunidad
from LOCALIDADES a
JOIN PROVINCIAS b using(n_provincia)
JOIN COMUNIDADES c using(ID_COMUNIDAD);
```

2.- Consulta que utilice un CROSS JOIN

Hemos utilizado el ejercicio 15 de la práctica 17
>En almacen vamos a mostrar el nombre de las empresas que están en la misma provincia.
```
SELECT a.nombre,b.nombre,a.PROVINCIA
FROM EMPRESAS a
CROSS JOIN EMPRESAS b
WHERE a.cif>b.cif and a.PROVINCIA=b.PROVINCIA;
```
3.- Consulta con LEFT OUTER JOIN

En este caso el ejercicio 3 de la práctica 19
>En el esquema padremadre muestra el nombre de las personas, el de su padre y el de su madre y muestra las personas sin padre ni madre.
```
select a.NOMBRE as NOMBRE,
       b.NOMBRE as PADRE,
       c.NOMBRE as MADRE
from personas a
left outer join personas b on(b.N_PERSONA=a.N_PADRE)
left outer join personas c on (c.N_PERSONA=a.N_MADRE);

```
4.- Consulta con SUM, AVG, COUNT, MAX o MIN

El ejercicios es el 4 de la práctica 19
>En el esquema padremadre, obtén el número de hijos de cada pareja y ordenalos de más a menos hijos, después por nombre del padre y luego por el de la madre.
```
SELECT b.nombre as "Padre",
       c.nombre as "Madre",
       COUNT(*) as "Número de hijos"
FROM PERSONAS a
JOIN PERSONAS b on (a.N_PADRE=b.N_PERSONA)
JOIN PERSONAS c on (a.N_MADRE=c.N_PERSONA)
GROUP BY b.nombre, c.nombre
ORDER BY 3 DESC,1,2 ;
```

5.- Consulta con HAVING

El ejercicio 5 de la práctica 21 muestra muy bien el uso de esta función
>En el esquema nba, muestra los equipos y ciudades que aparezcan varias veces en la tabla equipos.
```
SELECT NOMBRE,CIUDAD
FROM EQUIPOS
GROUP BY CIUDAD, NOMBRE
HAVING COUNT(*)>1;
```

### *Ejercicios de invención propia*

En este apartado vamos a intentar utilizar todo lo que hemos aprendido para crear y resolver dos ejercicios como los que se han planteado en el apartado anterior.

Por comodidad, vamos a realizar los dos ejercicios en el esquema de almacen

Ejercicio 1:
> Crea una consulta a partir de las tablas Tipos_pieza y existencias en la que muestres el tipo de pieza, su cantidad, el número de almacen de cada una y su descripción.
```
SELECT a.TIPO,
       b.CANTIDAD,
       b.N_ALMACEN,
       a.DESCRIPCION
FROM TIPOS_PIEZA a
JOIN EXISTENCIAS b ON (a.TIPO=b.TIPO);
```

Ejercicio 2:
>En la tabla lineas_pedidos, calcla la media de costo por pieza.
```
SELECT TIPO,AVG(PRECIO)
FROM LINEAS_PEDIDO
GROUP BY TIPO;
```

## Conclusiones

Como conclusión general se puede decir que ahora ya tenemos una nocion básica de como realizar una base de datos y sacarle una utilidad.

Ahora, durante estos temas, a parte de el problema personal, quizá he tenido problemas entendiendo el uso del cross join, a parte de que las fechas me parecen complicadas, por ese apartado yo creo que el resto ha sido todo bastante claro y facil de entender.

Ahora vamos a repasar lo que más me ha gustado de estos dos temas, y lo que menos.

Lo que más me ha gustado:
- En mi caso, a parte de todo el trabajo práctico en la base de datos, me han gustado mucho las funciones con textos y nulos, ya que le veo muchisimo potencial a la hora de ordenar y concretar información, y la transformación de datos.

Lo que menos me ha gustado:
- Para mí, los dos apartados más negativos del tema serían las funciones matemáticas, y quizá el uso del having, puesto que me ha resultado un poco engorroso.