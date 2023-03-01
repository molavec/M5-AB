DROP DATABASE IF EXISTS m5_abpro_sprint;
CREATE DATABASE m5_abpro_sprint CHARACTER SET utf8mb4;
USE m5_abpro_sprint;


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


/* update visita */
CREATE TABLE visita (
  idvisita BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  visfecha date NOT NULL,
  vishora date,
  vislugar VARCHAR(50) NOT NULL,
  viscomentarios VARCHAR(250) NOT NULL,
  cliente_rutcliente INT NOT NULL,
  FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente)
);


/* SPRINT - PARTE 1: tablas ejercicios anteiores */

/* tabla checkeo*/
CREATE TABLE chequeo (
  idcheckeo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL
);

CREATE TABLE visita_chequeo (
  id_visita_chequeo BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  iscomplete BOOLEAN NOT NULL,
  observaciones VARCHAR(500),
  chequeo_idcheckeo INT NOT NULL,
  visita_idvisita BIGINT NOT NULL,
  FOREIGN KEY (chequeo_idcheckeo) REFERENCES chequeo(idcheckeo),
  FOREIGN KEY (visita_idvisita) REFERENCES visita(idvisita)
);

/* tabla usuario */
CREATE TABLE usuario (
  idusuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20),
  fecha_nacimiento date,
  rut VARCHAR(20) NOT NULL,
  cliente_rutcliente INT NOT NULL,
  FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente)
);



/* tabla administrativo */
CREATE TABLE administrativo (
  rut_administrativo INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20),
  email VARCHAR(20),
  area VARCHAR(20),
  usuario_idusuario INT NOT NULL,
  FOREIGN KEY (usuario_idusuario) REFERENCES usuario(idusuario)
);



/* tabla profesional */
CREATE TABLE profesional (
  rut_profesional INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20),
  telefono VARCHAR(20),
  titulo VARCHAR(20),
  proyecto VARCHAR(20),
  usuario_idusuario INT NOT NULL,
  FOREIGN KEY (usuario_idusuario) REFERENCES usuario(idusuario)
);

/* SPRINT - PARTE 2: nuevas tablas */

/* tabla pago */
CREATE TABLE pago (
  idpago INT PRIMARY KEY NOT NULL,
  fecha date NOT NULL,
  monto INT NOT NULL,
  mes date NOT NULL,
  anio date NOT NULL,
  cliente_rutcliente INT NOT NULL,
  FOREIGN KEY (cliente_rutcliente) REFERENCES cliente(rutcliente)
);

/* tabla asesoria */
CREATE TABLE asesoria (
  idasesoria INT PRIMARY KEY NOT NULL,
  fecha_realizacion date NOT NULL,
  motivo VARCHAR(120) NOT NULL,
  profesional_rut_profesional INT NOT NULL,
  FOREIGN KEY (profesional_rut_profesional) REFERENCES profesional(rut_profesional)
);

/* tabla actividad */
CREATE TABLE actividad (
  idactividad INT PRIMARY KEY NOT NULL,
  titulo VARCHAR(120) NOT NULL,
  descripcion VARCHAR(250) NOT NULL,
  plazo INT NOT NULL,
  asesoria_idasesoria INT NOT NULL,
  FOREIGN KEY (asesoria_idasesoria) REFERENCES asesoria(idasesoria)
);


/* SPRINT - PARTE 3: Llenado de datos */




/* SPRINT - PARTE 4: Consultas */


/* consulta 1 */

/* consulta 2 */


/* consulta 3 */