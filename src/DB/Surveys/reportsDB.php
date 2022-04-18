<?php
namespace ApiRest\DB\Surveys;

use ApiRest\BaseDB;
use HNova\Api\Api;

class ReportsDB extends BaseDB
{
    public function __construct()
    {
        parent::__construct('table_name', 'ssm');
    }

    public function getReports(int $pollster, string $dateStart, string $dateEnd){

        $db = Api::getRouteConfig()->getDatabase();
        $params = [];
        $where = "";
        if ($pollster > 0){
            $where = "pollsterId=? AND";
            $params[] = $pollster;
        }

        $params[] = "$dateStart";
        $params[] = "$dateEnd";
        $where .= "`date` BETWEEN ? AND ?";

        $result['eps'] = $db->execute("SELECT * FROM vi_surveys_eps WHERE $where", $params)->fetchAll();
        $result['ips'] = $db->execute("SELECT * FROM vi_surveys_ips WHERE $where", $params)->fetchAll();
        $result['hospitalization'] = $db->execute("SELECT * FROM vi_surveys_ips_hospitalization WHERE $where", $params)->fetchAll();
        $result['laboratory'] = $db->execute("SELECT * FROM vi_surveys_ips_laboratorys WHERE $where", $params)->fetchAll();
        $result['medicine'] = $db->execute("SELECT * FROM vi_surveys_ips_medicine WHERE $where", $params)->fetchAll();
        $result['odontology'] = $db->execute("SELECT * FROM vi_surveys_ips_odontology WHERE $where", $params)->fetchAll();
        $result['pharmacy'] = $db->execute("SELECT * FROM vi_surveys_ips_pharmacy WHERE $where", $params)->fetchAll();
        return $result;
    }

    public function getTotals(int $pollster, string $dateStart, string $dateEnd):array
    {
            $db = Api::getRouteConfig()->getDatabase();
            $params = [];
            $where = "";
            if ($pollster > 0){
                $where = "user=? AND";
                $params[] = $pollster;
            }

            $params[] = "$dateStart";
            $params[] = "$dateEnd";
            $where .= "`date` BETWEEN ? AND ?";

            $result = ['total' => 0];
            $result['eps'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_eps WHERE $where", $params)->fetchArray()[0];
            $result['ips'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips WHERE $where", $params)->fetchArray()[0];
            $result['hospitalization'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_hospitalization WHERE $where", $params)->fetchArray()[0];
            $result['laboratory'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_laboratorys WHERE $where", $params)->fetchArray()[0];
            $result['medicine'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_medicine WHERE $where", $params)->fetchArray()[0];
            $result['odontology'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_odontology WHERE $where", $params)->fetchArray()[0];
            $result['pharmacy'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_pharmacy WHERE $where", $params)->fetchArray()[0];
            
            foreach ($result as $value){
                $result['total'] += $value;
            }
            return $result;
    }
}