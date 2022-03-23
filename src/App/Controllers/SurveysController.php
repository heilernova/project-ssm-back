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
        $res = $this->database->execute("SELECT id, CONCAT(`name`, ' ', `lastName`) FROM tb_users")->fetchAll();
        return $res;
    }
}