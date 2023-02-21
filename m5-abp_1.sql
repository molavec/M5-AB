/* crea base de datos */
create database M5_ABPRO;

/* crea tabla ventas */
create table ventas (
    idventa INT PRIMARY KEY AUTO_INCREMENT,
    comprador varchar(30),
		vendedor varchar(30),
    cantarticulos int,
		subtotal int,
		impuesto int,
    total int
);

/* inserta filas */
insert into ventas 
	(
    comprador,
		vendedor,
    cantarticulos,
		subtotal,
		impuesto,
    total
	)
values
	('comprador_01','vendedor_01', 1, 100, 120, 1120),
	('comprador_02','vendedor_02', 2, 200, 120, 2120),
	('comprador_03','vendedor_03', 3, 300, 120, 3120),
	('comprador_04','vendedor_04', 4, 400, 120, 4120),
	('comprador_05','vendedor_05', 5, 5000, 120, 5120),
	('comprador_06','vendedor_06', 6, 6000, 120, 6120),
	('comprador_07','vendedor_07', 7, 7000, 120, 7120),
	('comprador_08','vendedor_08', 8, 8000, 120, 8120),
	('comprador_09','vendedor_09', 9, 9000, 120, 9120),
	('comprador_10','vendedor_10', 10, 10000, 120, 10120),
	('comprador_11','sonia garrido', 10, 4000, 120, 4120),
	('comprador_12','sonia garrido', 10, 10000, 120, 10120),
	('lucas','maria', 10, 10000, 120, 10),
	('comprador_14','maria', 10, 10000, 120, 10)
	;

/* consulta 1 */
select idventa, comprador, cantarticulos
from ventas
where
cantarticulos > 2;


/* consulta 2 */
select 
	idventa,
	comprador,
	cantarticulos
from ventas
where
	subtotal < 1000
;

/* consulta 3 */
select 
	total,
	impuesto,
	subtotal,
	cantarticulos,
	vendedor,
	comprador,
	idventa
from ventas
where
	vendedor='sonia garrido'
and
	total >= 5000
;

/* consulta 4 */
select 
	vendedor,
	comprador,
	total
from ventas
where
	comprador='lucas'
or
	vendedor='maria'
;


/* consulta 5 */
select *
from ventas
where 
	idventa=2
or
	idventa=5
or
	idventa=6
or
	idventa=9
