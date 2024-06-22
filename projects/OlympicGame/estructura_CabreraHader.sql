create database polideportivos;
use polideportivos;

create table deportes (
	id_deporte int primary key,
    nombre varchar(100) not null,
    num_jugadores int not null
);

create table jefes (
	id_jefe int primary key,
    nombre varchar(100) not null,
    email varchar(100) not null,
    titulo varchar(100) not null
);

create table equipamiento (
	id_equipamiento int primary key,
    nombre_equipos varchar(100) not null,
    stock int not null
);

create table comisario (
	id_comisario int primary key,
    nombre varchar(100) not null,
    email varchar(100) not null,
    telefono varchar(20) not null,
    tipo enum('juez','observador')
);

create table info_complejo (
	id_complejo int primary key,
    locacion varchar(100) not null,
    area_complejo float not null,
    id_jefe int,
    foreign key(id_jefe) references jefes(id_jefe)
);

create TABLE complejo_polideportivo(
	id_complejo_polideportivo int primary key,
    nombre varchar(100) not null,
    id_deporte int,
    id_info_complejo int,
	foreign key(id_deporte) references deportes(id_deporte),
	foreign key(id_info_complejo) references info_complejo(id_complejo)
);

CREATE TABLE complejo_deportivo (
	id_complejo_deportivo int primary key,
    nombre varchar(100) not null,
    id_deporte int,
    id_info_complejo int,
    foreign key(id_deporte) references deportes(id_deporte),
	foreign key(id_info_complejo) references info_complejo(id_complejo)
);

CREATE TABLE eventos(
	id_evento int primary key,
    nombre varchar(100) not null,
    fecha datetime not null,
    duracion time not null,
    num_participantes int not null
);

CREATE TABLE evento_complejo_poli(
	id_evento_complejo int,
    id_evento int,
    id_complejo int,
    foreign key(id_evento) references eventos(id_evento),
    foreign key(id_complejo) references complejo_polideportivo(id_complejo_polideportivo),
	primary key(id_evento_complejo, id_evento, id_complejo)
);

drop table evento_complejo_poli;

CREATE TABLE evento_complejo_deportivo (
	id_evento_complejo_deportivo int,
    id_evento int,
    id_complejo int,
	foreign key(id_evento) references eventos(id_evento),
	foreign key(id_complejo) references complejo_deportivo(id_complejo_deportivo),
	primary key(id_evento_complejo_deportivo, id_evento, id_complejo)
);

CREATE TABLE evento_comisario(
	id_evento_comisario int,
    id_evento int,
    id_comisario int,
	foreign key(id_evento) references eventos(id_evento),
	foreign key(id_comisario) references comisario(id_comisario),
	primary key(id_evento_comisario, id_evento, id_comisario)
);

CREATE TABLE evento_equipo(
	id_evento_equipo int,
	id_evento int,
    id_equipamiento int,
	foreign key(id_evento) references eventos(id_evento),
	foreign key(id_equipamiento) references equipamiento(id_equipamiento),
	primary key(id_evento_equipo, id_evento, id_equipamiento)
);

CREATE TABLE sede(
	id_sede int primary key,
    nombre varchar(100) not null,
    id_complejo int,
    presupuesto float not null,
    foreign key(id_complejo) references complejo_polideportivo(id_complejo_polideportivo)
);




SELECT * FROM complejo_polideportivo;