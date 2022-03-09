-- Registro de usuarios.
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `username` VARCHAR(10) NOT NULL UNIQUE,
    `email` VARCHAR(150) NOT NULL UNIQUE,
    `password` VARCHAR(400) NOT NULL,
    `token` VARCHAR(50) NOT NULL UNIQUE,
    `rule` TINYINT NOT NULL
);

-- EPS
DROP TABLE if EXISTS `tb_ips`;
CREATE TABLE `tb_ips`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

-- Datos de la personas
DROP TABLE if EXISTS `tb_persons`;
CREATE TABLE `tb_persons`
(
    `dni` VARCHAR(15) PRIMARY KEY,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL, -- usuario que lo registro
    `name` VARCHAR(20) NOT NULL,
    `lastName` VARCHAR(20) NOT NULL,
    `cellphone` VARCHAR(20) NOT NULL,
    `sex` BIT,
    `birthDate` DATE,
    `address` VARCHAR(50),
    `eps` INT NOT NULL,
    `sisben` BIT,
    `regime` BIT,
    `lgtbi` BIT,
    `Afrodescendent` BIT,
    `palenRaizan` BIT,
    `roomGintano` BIT,
    `disabled` BIT, -- Discapacitado.
    `pregnant` BIT, -- Mujer en gestación
    `womenHeadHousehold` BIT, -- Mujer cabeza de hogar
    `nnaNunaccompaniedAdult` BIT,
    `victim` BIT, -- Victima
    `displaced` BIT, -- Desplazado
    `demobilized` BIT, -- desmovilizado
    `reinserted` BIT, -- Reincertado
    `olderAdult` BIT -- Adulto mayor
);

-- Lista de servicios
DROP TABLE if EXISTS `services`;
CREATE TABLE `services`
(
    `id` INT PRIMARY AUTO_INCREMENT,
    `description` VARCHAR(50) NOT NULL
);

-- Registro de solicitudes
DROP TABLE if EXISTS `tb_request`;
CREATE TABLE `tb_request`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `status` BIT,
    `user` INT NOT NULL,
    `service` INT,
    `request` VARCHAR(100) NOT NULL,
    `accompaniment` VARCHAR(100) NOT NULL,
    `eps` INT NOT NULL,
    `sisben` BIT,
    `regime` BIT,
    `lgtbi` BIT,
    `Afrodescendent` BIT,
    `palenRaizan` BIT,
    `roomGintano` BIT,
    `disabled` BIT, -- Discapacitado.
    `pregnant` BIT, -- Mujer en gestación
    `womenHeadHousehold` BIT, -- Mujer cabeza de hogar
    `nnaNunaccompaniedAdult` BIT,
    `victim` BIT, -- Victima
    `displaced` BIT, -- Desplazado
    `demobilized` BIT, -- desmovilizado
    `reinserted` BIT, -- Reincertado
    `olderAdult` BIT -- Adulto mayor
);

-- Historial de las observaciones acerca de las solicitudes.
DROP TABLE if EXISTS `tb_request_observations`;
CREATE TABLE `tb_request_observations`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `request` INT NOT NULL,
    `content` VARCHAR(200) NOT NULL
);