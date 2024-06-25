CREATE DATABASE plumbing;
USE plumbing;
CREATE TABLE clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono VARCHAR(15) NOT NULL
);

CREATE TABLE servicios(
id INT AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL ,
descripcion VARCHAR(255) NOT NULL,
precio DOUBLE NOT NULL
);

CREATE TABLE plomeros(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL
);

CREATE TABLE facturas(
id INT AUTO_INCREMENT PRIMARY KEY,
cliente_id INT NOT NULL,
servicio_id INT NOT NULL,
plomero_id INT NOT NULL,
fecha DATE NOT NULL,
total DOUBLE NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES clientes(id) ,
FOREIGN KEY (servicio_id)  REFERENCES servicios(id),
FOREIGN KEY (plomero_id) REFERENCES plomeros(id)
);

CREATE TABLE descuentos(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
factura_id INT NOT NULL,
monto DECIMAL NOT NULL,
FOREIGN KEY (factura_id) REFERENCES facturas(id)
);

CREATE TABLE auditoria(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
tabla VARCHAR(50) NOT NULL,
accion VARCHAR(50) NOT NULL,
fecha DATE NOT NULL
);

ALTER TABLE auditoria
ADD COLUMN cliente_id INT NOT NULL,
ADD COLUMN  servicio_id INT NOT NULL,
ADD COLUMN  plomero_id INT NOT NULL,
ADD COLUMN  factura_id INT NOT NULL,
ADD COLUMN  descuento_id INT NOT NULL;

ALTER TABLE auditoria 
ADD CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id),
ADD CONSTRAINT servicio_id FOREIGN KEY (servicio_id) REFERENCES servicios(id),
ADD CONSTRAINT plomero_id FOREIGN KEY (plomero_id) REFERENCES plomeros(id),
ADD CONSTRAINT factura_id FOREIGN KEY (factura_id) REFERENCES facturas(id),
ADD CONSTRAINT descuento_id FOREIGN KEY (descuento_id) REFERENCES descuentos(id);

ALTER TABLE clientes ADD COLUMN direccion VARCHAR(255) NOT NULL;

SELECT * FROM clientes;

ALTER TABLE servicios ADD COLUMN fecha DATE NOT NULL;

SELECT * FROM servicios;

ALTER TABLE plomeros ADD COLUMN direccion VARCHAR(255);

ALTER TABLE facturas ADD COLUMN direccion VARCHAR(255);

CREATE TABLE pagos (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
factura_id INT NOT NULL,
FOREIGN KEY (factura_id) REFERENCES facturas(id)
);

ALTER TABLE auditoria  DROP FOREIGN KEY descuento_id;

ALTER TABLE auditoria DROP COLUMN descuento_id;
