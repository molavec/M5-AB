/* SPRINT - PARTE 3: Llenado de datos */
USE m5_abpro_sprint;

/* datos tabla cliente */
INSERT Into cliente (
  rutcliente,
  clinombres,
  cliapellidos,
  clitelefono,
  cliafp,
  clisistemasalud,
  clidireccion,
  clicomuna,
  cliedad
) VALUES 
(111, 'nombre_01', 'apellido_01', '1111111', 'afp_01', 1, 'direccion_01', 'comuna_01', 11),
(222, 'nombre_02', 'apellido_02', '2222222', 'afp_02', 2, 'direccion_02', 'comuna_02', 22),
(333, 'nombre_03', 'apellido_03', '3333333', 'afp_03', 2, 'direccion_03', 'comuna_03', 33);

/* datos tabla pago */
INSERT Into pago (
  idpago,
  fecha,
  monto,
  mes,
  anio,
  cliente_rutcliente
) VALUES 
(1, STR_TO_DATE('01/01/2023', '%d/%m/%Y'), 100000, 1, 2023, 111),
(2, STR_TO_DATE('02/02/2023', '%d/%m/%Y'), 200000, 2, 2023, 222),
(3, STR_TO_DATE('03/03/2023', '%d/%m/%Y'), 300000, 3, 2023, 333);

/* datos tabla accidente */
INSERT Into accidente (
  accifecha,
  accihora,
  accilugar,
  acciorigen,
  acciconsecuencias,
  cliente_rutcliente
) 
VALUES 
  ( STR_TO_DATE('01/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_01', 'origen_01', 'consecuencias_01', 111),
  ( STR_TO_DATE('02/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_02', 'origen_02', 'consecuencias_02', 222),
  ( STR_TO_DATE('03/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_03', 'origen_03', 'consecuencias_03', 333);  

/* datos tabla visita */
INSERT INTO visita
 (
  visfecha, 
  vishora, 
  vislugar, 
  viscomentarios, 
  cliente_rutcliente
)
VALUES 
(STR_TO_DATE('01/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_01', 'viscomentarios_01', 111),
(STR_TO_DATE('01/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_02', 'viscomentarios_02', 222),
(STR_TO_DATE('01/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_03', 'viscomentarios_03', 333);


/* datos tabla chequeo */
INSERT Into chequeo (
  nombre
) VALUES 
('chequeo_01'),
('chequeo_02'),
('chequeo_03');

/* datos tabla visita_chequeo */
INSERT Into visita_chequeo (
  iscomplete,
  observaciones,
  chequeo_idcheckeo,
  visita_idvisita
) VALUES 
(true, 'observaciones_01', 1, 1),
(true, 'observaciones_02', 2, 2),
(true, 'observaciones_02', 3, 3);

/* datos tabla capacitacion */
INSERT Into capacitacion (
  capfecha,
  caphora,
  caplugar,
  capduracion,
  cantidadasistentes,
  cliente_rutcliente
) VALUES 
  (STR_TO_DATE('01/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_01', 60, 10, 111),
  (STR_TO_DATE('02/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_02', 60, 10, 222),
  (STR_TO_DATE('03/01/2023', '%d/%m/%Y'), STR_TO_DATE('10:00', '%H:%i'), 'lugar_03', 60, 10, 333);


/* datos tabla asistentes */
show create table asistentes;
INSERT Into asistentes (
  asistnombrecompleto,
  asistedad,
  capacitacion_idcapacitacion,
  asistcorreo,
  asisttelefono
) VALUES 
  ('asistente_01', 11, 1, 'correo_01', 'telefono_01'),
  ('asistente_02', 22, 2, 'correo_02', 'telefono_02'),
  ('asistente_03', 33, 3, 'correo_03', 'telefono_03');

/* datos tabla usuario */
INSERT Into usuario (
  nombre,
  apellido,
  fecha_nacimiento,
  rut,
  cliente_rutcliente
) 
VALUES 
  ('nombre_01', 'apellido_01', STR_TO_DATE('01/01/1981', '%d/%m/%Y'), '1111', 111),
  ('nombre_02', 'apellido_02', STR_TO_DATE('02/02/2982', '%d/%m/%Y'), '2222', 222),
  ('nombre_03', 'apellido_03', STR_TO_DATE('03/03/3983', '%d/%m/%Y'), '3333', 333);


/* datos tabla administrativo */
INSERT Into administrativo (
  rut_administrativo,
  nombre,
  apellido,
  email,
  area,
  usuario_idusuario
) VALUES 
  (1111, 'nombre_01', 'apellido_01', 'email_01', 'area_01', 1),
  (2222, 'nombre_02', 'apellido_02', 'email_02', 'area_02', 2),
  (3333, 'nombre_03', 'apellido_03', 'email_03', 'area_03', 3);

/* datos tabla profesional */
INSERT Into profesional (
  rut_profesional,
  nombre,
  apellido,
  telefono,
  titulo,
  proyecto,
  usuario_idusuario
) VALUES 
  (1111, 'nombre_01', 'apellido_01', 'telefono_01', 'titulo_01', 'proecto_01', 1),
  (2222, 'nombre_02', 'apellido_02', 'telefono_02', 'titulo_02', 'proecto_02', 2),
  (3333, 'nombre_03', 'apellido_03', 'telefono_03', 'titulo_03', 'proecto_03', 3);

/* datos tabla asesoria */

INSERT Into asesoria (
  `idasesoria`,
  `fecha_realizacion`,
  `motivo`,
  `profesional_rut_profesional`
) VALUES 
  (1, STR_TO_DATE('01/01/2023', '%d/%m/%Y'), 'motivo_01', 1111),
  (2, STR_TO_DATE('02/02/2023', '%d/%m/%Y'), 'motivo_02', 2222),
  (3, STR_TO_DATE('03/03/2023', '%d/%m/%Y'), 'motivo_03', 3333);


/* datos tabla actividad */
INSERT Into actividad (
  idactividad,
  titulo,
  descripcion,
  plazo,
  asesoria_idasesoria
) VALUES 
( 1, 'titulo_01', 'descripcion_01', 1, 1),
( 2, 'titulo_02', 'descripcion_02', 2, 2),
( 3, 'titulo_03', 'descripcion_03', 3, 3);