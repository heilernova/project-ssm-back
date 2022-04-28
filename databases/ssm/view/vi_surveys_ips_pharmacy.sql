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