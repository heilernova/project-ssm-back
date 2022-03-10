<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use App\Models\PersonsModel;
use App\Models\RequestsModel;
use HNova\Api\Response;

class AttentionCommunityController extends AppBaseController
{
    private RequestsModel $requestModel;
    private PersonsModel $personsModel;
    function __construct()
    {
        $this->requestModel = new RequestsModel();
        $this->personsModel =  new PersonsModel();
        parent::__construct();
    }

    function getAll():Response
    {
        $req = $this->database->query("SELECT * FROM vi_requests")->fetch_all(MYSQLI_ASSOC);
        $obs = $this->database->query("SELECT * FROM tb_requests_observations")->fetch_all(MYSQLI_ASSOC);

        $req = array_map(function($item)use($obs){
            $item['observations'] = $obs['id'] ?? [];
            return $item;
        }, $req);

        return new Response($req);
    }

    function getPersonInfo(string $dni)
    {
        $info = $this->requestModel->getPerson($dni);
        return new Response($info, $info ? 200 : 404);
    }

    function insertRequest():Response
    {
        $data = $this->getBody();

        $ok_person = false;
        if ($this->personsModel->validDNI($data->person->dni)){
            // Si existe actualizamos la información.
            $ok_person = $this->personsModel->update($data->person->dni, $data->person);
        }else{
            $ok_person = $this->personsModel->insert($data->person);
        }
        
        if ($ok_person){
            $resq = $data->request;
            $resq->status = true;
            $resq->dni = $data->person->dni;
            $resq->regime = $data->person->regime;
            $ok_request = $this->requestModel->insert($resq);
        }

        if ($ok_request){
            $this->personsModel->commit();
            $this->requestModel->commit();
            return new Response(true);
        }else{
            return new Response(false, 500);
        }


        return new Response([$ok_person, $this->personsModel->database->getErrors() ]);
    }


    function getServices():Response
    {
        $res = $this->database->query("SELECT * FROM tb_services")->fetch_all(MYSQLI_ASSOC);
        return new Response($res);
    }

    function getEPS():Response
    {
        return new Response($this->database->query("SELECT * FROM tb_eps")->fetch_all(MYSQLI_ASSOC));
    }
}