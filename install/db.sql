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
VALUES(1, NOW(),'1007244088', 'DAYANNA', 'PINTO', 'HEILERNOVA', 'HEILERNOVA@GMAIL.COM', '$2y$04$A8dGLVylvwo/0eLebRIam.jJ6xLqfrnMKay2m1xB7cmptEYAyGp9.', '', '1', 0);

-- EPS
DROP TABLE if EXISTS `tb_eps`;
CREATE TABLE `tb_eps`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `disable` BIT
);

INSERT INTO `tb_eps` VALUES(1, 'NUEVA EPS', 0);

-- IPS
DROP TABLE if EXISTS `tb_ips`;
CREATE TABLE `tb_ips`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) not NULL,
    `disable` BIT
);

INSERT INTO `tb_ips`
VALUES
(1, 'ESE I NIVEL', 0),
(2, 'HOSPITAL SAN JOSÉ DEL GUAVIARE', 0),
(3, 'ODONTOMEDIC IPS', 0),
(4, 'NUEVA SALUD INTEGRAL IPS', 0),
(5, 'CENTRO MEDICO GUAVIARE', 0),
(6, 'IPS SESMAS', 0),
(7, 'ANGIAGRAFIAS DE COLOMBIA', 0),
(8, 'MI IPS LLANOS', 0),
(9, 'VISIÓN ORAL DIGITAL', 0),
(10, 'GAMMAS IPS', 0);

-- -----------------------------------------------------
-- -----------------------------------------------------
-- Registro de datos de personas
-- Datos de la personas
-- -----------------------------------------------------
-- -----------------------------------------------------

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
    `sex` CHAR(1),
    `birthDate` DATE,
    `address` VARCHAR(50),
    `eps` INT,
    `sisben` BIT,
    `regime` BIT,
    `population` CHAR,
    INDEX `index_eps` (`eps`),
    CONSTRAINT `fk_persons_eps` FOREIGN KEY(`eps`) REFERENCES `tb_eps`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (`dni`)
);


-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------
-- Servicio de atnención a la comunidad  ""  SAC ""
-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- Lista de atenciones requeridas.
DROP TABLE if EXISTS `tb_sac_required_attentions`;
CREATE TABLE `tb_sac_required_attentions`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `attention` VARCHAR(20) NOT NULL
);

