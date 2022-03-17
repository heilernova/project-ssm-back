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

class ObservationsController extends AppBaseController
{
    function __construct()
    {
        
        parent::__construct();
    }

    function get(int $id = null):Response
    {
        return new Response("Hola mundo");
    }

    function post():Response{
        return new Response(null);
    }

    function put():Response{
        return new Response(null);
    }

    function delete($id):Response{
        return new Response(null);
    }
}