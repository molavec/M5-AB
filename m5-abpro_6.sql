DROP DATABASE IF EXISTS m5_abpro_6;
CREATE DATABASE m5_abpro_6 CHARACTER SET utf8mb4;
USE m5_abpro_6;


/* crea tabla capacitación */
create table capacitacion (
    idcapacitacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha date,
    hora date,
    lugar varchar(50) NOT NULL,
    duracion int NOT NULL,
    cantidadasistentes int
);

/* crea tabla asistentes */
create table asistentes (
    idasistente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombres varchar(100) NOT NULL,
    edad int NOT NULL,
    capacitacion_idcapacitacion int NOT NULL, 
		FOREIGN KEY (capacitacion_idcapacitacion) REFERENCES capacitacion(idcapacitacion)
);


/* consulta 1 */
/* crea tabla cliente */
create table cliente (
    rutcliente INT PRIMARY KEY NOT NULL,
    nombres varchar(30) NOT NULL,
    apellidos varchar(30) NOT NULL,
    telefono varchar(20) NOT NULL,
    afp varchar(30),
    sistemasalud SMALLINT,
    direccion varchar(70),
    comuna varchar(50),
    edad MEDIUMINT NOT NULL
);

/* crea tabla accidente */
create table accidente (
    accidenteid BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dia date,
    hora date,
    lugar varchar(50) NOT NULL,
    origen varchar(100),
    consecuencias varchar(100),
    cliente_rutcliente int NOT NULL,
    FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente)
);




/* consulta 2 */

ALTER TABLE capacitacion
ADD cliente_rutcliente INT NOT NULL;
ALTER TABLE capacitacion
ADD FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente);


/* consulta 3 */
ALTER TABLE cliente
MODIFY COLUMN telefono INT NOT NULL UNIQUE;

/* consulta 4 */
ALTER TABLE cliente
ADD CONSTRAINT sistemasalud_check
CHECK (sistemasalud=1 OR sistemasalud=2);

show CREATE table cliente;




/* update capacitacion */
START TRANSACTION;
ALTER TABLE capacitacion RENAME COLUMN fecha to capfecha;
ALTER TABLE capacitacion RENAME COLUMN hora to caphora;
ALTER TABLE capacitacion RENAME COLUMN lugar to caplugar;
ALTER TABLE capacitacion RENAME COLUMN duracion to capduracion;
COMMIT;


/* update asistentes */
START TRANSACTION;
ALTER TABLE asistentes RENAME COLUMN nombres to asistnombrecompleto;
ALTER TABLE asistentes RENAME COLUMN edad to asistedad;
ALTER TABLE asistentes ADD COLUMN asistcorreo VARCHAR(70);
ALTER TABLE asistentes ADD COLUMN asisttelefono VARCHAR(20);
COMMIT;

/* update cliente */
START TRANSACTION;
ALTER TABLE cliente RENAME COLUMN nombres to clinombres;
ALTER TABLE cliente RENAME COLUMN apellidos to cliapellidos;
ALTER TABLE cliente RENAME COLUMN telefono to clitelefono;
ALTER TABLE cliente RENAME COLUMN afp to cliafp;
ALTER TABLE cliente DROP CHECK sistemasalud_check;
ALTER TABLE cliente RENAME COLUMN sistemasalud to clisistemasalud;
ALTER TABLE cliente
ADD CONSTRAINT sistemasalud_check
CHECK (clisistemasalud=1 OR clisistemasalud=2);
ALTER TABLE cliente RENAME COLUMN direccion to clidireccion;
ALTER TABLE cliente RENAME COLUMN comuna to clicomuna;
ALTER TABLE cliente RENAME COLUMN edad to cliedad;
COMMIT;


/* update accidente */
START TRANSACTION;
ALTER TABLE accidente RENAME COLUMN dia to accifecha;
ALTER TABLE accidente RENAME COLUMN hora to accihora;
ALTER TABLE accidente RENAME COLUMN lugar to accilugar;
ALTER TABLE accidente RENAME COLUMN origen to acciorigen;
ALTER TABLE accidente RENAME COLUMN consecuencias to acciconsecuencias;
COMMIT;


/* update accidente */
START TRANSACTION;
CREATE TABLE visita (
  idvisita BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  visfecha date NOT NULL,
  vishora date,
  vislugar VARCHAR(50) NOT NULL,
  viscomentarios VARCHAR(250) NOT NULL,
  cliente_rutcliente INT NOT NULL,
  FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente)
);
COMMIT;

