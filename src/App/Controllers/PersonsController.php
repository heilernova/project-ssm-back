<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use App\Models\PersonsModel;
use HNova\Api\Response;

class PersonsController extends AppBaseController
{
    private PersonsModel $_personModel;
    function __construct()
    {
        $this->_personModel = new PersonsModel();
    }

    
    function get(string $dni):Response
    {
        $result = $this->_personModel->get($dni);
        return new Response($result, $result ? 200 : 404);
    }

    function post():Response{
        $res = $this->_personModel->insert($this->getBody());
        return new Response($res);
    }
}