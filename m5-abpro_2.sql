/* crea base de datos */
create database M5_ABPRO;

/* crea tabla capacitación */
create table capacitacion (
    idcapacitacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rutcliente varchar(15),
    dia varchar(25),
    hora varchar(5),
    lugar varchar(50),
    duracion int,
    cantidadasistentes int
);

/* crea tabla asistentes */
create table asistentes (
    idasistente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombres varchar(100),
    edad int,
    capacitacion_idcapacitacion int NOT NULL, 
		FOREIGN KEY (capacitacion_idcapacitacion) REFERENCES capacitacion(idcapacitacion)
);


/* inserta filas capacitación */
insert into capacitacion 
	(
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
	('3-3', 'martes', '11:15', 'place_03', 90, 4),
	('4-4', 'miércoles', '15:00', 'place_04', 180, 8),
	('5-5', 'jueves', '09:00', 'place_05', 45, 1),
	('6-6', 'jueves', '16:30', 'place_06', 120, 3);

/* inserta filas en asistentes */
INSERT INTO asistentes (nombres, edad, capacitacion_idcapacitacion)
VALUES 
    ('asistente_01', 25, 1),
    ('asistente_02', 30, 1),
    ('asistente_03', 40, 2),
    ('asistente_04', 35, 2),
    ('asistente_05', 28, 2),
    ('asistente_06', 45, 2),
    ('asistente_07', 23, 3),
    ('asistente_08', 38, 3),
    ('asistente_09', 27, 3),
    ('asistente_10', 42, 3),
    ('asistente_11', 20, 4),
    ('asistente_12', 33, 4),
    ('asistente_13', 29, 4),
    ('asistente_14', 47, 4),
    ('asistente_15', 22, 4),
    ('asistente_16', 31, 4),
    ('asistente_17', 36, 4),
    ('asistente_18', 26, 5),
    ('asistente_19', 41, 6),
    ('asistente_20', 39, 6),
    ('asistente_21', 24, 6);

/* consulta 1 */
select *
from 
	capacitacion
where 
	dia='lunes' and duracion < 90;


/* consulta 2 */
SELECT a.nombres, c.rutcliente, c.lugar, c.duracion
FROM capacitacion c
JOIN asistentes a ON c.idcapacitacion = a.capacitacion_idcapacitacion;


/* consulta 3 */
SELECT c.rutcliente, c.dia, c.hora
FROM capacitacion c
WHERE 
	c.cantidadasistentes != (
		SELECT COUNT(*) 
		FROM asistentes a 
		WHERE a.capacitacion_idcapacitacion = c.idcapacitacion
	);


/* consulta 4 */
SELECT c.lugar, c.duracion, c.dia, c.hora
FROM capacitacion c
WHERE 
	(
		SELECT 
			COUNT(*) FROM asistentes a 
		WHERE 
			a.capacitacion_idcapacitacion = c.idcapacitacion
	) > 3;
