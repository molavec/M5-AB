/*************************************
* CONSULTAS  SOBRE UNA TABLA
**************************************/

/*consulta 1*/
select nombre from producto;


/*consulta 2*/
select nombre, precio from producto;

/*consulta 2*/
select * from producto;

/*consulta 3*/
select * from producto;

/*consulta 4*/
select nombre, precio, precio*1.06 from producto;

/*consulta 5*/
select nombre as 'nombre de producto', precio as euro, precio*1.06 as dolar from producto;

/*consulta 6*/
select upper(nombre), precio from producto;

/*consulta 7*/
select LOWER(nombre), precio from producto;

/*consulta 8*/
select nombre,UPPER(SUBSTRING(nombre, 1, 2)) from fabricante;

/*consulta 9*/
select nombre, round(precio, 0) from producto;

/*consulta 10*/
select nombre, floor(precio) from producto;

/*consulta 11*/
select  id_fabricante from producto;

/*consulta 12*/
select DISTINCT id_fabricante from producto;

/*consulta 13*/
select nombre from fabricante ORDER BY nombre ASC;

/*consulta 14*/
select nombre from fabricante ORDER BY nombre DESC;

/*consulta 15*/
select nombre, precio from producto ORDER BY nombre ASC, precio DESC;

/*consulta 16*/
select * from fabricante limit 5;

/*consulta 17*/
select * from fabricante limit 2 offset 4;

/*consulta 18*/
select * from producto order by precio asc limit 1;

/*consulta 19*/
select * from producto order by precio desc limit 1;

/*consulta 20*/
select nombre from  fabricante where id > 2;

/*consulta 21*/
select nombre from producto where precio < 120;

/*consulta 22*/
select nombre from producto where precio >= 400;

/*consulta 23*/
select nombre from producto where precio < 400;

/*consulta 24*/
select * from producto where precio > 80 and precio < 300;

/*consulta 25*/
select * from producto where precio BETWEEN 60 and 200;

/*consulta 26*/
select * from producto where precio > 200 and id=6;

/*consulta 27*/
select * from producto where id_fabricante=1 or id_fabricante=3 or id_fabricante=5;

/*consulta 28*/
select * from producto where id_fabricante in (1,3,5);

/*consulta 29*/
select nombre, precio*100 as 'céntimos' from producto;

/*consulta 30*/
select nombre from fabricante where nombre LIKE 'S%';

/*consulta 31*/
select nombre from fabricante where nombre LIKE '%e';

/*consulta 32*/
select nombre from fabricante where nombre LIKE '%w%';

/*consulta 33*/
select nombre from fabricante where nombre LIKE '____';

/*consulta 34*/
select * from producto where nombre like '%portatil%';

/*consulta 35*/
select * from producto where nombre like '%monitor%' and precio < 215;

/*consulta 36*/
select nombre, precio from producto where precio < 180 order by precio desc, nombre asc;
 
/*************************************
* CONSULTAS MULTITABLA
**************************************/

/*consulta 1*/
select 
  p.nombre, p.precio, f.nombre as fabricante
from producto p
join fabricante f on p.id_fabricante=f.id; 

/*consulta 2*/
select 
  p.nombre, p.precio, f.nombre as fabricante
from producto p 
inner join fabricante f on p.id_fabricante=f.id
order by f.nombre;

/*consulta 3*/
select 
  p.id, p.nombre, p.id_fabricante, f.nombre as fabricante
from producto p 
inner join fabricante f on p.id_fabricante=f.id
order by f.nombre;

/*consulta 4*/
select 
  p.nombre, p.precio, f.nombre as fabricante
from producto p 
inner join fabricante f on p.id_fabricante=f.id
order by p.precio ASC limit 1;

/*consulta 5*/
/*consulta 6*/
/*consulta 7*/
/*consulta 8*/
/*consulta 9*/
/*consulta 10*/
/*consulta 11*/
/*consulta 12*/
/*consulta 13*/



/*************************************
* CONSULTAS  multitabla (Composición externa)
**************************************/

/*consulta 1*/
/*consulta 2*/
/*consulta 3*/



/*************************************
* CONSULTAS resumen
**************************************/

/*consulta 1*/
/*consulta 2*/
/*consulta 3*/
/*consulta 4*/
/*consulta 5*/
/*consulta 6*/
/*consulta 7*/
/*consulta 8*/
/*consulta 9*/
/*consulta 10*/
/*consulta 11*/
/*consulta 12*/
/*consulta 13*/
/*consulta 14*/
/*consulta 15*/
/*consulta 16*/
/*consulta 17*/
/*consulta 18*/
/*consulta 19*/
/*consulta 20*/
/*consulta 21*/
/*consulta 22*/
/*consulta 23*/
/*consulta 24*/
/*consulta 25*/
/*consulta 26*/