<?php

namespace ApiRest\Controllers;

use ApiRest\BaseController;
use HNova\Api\Api;
use HNova\Api\HttpRequest;
use HNova\Api\Response;

class SurveysController extends BaseController
{
    function __construct()
    {
        parent::__construct();
    }
    function get()
    {
        return "Hola mundo";
    }

    function post(){
        $data = HttpRequest::getContentBody();

        $db_name = $data->database;
        $params = $data->params;
        $database = Api::getRouteConfig()->getDatabase($db_name);
        
        $ok = $database->insert($params);
        
        if ($ok){
            $database->commit();
            return true;
        }else{
            Response::addMessage("No se pudor registrar la encuesta");
            Response::addMessage("Por favor intentelo nuevamente");
            return false;
        }
    }

    function postComments($id){
        
    }
    
    function getPollters(){
        $database = Api::getRouteConfig()->getDatabase();

        return $database->execute("SELECT id, CONCAT(`name`, ' ', `lastName`) as `name` FROM tb_users")->fetchAll();
        
    }
}