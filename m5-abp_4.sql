/* crea base de datos */

DROP DATABASE IF EXISTS m5_abp_4;
CREATE DATABASE m5_abp_4 CHARACTER SET utf8mb4;
USE m5_abp_4;
/* crea tabla clientes */
create table clientes (
    idcliente INT PRIMARY KEY NOT NULL,
		nombres varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    direccion varchar(70),
		telefono int
);

/* crea tabla ventas */
create table ventas (
    idventa INT PRIMARY KEY NOT NULL,
		vendedor varchar(30),
    cantarticulos int NOT NULL,
		subtotal int NOT NULL,
		impuesto int NOT NULL,
    total int NOT NULL,
    clientes_idcliente int NOT NULL,
    FOREIGN KEY (clientes_idcliente) REFERENCES clientes(idcliente)
);

show tables;
show create table ventas;

/* consulta 1 */
/* inserta filas clientes */
insert into clientes 
  (
    idcliente,
    nombres,
    apellidos,
    direccion,
		telefono
  )
  VALUES
  (1, 'nombre_01', 'apellido_01', 'direccion_01', 111111111),
  (2, 'nombre_02', 'apellido_02', 'direccion_02', 222222222),
  (3, 'nombre_03', 'apellido_03', null, null);


/* consulta 2 */
insert into ventas 
	(
    idventa,
		vendedor,
    cantarticulos,
		subtotal,
		impuesto,
    total,
    clientes_idcliente
	)
values
	(1, 'vendedor_01', 1, 1000, 120, 1120, 1),
  (2, 'vendedor_02', 2, 2000, 220, 2220, 2),
  (3, 'vendedor_03', 3, 3000, 320, 3320, 3),
  (4, 'vendedor_04', 4, 4000, 420, 4420, 1),
  (5, 'vendedor_05', 5, 5000, 520, 5520, 1);

/* consulta 3 */
UPDATE ventas
SET total = subtotal + impuesto;


/* consulta 4 */
-- Eliminar todas las ventas asociadas al cliente por su idcliente
DELETE FROM ventas WHERE clientes_idcliente = 1;

-- Eliminar el cliente por su idcliente
DELETE FROM clientes WHERE idcliente = 1;


