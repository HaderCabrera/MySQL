
create table if not exists tipoPersona(
    idTipo INT  primary key AUTO_INCREMENT,
    cargo varchar(50) not null
);

create table if not exists Persona(
    idPersona INT(1000)  primary key AUTO_INCREMENT,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    fNacimiento DATA NOT NULL,
    email VARCHAR(50),
    numContacto VARCHAR(20),
    cedula VARCHAR(15) NOT NULL,
    edad INT(2),
    genero VARCHAR(15) NOT NULL,
    idTipo INT,
	primary key(idPersona, idTipo),
	foreign key (idTipo) references tipoPersona(idTipo),  
);

use campusEdu;
show tables;