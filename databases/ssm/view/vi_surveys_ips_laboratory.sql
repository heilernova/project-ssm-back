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