<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use HNova\Api\Response;

class RequestController extends AppBaseController
{
    /**
     * Retorna la información de una solicitud.
     * En caso de no existir la solicitud retorna un error 404
     */
    function get(int $id):Response
    {
        /**
         * Aqui el código a ejecutar
         */
        return new Response("Hola mundo");
    }

    /**
     * Retorna la lista de las solicutudes realizadas.
     */
    function getAll():Response
    {
        return new Response("");
    }

    /**
     * Registra un comentario
     */
    function addComment(int $id):Response
    {
        return new Response("");
    }

    /**
     * Retorna los comentarios de una solicitud
     */
    public function getComments(int $id)
    {
        return new Response("");
    }
}