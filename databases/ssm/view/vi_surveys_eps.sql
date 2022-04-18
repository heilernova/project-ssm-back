DROP VIEW IF EXISTS `vi_surveys_eps`;
CREATE VIEW `vi_surveys_eps` AS
SELECT 
`t1`.`id`,
`t1`.`date`,
`t2`.`id` AS 'pollsterId',
CONCAT(`t2`.`name`, ' ', `t2`.`lastName`) AS 'pollster',
`t3`.`dni`,
`t3`.`dniType`,
UPPER(`t3`.`name`) AS 'name',
UPPER(`t3`.`lastName`) AS 'lastName',
`t3`.`sex`,
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
INNER JOIN `tb_persons` `t3` ON `t3`.`dni` = `t1`.`dni`;