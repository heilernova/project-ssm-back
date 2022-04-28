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