-- Casos
DROP TABLE if EXISTS `tb_sac_cases`;
CREATE TABLE `tb_sac_cases`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL CURRENT_TIMESTAMP(),
    `status` BIT NOT NULL DEFAULT b'1',
    `user` INT NOT NULL,
    `eps` INT NOT NULL,
    `attention` INT NOT NULL,
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
    `palenRaizal` BIT,
    `roomGintano` BIT,
    `nnaNunaccompaniedAdult` BIT,
    INDEX `index_user` (`user`),
    INDEX `index_attention` (`attention`),
    INDEX `index_eps` (`eps`),
    CONSTRAINT `fk_sac_cases_users` FOREIGN KEY (`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_sac_cases_required_attentions` FOREIGN KEY (`attention`) REFERENCES `tb_sac_required_attentions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_sac_cases_eps` FOREIGN KEY (`eps`) REFERENCES `tb_eps`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
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
    `palenRaizal` BIT,
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
DROP TABLE if EXISTS `tb_requests_observations`;
CREATE TABLE `tb_requests_observations`
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

-- ----------------------------------------------------
-- ------------ ENCUENTAS -----------------------------
-- ----------------------------------------------------
-- Encuestas  de EPS
DROP TABLE if EXISTS `tb_surveys_eps`;
CREATE TABLE `tb_surveys_eps`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `dni` VARCHAR(16) NOT NULL,
    `ask01` VARCHAR(50),  -- Nombre de la EPS
    `ask02` VARCHAR(50),
    `ask03` BIT NOT NULL,
    `ask04` TINYINT,
    `ask05` TINYINT,
    `ask06` TINYINT,
    `ask07` TINYINT,
    `ask08` TINYINT,
    `ask09` TINYINT,
    `ask10` TINYINT,
    `ask11` TINYINT,
    `ask12` TINYINT,
    `ask12.01` TINYINT,
    `ask12.02` TINYINT,
    `ask13` TINYINT,
    INDEX `index_user` (`user`),
    INDEX `index_dni` (`dni`),
    CONSTRAINT `fk_surveys_eps_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_surveys_dni_persons` FOREIGN KEY(`dni`) REFERENCES `tb_persons`(`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `tb_surveys_ips`;
CREATE TABLE `tb_surveys_ips`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `dni` VARCHAR(16) NOT NULL,
    `ask01` VARCHAR(50) NOT NULL, -- Nombre de la IPS
    `ask02` TINYINT NOT NULL,
    `ask03` TINYINT NOT NULL,
    `ask04` TINYINT NOT NULL,
    `ask05` TINYINT NOT NULL,
    `ask06` TINYINT NOT NULL,
    `ask07` TINYINT NOT NULL,
    `ask08` TINYINT NOT NULL,
    `ask09` TINYINT NOT NULL,
    `ask10` TINYINT NOT NULL,
    INDEX `index_user` (`user`),
    INDEX `index_dni` (`dni`),
    CONSTRAINT `fk_surveys_ips_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_surveys_ips_dni` FOREIGN KEY(`dni`) REFERENCES `tb_persons`(`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE if EXISTS `tb_surveys_ips_hospitalization`;
CREATE TABLE `tb_surveys_ips_hospitalization`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `dni` VARCHAR(16) NOT NULL,
    `ask01` TINYINT,
    `ask02` TINYINT,
    `ask03` TINYINT,
    `ask04` TINYINT,
    `ask05` VARCHAR(50),
    `ask06` TINYINT,
    `ask07` TINYINT,
    `ask08` TINYINT,
    `ask09` TINYINT,
    `ask10` TINYINT,
    INDEX `index_user` (`user`),
    INDEX `index_dni` (`dni`),
    CONSTRAINT `fk_surveys_ips_hospitalization_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_surveys_ips_hospitalization_dni_persons` FOREIGN KEY(`dni`) REFERENCES `tb_persons`(`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
);


DROP TABLE if EXISTS `tb_surveys_ips_laboratorys`;
CREATE TABLE `tb_surveys_ips_laboratorys`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `dni` VARCHAR(16) NOT NULL,
    `ask01` VARCHAR(50), -- Nombre de la IPS
    `ask02` TINYINT,
    `ask03` TINYINT,
    `ask04` TINYINT,
    `ask05` TINYINT,
    `ask06` TINYINT,
    `ask07` TINYINT,
    `ask08` TINYINT,
    `ask09` TINYINT,
    `ask10` TINYINT,
    INDEX `index_user` (`user`),
    INDEX `index_dni` (`dni`),
    CONSTRAINT `fk_surveys_ips_laboratorys_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_surveys_ips_laboratorys_dni_persons` FOREIGN KEY(`dni`) REFERENCES `tb_persons`(`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE if EXISTS `tb_surveys_ips_pharmacy`;
CREATE TABLE `tb_surveys_ips_pharmacy`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `dni` VARCHAR(16) NOT NULL,
    `ask01` VARCHAR(50), -- Nombre de la IPS
    `ask02` TINYINT,
    `ask03` TINYINT,
    `ask04` TINYINT,
    `ask05` TINYINT,
    `ask06` TINYINT,
    `ask07` TINYINT,
    `ask08` TINYINT,
    INDEX `index_user` (`user`),
    INDEX `index_dni` (`dni`),
    CONSTRAINT `fk_surveys_ips_pharmacy_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_surveys_ips_pharmacy_dni_persons` FOREIGN KEY(`dni`) REFERENCES `tb_persons`(`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE if EXISTS `tb_surveys_ips_medicine`;
CREATE TABLE `tb_surveys_ips_medicine`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `dni` VARCHAR(16) NOT NULL,
    `ask01` VARCHAR(50), -- Nombre de la IPS
    `ask02` TINYINT,
    `ask03` TINYINT,
    `ask04` TINYINT,
    `ask05` TINYINT,
    `ask06` TINYINT,
    `ask07` TINYINT,
    `ask08` TINYINT,
    `ask09` TINYINT,
    `ask10` TINYINT,
    INDEX `index_user` (`user`),
    INDEX `index_dni` (`dni`),
    CONSTRAINT `fk_surveys_ips_medicine_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_surveys_ips_medicine_dni_persons` FOREIGN KEY(`dni`) REFERENCES `tb_persons`(`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE if EXISTS `tb_surveys_ips_odontology`;
CREATE TABLE `tb_surveys_ips_odontology`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `dni` VARCHAR(16) NOT NULL,
    `ask01` VARCHAR(50), -- Nombre de la IPS
    `ask02` TINYINT,
    `ask03` TINYINT,
    `ask04` TINYINT,
    `ask05` TINYINT,
    `ask06` TINYINT,
    `ask07` TINYINT,
    `ask08` TINYINT,
    `ask09` TINYINT,
    `ask10` TINYINT,
    INDEX `index_user` (`user`),
    INDEX `index_dni` (`dni`),
    CONSTRAINT `fk_surveys_ips_odontology_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_surveys_ips_odontology_dni_persons` FOREIGN KEY(`dni`) REFERENCES `tb_persons`(`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Vista de los requerimiento.
DROP VIEW if EXISTS `vi_requests`;
CREATE VIEW `vi_requests` AS
SELECT 
`t1`.*,
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS `name`,
`t2`.`cellphone`,
`t2`.`email`
FROM `tb_requests` `t1` 
INNER JOIN `tb_persons` `t2` ON `t2`.`dni` = `t1`.`dni`;

-- Vista de los casos activos.
DROP VIEW if EXISTS `vi_cases`;
CREATE VIEW `vi_cases` AS
SELECT 
t1.`id`,
t1.`date`,
t1.`dni`,
t2.`dniType`,
CONCAT(t2.`name`, ' ', t2.`lastName`) AS `name`,
t2.`sex`,
t2.`birthDate`,
t2.`cellphone`,
t2.`email`,
t2.`address`,
t3.`name` AS `eps`,
t2.`regime`,
t2.`sisben`,
t4.`description` AS `service`,
t1.`accompaniment`,
t1.`status`
FROM `tb_requests` t1
INNER JOIN `tb_persons` t2 ON t2.`dni` = t1.`dni`
INNER JOIN `tb_eps` t3 ON t2.`eps` = t2.`eps`
INNER JOIN `tb_requests_services` t4 ON t4.`id` = t1.`service`;

SET FOREIGN_KEY_CHECKS = 1; -- Deshabilitamos las llaves foraneas
