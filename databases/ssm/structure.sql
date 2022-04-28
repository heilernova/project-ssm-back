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

-- EPS
DROP TABLE if EXISTS `tb_eps`;
CREATE TABLE `tb_eps`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `disable` BIT
);

-- IPS
DROP TABLE if EXISTS `tb_ips`;
CREATE TABLE `tb_ips`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) not NULL,
    `disable` BIT
);

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
DROP TABLE if EXISTS `tb_sac_cases_required_attentions`;
CREATE TABLE `tb_sac_cases_required_attentions`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `attention` VARCHAR(20) NOT NULL
);

-- Casos
DROP TABLE if EXISTS `tb_sac_cases`;
CREATE TABLE `tb_sac_cases`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `status` BIT NOT NULL DEFAULT b'1',
    `user` INT NOT NULL,
    `dni` VARCHAR(15) NOT NULL,
    `eps` INT NOT NULL,
    `requiredAttention` INT NOT NULL,
    `note` VARCHAR(400),
    `sisben` BIT,
    `regime` BIT,
    `olderAdult` BIT, -- Adulto mayor
    `disabled` BIT, -- Discapacitado.
    `pregnant` BIT, -- Mujer en gestación
    `womenHeadHousehold` BIT, -- Mujer cabeza de hogar
    `afrodescendent` BIT,
    `indigenous` BIT,
    `lgtbi` BIT,
    `victim` BIT, -- Victima
    `displaced` BIT, -- Desplazado
    `demobilized` BIT, -- desmovilizado
    `reinserted` BIT, -- Reincertado
    `palenRaizal` BIT,
    `roomGintano` BIT,
    `nnaNunaccompaniedAdult` BIT,
    INDEX `index_user` (`user`),
    INDEX `index_attention` (`requiredAttention`),
    INDEX `index_eps` (`eps`),
    CONSTRAINT `fk_sac_cases_users` FOREIGN KEY (`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_sac_cases_required_attentions` FOREIGN KEY (`requiredAttention`) REFERENCES `tb_sac_cases_required_attentions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_sac_cases_eps` FOREIGN KEY (`eps`) REFERENCES `tb_eps`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Registro de comentarios.
DROP TABLE if EXISTS `tb_sac_cases_comments`;
CREATE TABLE `tb_sac_cases_comments`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `user` INT NOT NULL,
    `case` INT NOT NULL,
    `content` VARCHAR(200) NOT NULL,
    INDEX `index_case` (`case`),
    INDEX `index_user` (`user`),
    CONSTRAINT `fk_tb_sac_cases_comments_cases`  FOREIGN KEY(`case`) REFERENCES `tb_sac_cases`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_tb_sac_cases_comments_users` FOREIGN KEY(`user`) REFERENCES `tb_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- -- Vista de los casos.
DROP VIEW if EXISTS `vi_cases`;
CREATE VIEW `vi_cases` AS
SELECT
t1.`id`,
t1.`date`,
t1.`dni`,
t2.`dniType`,
t5.`id` AS 'userId',
CONCAT(t5.`name`, ' ', t5.`lastName`)  AS 'userName',
CONCAT(t2.`name`, ' ', t2.`lastName`) AS `name`,
t2.`sex`,
t2.`birthDate`,
t2.`cellphone`,
t2.`email`,
t2.`address`,
t2.`regime`,
t2.`sisben`,
t3.`name` AS `eps`,
t4.`attention` AS `requiredAttention`,
t1.`note`,
t1.`status`
FROM `tb_sac_cases` t1
INNER JOIN `tb_persons` t2 ON t2.`dni` = t1.`dni`
INNER JOIN `tb_eps` t3 ON t3.`id` = t1.`eps`
INNER JOIN `tb_sac_cases_required_attentions` t4 ON t4.id = t1.`requiredAttention`
INNER JOIN `tb_users` t5 ON t5.`id` = t1.`user`;

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

-- --------------------------------------------
-- Vistas
-- --------------------------------------------

-- EPS
DROP VIEW IF EXISTS `vi_surveys_eps`;
CREATE VIEW `vi_surveys_eps` AS
SELECT 
`t1`.`id`,
CONVERT_TZ(`t1`.`date`, '+00:00', '-05:00') as 'date',
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
IF(`t3`.`birthDate` is null, 0, TIMESTAMPDIFF(YEAR, `t3`.`birthDate`, NOW()))
`t3`.`cellphone`,
`t3`.`address`,
UPPER(`t1`.`ask01`),
CASE 
    WHEN `t1`.`ask02` = '1' THEN 'VIGILANTE'
    WHEN `t1`.`ask02` = '2' THEN 'PROMOTOR'
    WHEN `t1`.`ask02` = '3' THEN 'RECEPCIONISTA'
    ELSE UPPER(`t1`.`ask02`) 
END AS 'ask02',
fun_surveys_yes_no(`t1`.`ask03`) AS 'ask03',
`t1`.`ask04`,
`t1`.`ask05`,
`t1`.`ask06`,
`t1`.`ask07`,
`t1`.`ask08`,
`t1`.`ask09`,
`t1`.`ask10`,
`t1`.`ask11`,
`t1`.`ask12`,
`t1`.`ask12.01`,
`t1`.`ask12.02`,
`t1`.`ask13`
FROM `tb_surveys_eps` `t1`
INNER JOIN `tb_users` `t2` ON `t1`.`user` = `t2`.`id`
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`
ORDER BY `id`;

-- IPS 
DROP VIEW IF EXISTS `vi_surveys_ips`;
CREATE VIEW `vi_surveys_ips` AS
SELECT 
`t1`.`id`,
CONVERT_TZ(`t1`.`date`, '+00:00', '-05:00') as 'date',
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
IF(`t3`.`birthDate` is null, 0, TIMESTAMPDIFF(YEAR, `t3`.`birthDate`, NOW())),
`t3`.`cellphone`,
upper(`t3`.`address`) AS 'address',
upper(`t1`.`ask01`) AS 'ask01',
fun_surveys_bad_regular_okey(`t1`.`ask02`) AS 'ask02',
fun_surveys_yes_no(`t1`.`ask03`) AS 'ask03',
CASE
    WHEN (`t1`.`ask04` = 1) THEN '1 DÍA DESPUES'
    WHEN (`t1`.`ask04` = 2) THEN '2 A 3 DÍAS DESPUES'
    WHEN (`t1`.`ask04` = 3) THEN '4 A 5 DÍAS DESPUES'
    WHEN (`t1`.`ask04` = 4) THEN '8 DÍAS DESPUES'
    WHEN (`t1`.`ask04` = 5) THEN 'MAS DE 10 DÍAS DESPUES'
    ELSE ''
END AS 'ask04',
CASE
    WHEN (`t1`.`ask05` = 1) THEN 'AMABILIDAD'
    WHEN (`t1`.`ask05` = 2) THEN 'NORMALIDAD'
    WHEN (`t1`.`ask05` = 3) THEN 'INDISPOSICIÓN'
    WHEN (`t1`.`ask05` = 4) THEN 'APATÍA'
    ELSE ''
END AS 'ask05',
CASE
    WHEN (`t1`.`ask06` = 1) THEN 'INMEDIATA'
    WHEN (`t1`.`ask06` = 2) THEN '10 MINUTOS'
    WHEN (`t1`.`ask06` = 3) THEN '15 MINUTOS'
    WHEN (`t1`.`ask06` = 4) THEN '20 MINUTOS'
    WHEN (`t1`.`ask06` = 5) THEN 'MÁS DE 30 MINUTOS'
    ELSE ''
END AS 'ask06',
CASE
    WHEN (`t1`.`ask07` = 1) THEN 'MEDICINA GENERAL'
    WHEN (`t1`.`ask07` = 2) THEN 'FARMACIA'
    WHEN (`t1`.`ask07` = 3) THEN 'LABORATORÍO CLÍNICO'
    WHEN (`t1`.`ask07` = 4) THEN 'ODONTOLOGÍA'
    WHEN (`t1`.`ask07` = 5) THEN 'PYP'
    ELSE ''
END AS 'ask07',
fun_surveys_bad_regular_okey(`t1`.`ask08`) AS 'ask08',
fun_surveys_yes_no(`t1`.`ask09`) AS 'ask09',
fun_surveys_bad_regular_okey(`t1`.`ask10`) AS 'ask10'
FROM `tb_surveys_ips` `t1`
INNER JOIN `tb_users` `t2` ON `t1`.`user` = `t2`.`id`
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`
ORDER BY `id`;

-- hospitalization
DROP VIEW IF EXISTS `vi_surveys_ips_hospitalization`;
CREATE VIEW `vi_surveys_ips_hospitalization` AS
SELECT 
`t1`.`id`,
CONVERT_TZ(`t1`.`date`, '+00:00', '-05:00') as 'date',
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
IF(`t3`.`birthDate` is null, 0, TIMESTAMPDIFF(YEAR, `t3`.`birthDate`, NOW())),
`t3`.`cellphone`,
upper(`t3`.`address`) AS 'address',
CASE
    WHEN (`t1`.`ask01` = 1) THEN 'SERVICIO DE URGENCIAS'
    WHEN (`t1`.`ask01` = 2) THEN 'CIRUGÍA PROGRAMADA'
    ELSE ''
END AS 'ask01',
CASE
    WHEN (`t1`.`ask02` = 1) THEN 'INMEDIATAMENTE'
    WHEN (`t1`.`ask02` = 2) THEN 'ENTRE 20 A 40 MINUTOS'
    WHEN (`t1`.`ask02` = 3) THEN 'MAS DE 40 MINUTOS'
    ELSE ''
END AS 'ask02',
CASE
    WHEN (`t1`.`ask03` = 1) THEN 'VIGILANTE'
    WHEN (`t1`.`ask03` = 2) THEN 'AUXILIAR'
    WHEN (`t1`.`ask03` = 3) THEN 'RECEPCIONISTA'
    WHEN (`t1`.`ask03` = 4) THEN 'MÉDICO'
    WHEN (`t1`.`ask03` = 5) THEN 'ENFERMERO'
    WHEN (`t1`.`ask03` = 6) THEN 'NADIE ME RECIBIO'
    ELSE ''
END AS 'ask03',
fun_surveys_yes_no(`t1`.`ask04`) AS 'ask04',
CASE
    WHEN (`t1`.`ask05` = 1) THEN 'DOCUMENTO DE INDENTIDAD'
    WHEN (`t1`.`ask05` = 2) THEN 'AUTORIZACIÓN'
    ELSE `t1`.`ask05`
END AS 'ask05',
fun_surveys_bad_regular_okey(`t1`.`ask06`) AS 'ask06',
fun_surveys_bad_regular_okey(`t1`.`ask07`) AS 'ask07',
fun_surveys_yes_no(`t1`.`ask08`) AS 'ask08',
fun_surveys_yes_no(`t1`.`ask09`) AS 'ask09',
fun_surveys_bad_regular_okey(`t1`.`ask10`) AS 'ask10'
FROM `tb_surveys_ips_hospitalization` `t1`
INNER JOIN `tb_users` `t2` ON `t1`.`user` = `t2`.`id`
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`
ORDER BY `id`;

-- laboratorys
DROP VIEW IF EXISTS `vi_surveys_ips_laboratorys`;
CREATE VIEW `vi_surveys_ips_laboratorys` AS
SELECT 
`t1`.`id`,
CONVERT_TZ(`t1`.`date`, '+00:00', '-05:00') as 'date',
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
IF(`t3`.`birthDate` is null, 0, TIMESTAMPDIFF(YEAR, `t3`.`birthDate`, NOW())),
`t3`.`cellphone`,
upper(`t3`.`address`) AS 'address',
UPPER(`t1`.`ask01`) AS 'ask01',
fun_surveys_bad_regular_okey(`t1`.`ask02`) AS 'ask02',
fun_surveys_bad_regular_okey(`t1`.`ask03`) AS 'ask03',
fun_surveys_bad_regular_okey(`t1`.`ask04`) AS 'ask04',
CASE
    WHEN (`t1`.`ask05` = 1) THEN 'INMEDIATO'
    WHEN (`t1`.`ask05` = 2) THEN '1 HORA'
    WHEN (`t1`.`ask05` = 4) THEN '2 HORAS'
    WHEN (`t1`.`ask05` = 5) THEN 'MAS DE 3 HORAS'
    ELSE ''
END AS 'ask05',
fun_surveys_bad_regular_okey(`t1`.`ask06`) AS 'ask06',
fun_surveys_bad_regular_okey(`t1`.`ask07`) AS 'ask07',
CASE
    WHEN (`t1`.`ask08` = 1) THEN 'EL MISMO DÍA'
    WHEN (`t1`.`ask08` = 2) THEN 'A LOS 2 DÍAS'
    WHEN (`t1`.`ask08` = 3) THEN 'A LOS 5 DÍAS'
    WHEN (`t1`.`ask08` = 4) THEN 'A LOS 8 DÍAS'
    ELSE ''
END AS 'ask08',
fun_surveys_yes_no(`t1`.`ask09`) AS 'ask09',
fun_surveys_bad_regular_okey(`t1`.`ask10`) AS 'ask10'
FROM `tb_surveys_ips_laboratorys` `t1`
INNER JOIN `tb_users` `t2` ON `t1`.`user` = `t2`.`id`
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`
ORDER BY `id`;

-- medicina
DROP VIEW IF EXISTS `vi_surveys_ips_medicine`;
CREATE VIEW `vi_surveys_ips_medicine` AS
SELECT 
`t1`.`id`,
CONVERT_TZ(`t1`.`date`, '+00:00', '-05:00') as 'date',
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
IF(`t3`.`birthDate` is null, 0, TIMESTAMPDIFF(YEAR, `t3`.`birthDate`, NOW())),
`t3`.`cellphone`,
upper(`t3`.`address`) AS 'address',
UPPER(`t1`.`ask01`) AS 'ask01',
CASE
    WHEN (`t1`.`ask02` = 1) THEN 'EL MISMO DIA'
    WHEN (`t1`.`ask02` = 2) THEN '1 DÍA DESPUES'
    WHEN (`t1`.`ask02` = 3) THEN '5 DÍAS DESPUES'
    WHEN (`t1`.`ask02` = 4) THEN '8 DÍAS DEPUES'
    ELSE ''
END AS 'ask02',
fun_surveys_bad_regular_okey(`t1`.`ask03`) AS 'ask03',
fun_surveys_yes_no(`t1`.`ask04`) AS 'ask04',
fun_surveys_yes_no(`t1`.`ask05`) AS 'ask05',
fun_surveys_bad_regular_okey(`t1`.`ask06`) AS 'ask06',
fun_surveys_bad_regular_okey(`t1`.`ask07`) AS 'ask07',
fun_surveys_bad_regular_okey(`t1`.`ask08`) AS 'ask08',
fun_surveys_bad_regular_okey(`t1`.`ask09`) AS 'ask09',
fun_surveys_bad_regular_okey(`t1`.`ask10`) AS 'ask10'
FROM `tb_surveys_ips_medicine` `t1`
INNER JOIN `tb_users` `t2` ON `t1`.`user` = `t2`.`id`
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`
ORDER BY `id`;

-- Odontologia
DROP VIEW IF EXISTS `vi_surveys_ips_odontology`;
CREATE VIEW `vi_surveys_ips_odontology` AS
SELECT 
`t1`.`id`,
CONVERT_TZ(`t1`.`date`, '+00:00', '-05:00') as 'date',
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
IF(`t3`.`birthDate` is null, 0, TIMESTAMPDIFF(YEAR, `t3`.`birthDate`, NOW())),
`t3`.`cellphone`,
upper(`t3`.`address`) AS 'address',
UPPER(`t1`.`ask01`) AS 'ask01',
CASE
    WHEN (`t1`.`ask02` = 1) THEN 'EL MISMO DÍA'
    WHEN (`t1`.`ask02` = 2) THEN '1 DÍA DESPUES'
    WHEN (`t1`.`ask02` = 3) THEN '5 DÍAS DESPUES'
    WHEN (`t1`.`ask02` = 4) THEN '8 DÍAS DEPUES'
    ELSE ''
END AS 'ask02',
fun_surveys_bad_regular_okey(`t1`.`ask03`) AS 'ask03',
fun_surveys_yes_no(`t1`.`ask04`) AS 'ask04',
fun_surveys_yes_no(`t1`.`ask05`) AS 'ask05',
fun_surveys_bad_regular_okey(`t1`.`ask06`) AS 'ask06',
fun_surveys_bad_regular_okey(`t1`.`ask07`) AS 'ask07',
fun_surveys_bad_regular_okey(`t1`.`ask08`) AS 'ask08',
fun_surveys_bad_regular_okey(`t1`.`ask09`) AS 'ask09',
fun_surveys_bad_regular_okey(`t1`.`ask10`) AS 'ask10'
FROM `tb_surveys_ips_odontology` `t1`
INNER JOIN `tb_users` `t2` ON `t1`.`user` = `t2`.`id`
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`
ORDER BY `id`;

-- Farmacia
DROP VIEW IF EXISTS `vi_surveys_ips_pharmacy`;
CREATE VIEW `vi_surveys_ips_pharmacy` AS
SELECT 
`t1`.`id`,
CONVERT_TZ(`t1`.`date`, '+00:00', '-05:00') as 'date',
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
IF(`t3`.`birthDate` is null, 0, TIMESTAMPDIFF(YEAR, `t3`.`birthDate`, NOW())),
`t3`.`cellphone`,
upper(`t3`.`address`) AS 'address',
UPPER(`t1`.`ask01`) AS 'ask01',
fun_surveys_bad_regular_okey(`t1`.`ask02`) AS 'ask02',
fun_surveys_bad_regular_okey(`t1`.`ask03`) AS 'ask03',
CASE
    WHEN (`t1`.`ask04` = 1) THEN 'INMEDIATO'
    WHEN (`t1`.`ask04` = 2) THEN 'A LAS 24 HORAS'
    WHEN (`t1`.`ask04` = 3) THEN 'MAS DE 48 HORAS'
    ELSE ''
END AS 'ask04',
fun_surveys_yes_no(`t1`.`ask05`) AS 'ask05',
fun_surveys_yes_no(`t1`.`ask06`) AS 'ask06',
CASE
    WHEN (`t1`.`ask07` = 1) THEN 'SI'
    WHEN (`t1`.`ask07` = 2) THEN 'NO'
    WHEN (`t1`.`ask07` = 3) THEN 'NO SABE'
    ELSE ''
END AS 'ask07',
fun_surveys_bad_regular_okey(`t1`.`ask08`) AS 'ask08'
FROM `tb_surveys_ips_pharmacy` `t1`
INNER JOIN `tb_users` `t2` ON `t1`.`user` = `t2`.`id`
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`
ORDER BY `id`;

SET FOREIGN_KEY_CHECKS = 1; -- Deshabilitamos las llaves foraneas