
DROP DATABASE IF EXISTS m5_abpro_3;
CREATE DATABASE m5_abpro_3 CHARACTER SET utf8mb4;
USE m5_abpro_3;


/* crea tabla capacitación */
create table capacitacion (
    idcapacitacion INT PRIMARY KEY NOT NULL,
    rutcliente varchar(15) NOT NULL,
    dia varchar(25),
    hora varchar(5),
    lugar varchar(50) NOT NULL,
    duracion int NOT NULL,
    cantidadasistentes int
);

/* crea tabla asistentes */
create table asistentes (
    idasistente INT PRIMARY KEY NOT NULL,
    nombres varchar(100) NOT NULL,
    edad int NOT NULL,
    capacitacion_idcapacitacion int NOT NULL, 
		FOREIGN KEY (capacitacion_idcapacitacion) REFERENCES capacitacion(idcapacitacion)
);

/* consulta 1 */
alter table asistentes modify column idasistente INT AUTO_INCREMENT;


ALTER TABLE asistentes DROP FOREIGN KEY asistentes_ibfk_1;
show columns from asistentes;
show create table asistentes;

alter table capacitacion modify column idcapacitacion INT AUTO_INCREMENT;
ALTER TABLE asistentes 
ADD FOREIGN KEY (capacitacion_idcapacitacion) 
REFERENCES capacitacion(idcapacitacion);

show columns from capacitacion;

/* consulta 2 */

insert into capacitacion (
  rutcliente,
  dia,
  hora,
  lugar,
  duracion,
  cantidadasistentes
  ) 
values 
  ('1-1', 'lunes', '10:00', 'place_01', 60, 3),
	('2-2', 'lunes', '14:30', 'place_02', 120, 5),
	('3-3', 'martes', '11:15', 'place_03', 90, 4);

/* consulta 3 */
INSERT INTO asistentes (nombres, edad, capacitacion_idcapacitacion)
VALUES 
    ('asistente_01', 25, 1),
    ('asistente_02', 30, 1),
    ('asistente_03', 40, 2),
    ('asistente_04', 35, 2),
    ('asistente_05', 28, 3);

/* consulta 4 */
ALTER TABLE asistentes
ADD UNIQUE (nombres);

show create table asistentes;

/* consulta 5 */
ALTER TABLE capacitacion
ALTER dia SET DEFAULT '01/01/2020';
ALTER TABLE capacitacion
ALTER hora SET DEFAULT '00:00';

show create table capacitacion;

/* consulta 6 */
insert into capacitacion (
  rutcliente,
  dia,
  hora,
  lugar,
  duracion,
  cantidadasistentes
  ) 
values 
  ('1-1', 'lunes', '12:00', 'place_01', 60, 0);

DELETE FROM capacitacion
WHERE cantidadasistentes = 0
AND idcapacitacion NOT IN (SELECT capacitacion_idcapacitacion FROM asistentes);

select * from capacitacion;




