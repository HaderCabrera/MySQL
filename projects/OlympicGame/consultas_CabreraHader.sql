/*CONSULTAS*/

-- 1. Consulta de Todos los Eventos en un Complejo Deportivo Específico.
select C.nombre as 'compleDeportivo', E.id_evento_complejo_deportivo as codEvento
from evento_complejo_deportivo as E
inner join complejo_deportivo as C 
ON E.id_evento_complejo_deportivo = C.id_complejo_deportivo
WHERE C.nombre = 'Complejo Deportivo Giron';

-- 2. Consulta de Comisarios Asignados a un Evento en Particular.
SELECT E.nombre as 'Comisionarios', EC.id_evento as codEvento
FROM evento_comisario as EC
inner join comisario as E ON EC.id_comisario = E.id_comisario
where EC.id_evento = 'Torneo de Natacion' or EC.id_evento = 4;

-- 3. Consulta de Todos los Eventos en un Rango de Fechas.
SELECT *
FROM eventos as E
where E.fecha > '2023-10-04 10:00:00' and E.fecha <'2024-01-04 10:00:00';

-- 4. Consulta del Número Total de Comisarios Asignados a Eventos.
SELECT count(EC.id_comisario)
FROM evento_comisario as EC;

-- 5. Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.
select CD.nombre as Complejo, IC.area_complejo as areaComplejo
FROM info_complejo IC
INNER JOIN complejo_deportivo as CD ON IC.id_complejo = CD.id_complejo_deportivo
WHERE  IC.area_complejo > 14.1;

-- 6. Consulta de Eventos con Número de Participantes Mayor que la Media.
SELECT E.num_participantes as numParticipantes, E.nombre as torneo
FROM eventos as E
where E.num_participantes > (
	SELECT avg(EE.num_participantes)
    FROM eventos as EE
);

-- 7. Consulta de Equipamiento Necesario para un Evento Específico.
SELECT EQ.nombre_equipos as equipo, EQ.stock as cantidad, EE.id_evento as evento
FROM equipamiento as EQ
inner join evento_equipo as EE ON EQ.id_equipamiento = EE.id_equipamiento
WHERE EE.id_evento = 1;

-- 8. Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.


-- 9. Consulta de Complejos Polideportivos sin Eventos Celebrados.
SELECT CD.nombre as 'complejos sin eventos'
FROM complejo_polideportivo CD
LEFT JOIN evento_complejo_poli as ECD ON CD.id_complejo_polideportivo = ECD.id_complejo
where ECD.id_complejo IS NULL;

-- 10. Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.
select *
from comisario as C
where C.tipo = 'juez';




