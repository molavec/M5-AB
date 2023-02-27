/* crea base de datos */
create database M5_ABPRO;

/* crea tabla capacitación */
create table capacitacion (
    id INT PRIMARY KEY,
    rut varchar(15),
    date varchar(10),
    time varchar(5),
    place varchar(50),
    time_length int,
    assistants int
);

/* crea ajusta auto increment */
ALTER TABLE capacitacion
  MODIFY id int NOT NULL AUTO_INCREMENT;


/* inserta filas */
insert into capacitacion 
	(rut, date, time, place, time_length, assistants)
values
	('1-1', 'lunes', '8:00', 'place_01', 120, 10),
	('2-2', 'martes', '8:00', 'place_02', 120, 10),
	('3-3', 'miercóles', '8:00', 'place_03', 120, 10),
	('4-4', 'jueves', '8:00', 'place_04', 120, 10),
	('5-5', 'viernes', '8:00', 'place_05', 120, 10),
	('6-6', 'sábado', '8:00', 'place_06', 120, 10),
	('7-7', 'lunes', '8:00', 'place_07', 120, 10),
	('8-8', 'martes', '8:00', 'place_08', 120, 10),
	('9-9', 'miércoles', '8:00', 'place_09', 120, 10),
	('10-1', 'jueves', '8:00', 'place_10', 120, 10)
	;



/* inserta filas para los siguiente ejercicios */
insert into capacitacion 
	(rut, date, time, place, time_length, assistants)
values
	('11-1', 'lunes', '10:00', 'place_01', 120, 35),
	('12-2', 'martes', '10:00', 'place_02', 120, 40),
	('13-3', 'miercóles', '10:00', 'place_03', 120, 45),
	('14-4', 'jueves', '10:00', 'place_04', 120, 55);


/* consulta 1 */
select id, time, date, rut  
from capacitacion;


/* consulta 2 */
select *  
from capacitacion
where
	time_length >= 60 AND assistants > 30;



/* consulta 3 */
insert into capacitacion 
	(rut, date, time, place, time_length, assistants)
values
	('1-9', 'lunes', '14:00', 'place_01', 120, 85),
	('1-9', 'martes', '14:00', 'La Florida', 120, 60),
	('2-7', 'miercóles', '14:00', 'place_03', 120, 45),
	('2-7', 'jueves', '14:00', 'La Florida', 120, 55);


select assistants, time_length, place, time, date, rut 
from capacitacion
where
	rut="1-9" and place="La Florida" 
  OR 
  rut="2-7" and place="La Florida";


/* consulta 4 */

insert into capacitacion 
	(rut, date, time, place, time_length, assistants)
values
	('4-4', 'lunes', '16:00', 'place_01', 120, 5),
	('4-4', 'jueves', '16:00', 'La Florida', 120, 6);

select * 
from capacitacion
where
	time_length > 30 and time_length < 120 
  OR 
  assistants < 10;


/* consulta 5 */
select *
from capacitacion
where 
	date='lunes' and assistants > 50
	or
	date='martes' and assistants > 50
	or
	date='miércoles' and assistants > 50;
