<?php

namespace ApiRest\Controllers\Cases;

use ApiRest\BaseController;
use HNova\Api\Api;
use HNova\Api\Data\Database;
use HNova\Api\HttpRequest;

class CommentsController extends BaseController
{
    function __construct()
    {
        // $this->_db = Api::getRouteConfig()->getDatabase('tb_sac_cases_comments');
        parent::__construct();
    }
    function get()
    {
        return "Hola mundo";
    }

    function post(){
        // return $_ENV['user']['id'];
        $data = HttpRequest::getContentBody();
        $data->user = $_ENV['user']['id'];

        // return $data;
        $this->_db = Api::getRouteConfig()->getDatabase('tb_sac_cases_comments');

        $ok = $this->_db->insert($data);

        if ($ok->result){
            $this->_db->commit();
            $id = $ok->insertId;
            return $this->_db->execute("SELECT * FROM tb_sac_cases_comments WHERE id=$id")->fetchAssoc();
        }else{
            return null;
        }
    }

    function put(int $id)
    {
        $db = Api::getRouteConfig()->getDatabase('tb_sac_cases_comments');

        $ok = $db->update(['content'=>HttpRequest::getContentBody()], ['id=?', [$id]]);
        if ($ok){
            $db->commit();
            return true;
        }else{
            return false;
        }
    }
}