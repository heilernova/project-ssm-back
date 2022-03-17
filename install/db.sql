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
    `rule` TINYINT NOT NULL,
    `disable` BIT
);

-- EPS
DROP TABLE if EXISTS `tb_eps`;
CREATE TABLE `tb_eps`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `disable` BIT
);

-- Datos de la personas
DROP TABLE if EXISTS `tb_persons`;
CREATE TABLE `tb_persons`
(
    `dni` VARCHAR(15) PRIMARY KEY,
    `dniType` VARCHAR(5) NOT NULL,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL, -- usuario que lo registro
    `name` VARCHAR(20) NOT NULL,
    `lastName` VARCHAR(20) NOT NULL,
    `cellphone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(150),
    `sex` BIT,
    `birthDate` DATE,
    `address` VARCHAR(50),
    `eps` INT NOT NULL,
    `sisben` BIT,
    `regime` BIT
);

-- Lista de servicios
DROP TABLE if EXISTS `tb_services`;
CREATE TABLE `tb_services`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `description` VARCHAR(50) NOT NULL
);

-- Registro de solicitudes
DROP TABLE if EXISTS `tb_requests`;
CREATE TABLE `tb_requests`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `status` BIT,
    `user` INT NOT NULL,
    `dni` VARCHAR(15) NOT NULL,
    `service` INT,
    `accompaniment` VARCHAR(100) NOT NULL,
    `eps` INT NOT NULL,
    `sisben` BIT,
    `regime` BIT,
    `olderAdult` BIT, -- Adulto mayor
    `disabled` BIT, -- Discapacitado.
    `pregnant` BIT, -- Mujer en gestación
    `womenHeadHousehold` BIT, -- Mujer cabeza de hogar
    `afrodescendent` BIT,
    `lgtbi` BIT,
    `victim` BIT, -- Victima
    `displaced` BIT, -- Desplazado
    `demobilized` BIT, -- desmovilizado
    `reinserted` BIT, -- Reincertado
    `palenRaizan` BIT,
    `roomGintano` BIT,
    `nnaNunaccompaniedAdult` BIT
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

DROP VIEW if EXISTS `vi_requests`;
CREATE VIEW `vi_requests` AS
SELECT 
`t1`.*,
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS `name`,
`t2`.`cellphone`,
`t2`.`email`
FROM `tb_requests` `t1` 
INNER JOIN `tb_persons` `t2` ON `t2`.`dni` = `t1`.`dni`;