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

class SurveyorsController extends AppBaseController
{
    function __construct()
    {
        
        parent::__construct();
    }
    function get()
    {
        $res = $this->database->execute("SELECT id, CONCAT(`name`, ' ', `lastName`) as `name` FROM tb_users")->fetchAll();
        return $res;
    }
}