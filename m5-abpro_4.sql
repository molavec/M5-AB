
DROP DATABASE IF EXISTS m5_abpro_4;
CREATE DATABASE m5_abpro_4 CHARACTER SET utf8mb4;
USE m5_abpro_4;


/* crea tabla capacitación */
create table capacitacion (
    idcapacitacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rutcliente varchar(15) NOT NULL,
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
START TRANSACTION;

insert into capacitacion (
  rutcliente,
  lugar,
  duracion
  ) 
values 
  ('1-1', 'place_01', 60);

select * from capacitacion;

/* consulta 2 */
COMMIT;

/* consulta 3 */
SET AUTOCOMMIT = 2;


/* consulta 4 */
START TRANSACTION;
INSERT INTO asistentes (nombres, edad, capacitacion_idcapacitacion)
VALUES 
    ('asistente_01', 25, 1);

INSERT INTO asistentes (nombres, edad, capacitacion_idcapacitacion)
VALUES 
    ('asistente_02', 30, 1);
COMMIT;

select * from asistentes;


/* consulta 5 */
START TRANSACTION;
UPDATE capacitacion
SET dia = 'Lunes', hora = '10:00', cantidadasistentes='1'
WHERE idcapacitacion=1;

COMMIT;

select * from capacitacion;

/* consulta 6 */
START TRANSACTION;
DELETE FROM asistentes WHERE TRUE;

select * from asistentes;


/* consulta 7 */
ROLLBACK;
select * from asistentes;

COMMIT;

select * from asistentes;
