/* SPRINT - PARTE 4: Consultas */


/* consulta 1 */
show create table cliente;
show create table capacitacion;
show create table asistentes;

select * from cliente;
select * from capacitacion;
select * from asistentes;

SELECT 
  asist.asistnombrecompleto AS Nombre_Completo,
  cli.cliedad AS Edad,
  asist.asistcorreo AS Correo_Electronico
FROM cliente cli
JOIN capacitacion cap ON cli.rutcliente = cap.cliente_rutcliente
JOIN asistentes asist ON cap.idcapacitacion = asist.capacitacion_idcapacitacion;



/* consulta 2 */


/* consulta 3 */