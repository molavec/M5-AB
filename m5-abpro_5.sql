
DROP DATABASE IF EXISTS m5_abpro_5;
CREATE DATABASE m5_abpro_5 CHARACTER SET utf8mb4;
USE m5_abpro_5;


/* crea tabla capacitación */
create table capacitacion (
    idcapacitacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dia varchar(25),
    hora varchar(5),
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

ALTER TABLE accidente
ADD FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente);

show columns from capacitacion;

show create table capacitacion;


/* consulta 3 */
ALTER TABLE cliente
MODIFY COLUMN telefono INT NOT NULL UNIQUE;


/* consulta 4 */
ALTER TABLE cliente
ADD CONSTRAINT sistemasalud_check
CHECK (sistemasalud=1 OR sistemasalud=2);



/* consulta 5 */

/* 4 cliente */
INSERT INTO cliente (
  rutcliente,
  nombres,
  apellidos,
  telefono,
  afp,
  sistemasalud,
  direccion,
  comuna,
  edad
) 
values 
(11111, 'nombre_01', 'apellido_01', '11111111', 'afp_01', 1, 'comuna_01', 'direccion_01', 21),
(22222, 'nombre_02', 'apellido_02', '22222222', 'afp_02', 1, 'comuna_02', 'direccion_02', 22),
(33333, 'nombre_03', 'apellido_03', '33333333', 'afp_03', 2, 'comuna_03', 'direccion_03', 33),
(44444, 'nombre_04', 'apellido_04', '44444444', 'afp_04', 2, 'comuna_04', 'direccion_04', 44);


/* 7 accidente */
INSERT INTO accidente (
  dia,
  hora,
  lugar,
  origen,
  consecuencias,
  cliente_rutcliente
)
VALUES
(STR_TO_DATE('01/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00','%H:%i'), 'lugar_01', 'origen_01', 'consecuencias_01', 11111),
(STR_TO_DATE('02/01/2023', '%d/%m/%Y'), STR_TO_DATE('11:00','%H:%i'), 'lugar_02', 'origen_02', 'consecuencias_02', 11111),
(STR_TO_DATE('03/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00','%H:%i'), 'lugar_03', 'origen_03', 'consecuencias_03', 22222),
(STR_TO_DATE('04/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00','%H:%i'), 'lugar_04', 'origen_04', 'consecuencias_04', 22222),
(STR_TO_DATE('05/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00','%H:%i'), 'lugar_05', 'origen_05', 'consecuencias_05', 33333),
(STR_TO_DATE('06/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00','%H:%i'), 'lugar_06', 'origen_06', 'consecuencias_06', 33333),
(STR_TO_DATE('07/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00','%H:%i'), 'lugar_07', 'origen_07', 'consecuencias_07', 44444);
