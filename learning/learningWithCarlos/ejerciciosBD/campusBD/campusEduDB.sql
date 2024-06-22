show databases;

create database campusEdu;
use campusEdu;

show tables;


create table if not exists trainer(
    id_trainer INT  primary key AUTO_INCREMENT,
    name_trainer varchar(100) not null,
    espec_trainer varchar(100) not null
);
    

create table if not exists ruta(
    id_ruta INT  primary key AUTO_INCREMENT,
    name_ruta varchar(100) not null,
    duracion_ruta INT not null
);
    
create table if not exists materia(
    id_materia INT  primary key AUTO_INCREMENT,
    name_materia varchar(100) not null,
    desc_materia TEXT null,
    h_inicio TIME NOT NULL,
    h_fin TIME NOT NULL
);
 /*AGREUE HORARIO COMO UN CAMPO EN LA TABLA DE MATERIA PORQUE YA CON
  * LA TABLA DE DISPONIBILIDAD SE PUEDE CONSULTAR LOS SALES Y HORARIOS DISPONIBLES 
  * Y COLOCARLOS EN LAS MATERIAS ASIGNADAS A LA RUTA*/ 

CREATE TABLE IF NOT EXISTS rutaMateria_modulo(
	id_ruta INT,
	id_materia INT,
	primary key(id_ruta, id_materia),
	foreign key (id_ruta) references ruta(id_ruta),
	foreign key (id_materia) references materia(id_materia)
); 

create table if not exists jornada(
    id_jornada INT  primary key AUTO_INCREMENT,
    name_jornada varchar(100) not null,
    desc_materia TEXT not null
);
   

create table if not exists aula(
    id_aula INT  primary key AUTO_INCREMENT,
    name_aula varchar(100) not null,
    ubic_aula TEXT not null
);

CREATE TABLE IF NOT EXISTS horarioAulas_disponibilidad(
	id_jornada INT,
	id_aula INT,
	primary key(id_jornada, id_aula),
	foreign key (id_jornada) references jornada(id_jornada),
	foreign key (id_aula) references aula(id_aula),
	h_inicio TIME NOT NULL,
	h_fin TIME NOT NULL,
	disponibilidad BOOL NOT NULL
);

describe grupo;

CREATE TABLE IF NOT EXISTS grupo(
	id_grupo INT AUTO_INCREMENT,
	name_grupo VARCHAR(50) NOT NULL,
	id_aula INT,
	id_ruta INT,
	id_jornada int,
	id_trainer int,
	primary key(id_grupo, id_aula, id_ruta, id_jornada, id_trainer),
	foreign key (id_aula) references aula(id_aula),
	foreign key (id_ruta) references ruta(id_ruta),
	foreign key (id_jornada) references jornada(id_jornada),
	foreign key (id_trainer) references trainer(id_trainer)
);

create table if not exists camper(
    id_camper INT  AUTO_INCREMENT,
    nom_camper VARCHAR(100) NOT NULL,
    email_camper VARCHAR(100) NOT NULL,
    id_grupo INT,
	primary key(id_camper, id_grupo),
	foreign key (id_grupo) references grupo(id_grupo)
);


select * from trainer;

describe ruta;




