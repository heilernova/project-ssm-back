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