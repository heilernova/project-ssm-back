<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use HNova\Api\Response;

class AttentionCommunityController extends AppBaseController
{
    function get():Response
    {
        /**
         * Aqui el código a ejecutar
         */
        return new Response("Hola mundo");
    }

    function getPersonInfo(string $dni)
    {
        return new Response(null, 404);
    }

    function insert():Response
    {
        $data = $this->getBody();

        return new Response("");
    }
}