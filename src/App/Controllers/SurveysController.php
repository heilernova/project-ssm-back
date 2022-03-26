<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use HNova\Api\Http\ResponseApi;
use HNova\Api\Response;

class SurveysController extends AppBaseController
{
    function __construct()
    {
        
        parent::__construct();
    }
    function post()
    {
        $data = $this->getBody();
        $db = $data->database;
        $params = $data->params;
        $res = new ResponseApi();


        $result = $this->database->insert($params, $db)->result;
        
        if ($result){
            $this->database->commit();
            $res->status = true;
            $res->data = true;
        }else{
            $res->message->content[] = "No se pudo guardar los datos.";
            $res->message->content[] = "Por favir intentelo nuevamente";
        }

        return $res;
    }

    function ipsGet(){
        return $this->database->query("SELECT * FROM tb_ips")->fetch_all(MYSQLI_ASSOC);
    }
}