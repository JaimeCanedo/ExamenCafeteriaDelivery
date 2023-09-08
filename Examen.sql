
/*Empresa...idEmpresa,NombreEmpresa, RFC, username, email, contraseña, añoDeConstitucion, fk_ciudad, domicilio;

Repartidor ...idRepartidor , nombre, apellidoPaterno, apellidoMaterno, RFC, email,username, contraseña, telefono , fechaDeNacimiento, fk_ciudad, domicilio;

Alimentos... idAlimentos , nombre, descripcion, precio, cantidad;

Bebidas... idBebida, nombre , descripcion, precio, cantidad;

Ciudad... idCiudad, pais, estado, municipio, nombreCiudad, codigoPostal;

Pedido... idPedido, fecha, estatus, subtotal, fk_idEmpresa, fk_idCliente, fk_idRepartidor, fk_alimentos, fk_idBebida;

Cliente... idCliente, nombre , apellidoPaterno, apellidoMaterno, email, username ,contraseña, telefono, fk_ciudad ,domicilio, fechaDeNacimiento;*/

CREATE TABLE IF NOT EXISTS Usuario (
    idUsuario INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(35) NOT NULL,
    apellido1  VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefono INT(10) NOT NULL UNIQUE,
    fk_ciudad INTEGER NOT NULL,
    domicilio VARCHAR(30) NOT NULL,
    contraseña VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cliente (
    idCliente INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    INE VARCHAR(30) NOT NULL,
    fechaDeNacimiento DATE NOT NULL,
    fk_usuario_clientes INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Repartidor (
    idRepartidor INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    RFC INTEGER(13) NOT NULL,
    fechaDeNacimiento DATE NOT NULL,
    vehiculo VARCHAR(15) ,
    licenciaConducir VARCHAR(30),
    fk_usuario_repartidores INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Empresa (
    IdEmpresa INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombreEmpresa VARCHAR(35) NOT NULL UNIQUE,
    rfc  VARCHAR(13) NOT NULL UNIQUE,
    añoDeConstitucion INTEGER UNSIGNED NOT NULL
);


CREATE TABLE IF NOT EXISTS Tarjeta (
    IdTarjeta INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titular VARCHAR(35) NOT NULL,
    banco  VARCHAR(25) NOT NULL,
    numTarjeta VARCHAR(16) NOT NULL UNIQUE,
    marca VARCHAR(30) NOT NULL,
    fechaVencimiento DATE NOT NULL,
    CCV INT(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS Alimentos (
    idAlimentos INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombreAlimento VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio INTEGER NOT NULL,
    cantidad INT(3) NOT NULL
);

CREATE TABLE IF NOT EXISTS Bebidas (
    idBebidas INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombreBebidas VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio INTEGER NOT NULL,
    cantidad INT(3) NOT NULL
);


CREATE TABLE IF NOT EXISTS Pedidos (
    idPedido INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    fecha TIMESTAMP NOT NULL,
    estatus  VARCHAR(15) NOT NULL,
    subtotal INTEGER NOT NULL,
    fk_idEmpresa INTEGER NOT NULL,
    fk_idCliente INTEGER NOT NULL,
    fk_idRepartidor INTEGER NOT NULL,
    fk_idAlimento INTEGER NOT NULL,
    fk_idBebida INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Ciudad (
    idCiudad INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    pais VARCHAR(30) NOT NULL,
    estado  VARCHAR(30) NOT NULL,
    municipio VARCHAR(30) NOT NULL,
    delegacion VARCHAR(30) NOT NULL,
    codigoPostal INTEGER UNSIGNED NOT NULL 
);

ALTER TABLE Cliente 
ADD (fk_tarjeta INTEGER);

ALTER TABLE Repartidor 
ADD (fk_usuario_repartidores INTEGER, fk_tarjeta INTEGER);

ALTER TABLE Empresa 
ADD (fk_usuario_empresas INTEGER, fk_tarjeta INTEGER);

ALTER TABLE Usuario 
ADD FOREIGN KEY (fk_ciudad) REFERENCES Ciudad(idCiudad);

ALTER TABLE Cliente 
ADD FOREIGN KEY (fk_usuario_clientes) REFERENCES Usuario(idUsuario);

ALTER TABLE Repartidor 
ADD FOREIGN KEY (fk_usuario_repartidores) REFERENCES Usuario(idUsuario);

ALTER TABLE Empresa 
ADD FOREIGN KEY (fk_usuario_empresas) REFERENCES Usuario(idUsuario);

ALTER TABLE PEDIDOS 
ADD FOREIGN KEY (fk_idEmpresa) REFERENCES Empresa(IdEmpresa);

ALTER TABLE PEDIDOS
ADD FOREIGN KEY (fk_idCliente) REFERENCES Cliente(idCliente);

ALTER TABLE PEDIDOS
ADD FOREIGN KEY (fk_idRepartidor) REFERENCES Repartidor(IdRepartidor);

ALTER TABLE PEDIDOS
ADD FOREIGN KEY (fk_idAlimento) REFERENCES Alimentos(idAlimentos);

ALTER TABLE PEDIDOS
ADD FOREIGN KEY (fk_idBebida) REFERENCES Bebidas(idBebidas);

ALTER TABLE Cliente 
ADD FOREIGN KEY (fk_tarjeta) REFERENCES Tarjeta(IdTarjeta);

ALTER TABLE Repartidor
ADD FOREIGN KEY (fk_tarjeta) REFERENCES Tarjeta(IdTarjeta);

ALTER TABLE Empresa 
ADD FOREIGN KEY (fk_tarjeta) REFERENCES Tarjeta(IdTarjeta);

