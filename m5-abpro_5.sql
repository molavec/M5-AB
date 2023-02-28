
DROP DATABASE IF EXISTS m5_abpro_5;
CREATE DATABASE m5_abpro_5 CHARACTER SET utf8mb4;
USE m5_abpro_5;


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

/* filas tabla capacitacion */
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

/* filas tabla asistentes */
INSERT INTO asistentes (nombres, edad, capacitacion_idcapacitacion)
VALUES 
    ('asistente_01', 25, 1),
    ('asistente_02', 30, 1),
    ('asistente_03', 40, 2),
    ('asistente_04', 35, 2),
    ('asistente_05', 28, 3);

/* consulta 1 */
/* crea tabla cliente */
create table cliente (
    rutcliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombres varchar(30) NOT NULL,
    apellidos varchar(30) NOT NULL,
    telefono varchar(20) NOT NULL,
    afp varchar(30),
    sistemasalud number(2),
    direccion varchar(70),
    comuna varchar(50),
    edad number(3) NOT NULL
);

/* crea tabla accidente */
create table accidente (
    accidenteid number(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dia date,
    hora date,
    lugar varchar(50) NOT NULL,
    origen varchar(100),
    consecuencias varchar(100)
);

