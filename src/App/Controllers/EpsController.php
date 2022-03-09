<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use App\Models\EpsModel;
use App\Templates\Db\EpsDB;
use HNova\Api\Http\ResponseApi;
use HNova\Api\Response;

class EpsController extends AppBaseController
{
    private EpsModel $EpsModel;
    public function __construct()
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

    function insert():Response
    {
        $name_eps = (string)$this->getBody();
        
        $ok = $this->EpsModel->validName($name_eps);
        $res = new ResponseApi();

        if (!$ok){
            $eps = new EpsDB();
            $eps->name = $name_eps;
            // return new Response($eps);
            $eps = $this->EpsModel->add($eps);

            if ($eps){

                $res->data = $eps;
            }else{

                $res->message->content[] = "No se pudo registrar";
                $res->message->content[] = "Por favir intentelo nuevamente";
            }
        }else{
            // En coso de que este registrado
            $res->message->content[] = "La EPS ya se encuentra registrada.";
        }

        return new Response($res);
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