DROP DATABASE IF EXISTS m5_abp_5;
CREATE DATABASE m5_abp_5 CHARACTER SET utf8mb4;
USE m5_abp_5;

DROP TABLE clientes;
/* crea tabla clientes */
create table clientes (
    idcliente INT primary key,
		nombres varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    direccion varchar(70),
		telefono int
);
ALTER TABLE clientes MODIFY COLUMN idcliente INT AUTO_INCREMENT;

/* crea tabla ventas */
create table ventas (
  idventa  INT PRIMARY KEY NOT NULL,
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
DELIMITER $$
CREATE TRIGGER `clientes_idcliente_trigger` BEFORE INSERT ON `clientes` FOR EACH ROW
BEGIN
  DECLARE next_id INT;
  SELECT AUTO_INCREMENT INTO next_id FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'clientes';
  SET NEW.idcliente = next_id;
END;
$$



/* consulta 2 */

INSERT INTO clientes (
	nombres,
    apellidos,
    direccion,
	telefono 
) 
values 
  ( 'nombre_01', 'apellido_01', 'direccion_01', 111111),
  ( 'nombre_02', 'apellido_02', 'direccion_02', 222222)
  ;
  
select * from clientes;

/* consulta 3 */
ALTER TABLE ventas 
ADD CONSTRAINT cantarticulos_check 
CHECK (cantarticulos >= 1 AND cantarticulos <= 5);


INSERT INTO ventas (
  idventa,
  vendedor,
  cantarticulos,
  subtotal,
  impuesto,
  total,
  clientes_idcliente
) 
values 
  ( 1, 'vendedor_01', 3, 1000, 120, 1120, 1),
  ( 2, 'vendedor_02', 3, 2000, 120, 2120, 1),
  ( 3, 'vendedor_03', 7, 3000, 120, 3120, 1)
  ;


