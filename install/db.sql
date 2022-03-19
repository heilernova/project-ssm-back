SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitamos las llaves foraneas

-- Registro de usuarios.
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `dni` VARCHAR(15) NOT NULL UNIQUE,
    `name` VARCHAR(20) NOT NULL,
    `lastName` VARCHAR(20) NOT NULL,
    `username` VARCHAR(10) NOT NULL UNIQUE,
    `email` VARCHAR(150) NOT NULL UNIQUE,
    `password` VARCHAR(400) NOT NULL,
    `token` VARCHAR(50) NOT NULL UNIQUE,
    `rule` TINYINT NOT NULL,
    `disable` BIT
);

-- Insertamos el primero usuario
INSERT INTO `tb_users`
VALUES(1, NOW(),'1007244088', 'HEILER', 'NOVA', 'HEILERNOVA', 'HEILERNOVA@GMAIL.COM', '$2y$04$A8dGLVylvwo/0eLebRIam.jJ6xLqfrnMKay2m1xB7cmptEYAyGp9.', '', '1', 0);

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
    `dni` VARCHAR(15),
    `dniType` VARCHAR(5) NOT NULL,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `name` VARCHAR(20) NOT NULL,
    `lastName` VARCHAR(20) NOT NULL,
    `cellphone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(150),
    `sex` BIT,
    `birthDate` DATE,
    `address` VARCHAR(50),
    `eps` INT NOT NULL,
    `sisben` BIT,
    `regime` BIT,
    INDEX `index_eps` (`eps`),
    CONSTRAINT `fk_persons_eps` FOREIGN KEY(`eps`) REFERENCES `tb_eps`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (`dni`)
);


-- Lista de servicios
DROP TABLE if EXISTS `tb_requests_services`;
CREATE TABLE `tb_requests_services`
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
    `nnaNunaccompaniedAdult` BIT,
    INDEX `index_user` (`user`),
    INDEX `index_service` (`service`),
    INDEX `index_eps` (`eps`),
    CONSTRAINT `fk_req_users` FOREIGN KEY (`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_req_service` FOREIGN KEY (`service`) REFERENCES `tb_requests_services`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_req_eps` FOREIGN KEY (`eps`) REFERENCES `tb_eps`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Historial de las observaciones acerca de las solicitudes.
DROP TABLE if EXISTS `tb_request_observations`;
CREATE TABLE `tb_request_observations`
(
    `id` INT AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `request` INT NOT NULL,
    `content` VARCHAR(200) NOT NULL,
    INDEX `index_request` (`request`),
    INDEX `index_user` (`user`),
    CONSTRAINT `fk_bservations_req`  FOREIGN KEY(`request`) REFERENCES `tb_requests`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_observations_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (`id`)
);

-- ALTER TABLE `tb_request_observations` ADD FOREIGN KEY(`request`) REFERENCES `persons`(`dni`);

DROP VIEW if EXISTS `vi_requests`;
CREATE VIEW `vi_requests` AS
SELECT 
`t1`.*,
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS `name`,
`t2`.`cellphone`,
`t2`.`email`
FROM `tb_requests` `t1` 
INNER JOIN `tb_persons` `t2` ON `t2`.`dni` = `t1`.`dni`;


SET FOREIGN_KEY_CHECKS = 1; -- Deshabilitamos las llaves foraneas
