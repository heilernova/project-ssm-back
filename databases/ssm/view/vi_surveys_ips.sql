DROP VIEW IF EXISTS `vi_surveys_ips`;
CREATE VIEW `vi_surveys_ips` AS
SELECT 
`t1`.`id`,
`t1`.date,
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
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