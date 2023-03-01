DROP DATABASE IF EXISTS m5_abpro_7;
CREATE DATABASE m5_abpro_7 CHARACTER SET utf8mb4;
USE m5_abpro_7;



/* tabla cliente */
create table cliente (
    rut_empresa INT PRIMARY KEY NOT NULL,
    nombres_rep_legal varchar(30) NOT NULL,
    apellidos_rep_legal varchar(30) NOT NULL,
    nombre_empresa varchar(20) NOT NULL,
    telefono varchar(30),
    UNIQUE KEY unique_rut_empresa (rut_empresa)
);

/* tabla visita*/
CREATE TABLE visita (
  idvisita BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  visfecha date NOT NULL,
  vishora date,
  vislugar VARCHAR(50) NOT NULL,
  viscomentarios VARCHAR(250) NOT NULL,
  cliente_rutcliente INT NOT NULL,
  FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rut_empresa)
);


/* tabla checkeo*/
CREATE TABLE checkeo (
  idcheckeo BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  iscomplete BOOLEAN NOT NULL,
  observaciones VARCHAR(500),
  visita_idvisita BIGINT NOT NULL,
  FOREIGN KEY (visita_idvisita) REFERENCES visita(idvisita)
);

/* tabla capacitacion */
create table capacitacion (
    idcapacitacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dia date,
    hora date,
    lugar varchar(50) NOT NULL,
    duracion int NOT NULL,
    cantidadasistentes int,
    cliente_rutcliente INT NOT NULL,
    FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rut_empresa)
);

/* tabla asistentes */
create table asistentes (
    idasistente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombrecompleto varchar(100) NOT NULL,
    edad int NOT NULL,
    email VARCHAR(30) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    capacitacion_idcapacitacion int NOT NULL, 
	FOREIGN KEY (capacitacion_idcapacitacion) REFERENCES capacitacion(idcapacitacion)
);



/* tabla usuario */
CREATE TABLE usuario (
  cliente_rutcliente INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20),
  fecha_nacimiento date,
  rut VARCHAR(20) NOT NULL,
  FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rut_empresa),
  UNIQUE KEY unique_rut_empresa (cliente_rutcliente)
);


drop table usuario;












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




/* update accidente */
CREATE TABLE visita (
  cliente_rutcliente INT PRIMARY KEY NOT NULL,
  visfecha date NOT NULL,
  vishora date,
  vislugar VARCHAR(50) NOT NULL,
  viscomentarios VARCHAR(250) NOT NULL,
  FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente)
);
