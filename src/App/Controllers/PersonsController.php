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
    private PersonsModel $personModel;
    function __construct()
    {
        $this->personModel = new PersonsModel();
    }

    
    function get(string $dni):Response
    {
        $result = $this->personModel->get($dni);
        return new Response($result, $result ? 200 : 404);
    }
}