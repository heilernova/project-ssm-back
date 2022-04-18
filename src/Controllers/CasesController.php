<?php

namespace ApiRest\Controllers;

use ApiRest\BaseController;
use ApiRest\DB\CasesDB;
use HNova\Api\Api;
use HNova\Api\HttpRequest;

class CasesController extends BaseController
{
    function __construct(public CasesDB $_cases = new CasesDB())
    {
        
    }
    function get(int $id = null)
    {
        return $this->_cases->get($id);
    }

    function requiredAttentions()
    {
        $database = Api::getRouteConfig()->getDatabase();
        return $database->query("SELECT * FROM tb_sac_cases_required_attentions")->fetch_all(MYSQLI_ASSOC);
    }

    function getUsers(string $dni){

        $database = Api::getRouteConfig()->getDatabase();
        $person = $database->query("SELECT * FROM tb_persons WHERE dni=?", [$dni])->fetch_assoc();
        $last = null;
        // $sql = "SELECT t1.*, t2.name as `epsName` FROM tb_persons t1 INNER JOIN tb_eps t2 ON t2.id = t1.eps WHERE dni=?";
        // $person = $database->execute($sql, [$dni])->fecthObject(PersonRequestDB::class);

        if ($person){
            $res = $database->query("SELECT * FROM tb_sac_cases WHERE dni=? ORDER BY id DESC LIMIT 1", [$dni])->fetch_assoc();
            $last = $res;
        }

        // return new Response($person);
        return  [
            'person'=>$person,
            'lastCase'=>$last
        ];
    }

    function post(){
        $data = HttpRequest::getContentBody();

        $data->user = $_ENV['user']['id'];

        // return $data;
        $ok = $this->_cases->_database->insert($data);
        if ($ok->result){
            $this->_cases->_database->commit();
            return $this->_cases->get($ok->insertId);
        }else{
            return[HttpRequest::getContentBody(), $this->_cases->_database->getErrors()];
        }

    }
}