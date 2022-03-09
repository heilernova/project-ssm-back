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

class EpsController extends AppBaseController
{
    public function __construct(private EpsModel $EpsModel)
    {
        $this->EpsModel = new EpsModel();
        parent::__construct();
    }

    function getAll():Response
    {
        $list = $this->EpsModel->getAll();
        return new Response($list);
    }

    function get(int $id):Response
    {
        $eps = $this->EpsModel->get($id);
        if ($eps){
            return new Response($eps);
        }else{
            $res = new ResponseApi();
            $res->message->title = "Mensaje del sistema";
            $res->message->content[] = "No se encontro ninguna infromación de la EPS";
            return new Response($res);
        }
    }

    function desable(int $id):Response
    {
        return new Response($this->EpsModel->desabele($id));
    }

    function enable(int $id):Response
    {
        return new Response($this->EpsModel->enabele($id));
    }
}