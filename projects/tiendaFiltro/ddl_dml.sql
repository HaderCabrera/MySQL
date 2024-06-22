CREATE DATABASE tiendaonline;
use tiendaonline;

CREATE TABLE  IF NOT EXISTS usuarios(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	correo_electronico VARCHAR(100) UNIQUE NOT NULL,
	fecha_registro DATE NOT NULL,
	CONSTRAINT PK_usuarios PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS pedidos (
	id INT AUTO_INCREMENT,
	id_usuario INT,
	fecha DATE NOT NULL,
	total DECIMAL(10,2) NOT NULL,
	CONSTRAINT PK_pedidos PRIMARY KEY(id),
	CONSTRAINT FK_pedidos_usuarios FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS productos(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	precio DECIMAL(10, 2) NOT NULL,
	descripcion TEXT NOT NULL,
	CONSTRAINT PK_productos PRIMARY KEY(id)
);


CREATE TABLE detallepedidos(
	id_pedido INT,
	id_producto INT,
	cantidad INT NOT NULL,
	precio_unitario DECIMAL(10, 2) NOT NULL,
	CONSTRAINT FK_detallePedido_pedido FOREIGN KEY(id_pedido) REFERENCES pedidos(id),
	CONSTRAINT FK_detallePedido_producto FOREIGN KEY(id_producto) REFERENCES productos(id),
	CONSTRAINT PK_detalle_productos PRIMARY KEY(id_pedido, id_producto)
);

INSERT INTO productos(nombre, precio, descripcion) VALUES
('Iphone 13', 799.99, 'APple Iphone 13 con pantalla de 6.1 pulgadas y camara dual.'),
('Samsung Galaxy S21', 699.99, 'sAMSUNG Galaxy S21 con pantalla de 6.2 pulgadas y camara triple.'),
('Sony WH-1000MXM4', 349.99, 'Auriculares inalambricos SOny con cancelacion de ruido.'),
('MacBook Pro', 1299.99, 'Apple MacBooc Pro con patalla Retina de 13 pulgadas'),
('Dell XPS 13', 999.99, 'Portatil Dell XPS 13 con pantalla de 13.3 pulgadas y procesadores Intel i7.'),
('GoPro HERO9', 399.99, 'Camara de accion GOPro HERO9 con resolucion 5K'),
('Amazon Echo Dot', 49.99, 'ALtavz inteligente Amazon Echo Dot con ALexa.'),
('Kindle Paperwhite', 129.99, 'Amazon Kindle Paperwhite con pantalla de 6 pulgadas y luz ajustable.'),
('Apple Watch Series 7', 399.99, 'ApplE Watch Series 7 con GPS y pantalla Retina siempre activa'),
('Bose QuietComfort 35 II', 299.99, 'Auriculares inalambricos Bose con cancelacion de ruido.'),
('Nintendo Switch', 299.99, 'Consola de videojuegos NIntento Switch con controles Joy-COn.'),
('Fitbit Charge 5', 179.95, 'Monitor de actividad fisica FitBit Charge 5 con GPS y seguimiento del sueño.');

INSERT INTO usuarios(nombre, correo_electronico, fecha_registro) VALUES
('Juan Perez', 'juan.perez@exameple.com','2024-01-01'),
('Maria Lopez','maria.lopez@example2.com','2024-01-05'),
('Carlos Mendoza','carlos.mendoza@example3.com','2024-02-10'),
('Ana Gonzales','ana.gonzales@example4.com','2024-02-20'),
('Luis Torres','luis.torres@example5.com','2024-03-05'),
('Laura Rivera','laura.rivera@example.com','2024-03-15');

INSERT INTO pedidos(id_usuario, fecha, total) VALUES
(1, '2024-02-25', 1049.98),
(2, '2024-03-10', 1349.98),
(3, '2024-03-20', 1249.99),
(4, '2024-03-25', 449.98),
(5, '2024-04-05', 699.99),
(6, '2024-04-10', 399.99);

INSERT INTO detallepedidos(id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1,1,1,799.99),
(1,7,5,49.99),
(2,4,1,1299.99),
(2,8,1,129.99),
(3,2,1,699.99),
(3,9,1,399.99),
(4,5,1,999.99),
(4,10,1,299.99),
(5,11,1,299.99),
(5,3,1,349.99),
(6,6,1,399.99);










