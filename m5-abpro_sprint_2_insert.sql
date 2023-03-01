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

/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();


/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();

/* datos tabla cliente */
INSERT Into cliente () VALUES ();