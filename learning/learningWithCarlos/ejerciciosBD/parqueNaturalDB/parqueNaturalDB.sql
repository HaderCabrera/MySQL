show databases;

create database parquesNaturales;
use parquesNaturales;

show tables;


create table if not exists tipoEspecie(
    id_tipoEspecie INT  primary key AUTO_INCREMENT,
    descripcion varchar(200) not null
);
    

create table if not exists parqueNatural(
    id_parque INT  primary key AUTO_INCREMENT,
    name_parque varchar(100) not null,
    fapertura_ruta DATETIME not null
);


create table if not exists entidad(
    id_entidad INT  primary key AUTO_INCREMENT,
    name_entidad varchar(100) not null
);


create table if not exists departamento(
    id_dept INT  AUTO_INCREMENT,
    name_dept varchar(100) not null,
    id_entidad INT,
    primary key(id_dept, id_entidad),
	foreign key (id_entidad) references entidad(id_entidad)
);

CREATE TABLE IF NOT EXISTS parquesDepartamento(
	id_parquesDepartamento INT,
	id_dept INT,
	id_parque INT,
	primary key(id_parquesDepartamento, id_dept, id_parque),
	foreign key (id_dept) references departamento(id_dept),
	foreign key (id_parque) references parqueNatural(id_parque)
);

create table if not exists areaParque(
    id_areaParque INT  AUTO_INCREMENT,
    name_area varchar(100) not null,
    extension_area DOUBLE NOT NULL,
    id_parque INT,
    primary key(id_areaParque, id_parque),
	foreign key (id_parque) references parqueNatural(id_parque)
);

create table if not exists especie(
    id_especie INT  AUTO_INCREMENT,
    name_cientifico varchar(100) not null,
    name_vulgar varchar(100) NOT NULL,
    poblacion_especie INT NOT NULL,
    id_tipoEspecie INT,
    id_areaParque INT,
    primary key(id_especie, id_tipoEspecie, id_areaParque),
	foreign key (id_tipoEspecie) references tipoEspecie(id_tipoEspecie),
	foreign key (id_areaParque) references areaParque(id_areaParque)
);

create table if not exists trabajador(
    id_trab INT  AUTO_INCREMENT,
    name_trab varchar(45)  null,
    cedula_trab INT NOT NULL,
    direccion_trab VARCHAR(45)  NULL,
    sueldo DOUBLE NULL,
    id_parque INT,
    primary key(id_trab, id_parque),
	foreign key (id_trab) references parqueNatural(id_parque)
);

create table if not exists telefono(
    id_telf INT  AUTO_INCREMENT,
    num_fijo INT NOT NULL,
    num_movil INT NOT NULL,
    id_trab INT,
    primary key(id_telf, id_trab),
	foreign key (id_trab) references trabajador(id_trab)
);

create table if not exists gestion_trabajador(
    id_gestionTrabajador INT  AUTO_INCREMENT,
    int_parque VARCHAR(45) NOT NULL,
    id_trab INT,
    id_areaParque INT,
    primary key(id_gestionTrabajador, id_trab, id_areaParque),
	foreign key (id_trab) references trabajador(id_trab),
	foreign key (id_areaParque) references areaParque(id_areaParque)
);

create table if not exists entrada(
    id_entrada INT  AUTO_INCREMENT,
    num_entrada INT NOT NULL,
    ubicacion VARCHAR(45),
    id_trab INT,
    primary key(id_entrada, id_trab),
	foreign key (id_trab) references parqueNatural(id_parque)
);


SHOW TABLES;

/*INSERTS*/

INSERT INTO tipoEspecie (descripcion) VALUES
('Mamíferos'),
('Aves'),
('Reptiles'),
('Anfibios'),
('Peces'),
('Invertebrados'),
('Plantas'),
('Hongos'),
('Algas'),
('Musgos'),
('Líquenes'),
('Árboles'),
('Hierbas'),
('Flores'),
('Helechos'),
('Cactus'),
('Bromelias'),
('Orquídeas'),
('Rosas'),
('Lirios'),
('Girasoles'),
('Margaritas'),
('Tulipanes'),
('Camelias'),
('Peonías'),
('Azaleas'),
('Hortensias'),
('Bambúes'),
('Robles'),
('Pinos'),
('Cedros'),
('Secoyas'),
('Palmas'),
('Coquitos'),
('Cerezos'),
('Manzanos'),
('Naranjos'),
('Limones'),
('Paltas'),
('Fresas'),
('Bananas'),
('Mangos'),
('Uvas'),
('Sandías'),
('Melones'),
('Piñas'),
('Kiwis'),
('Granadas'),
('Moras'),
('Frambuesas');

INSERT INTO parqueNatural (name_parque, fapertura_ruta) VALUES
('Parque Nacional Natural Tayrona', '2023-06-12 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2022-11-25 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-04-18 07:45:00'),
('Parque Nacional Natural Cocuy', '2022-12-05 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2023-09-08 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-03-20 09:00:00'),
('Parque Nacional Natural Gorgona', '2022-10-30 08:45:00'),
('Parque Nacional Natural Utría', '2023-07-17 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-05-22 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-01-14 07:30:00'),
('Parque Nacional Natural Tayrona', '2022-11-12 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-08-25 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-03-28 07:45:00'),
('Parque Nacional Natural Cocuy', '2023-10-05 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2022-12-18 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-07-30 09:00:00'),
('Parque Nacional Natural Gorgona', '2023-05-14 08:45:00'),
('Parque Nacional Natural Utría', '2022-09-07 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-02-19 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-11-02 07:30:00'),
('Parque Nacional Natural Tayrona', '2023-12-10 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-06-22 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-01-18 07:45:00'),
('Parque Nacional Natural Cocuy', '2023-09-15 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2022-10-28 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-08-03 09:00:00'),
('Parque Nacional Natural Gorgona', '2022-12-27 08:45:00'),
('Parque Nacional Natural Utría', '2022-05-11 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-03-24 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-02-06 07:30:00'),
('Parque Nacional Natural Tayrona', '2023-05-14 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-02-16 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-10-25 07:45:00'),
('Parque Nacional Natural Cocuy', '2022-08-28 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2023-07-01 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-04-13 09:00:00'),
('Parque Nacional Natural Gorgona', '2023-11-30 08:45:00'),
('Parque Nacional Natural Utría', '2023-01-05 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2022-06-08 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-09-19 07:30:00'),
('Parque Nacional Natural Tayrona', '2022-10-02 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-12-04 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-07-28 07:45:00'),
('Parque Nacional Natural Cocuy', '2023-04-01 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2023-01-15 08:30:00'),
('Parque Nacional Natural El Tuparro', '2022-11-21 09:00:00'),
('Parque Nacional Natural Gorgona', '2023-09-24 08:45:00'),
('Parque Nacional Natural Utría', '2023-06-10 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-02-15 09:15:00'),
('Parque Nacional Natural Amacayacu', '2022-12-12 07:30:00');

INSERT INTO entidad (name_entidad) VALUES
('Entidad A'),
('Entidad B'),
('Entidad C'),
('Entidad D'),
('Entidad E');
