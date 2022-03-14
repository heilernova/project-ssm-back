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

    /**
     * Retorna la lista de solicitudes activas
     */
    function getAll():Response
    {
        $sql_request = "SELECT * FROM `vi_requests` WHERE `status`=1";
        $sql_observactions = "SELECT * FROM tb_requests_observations t1 INNER JOIN tb_requests t2 ON t2.request=t1.id AND t2.`status`=1 ORDER BY t1.id ASC";
        $req = $this->database->query($sql_request)->fetch_all(MYSQLI_ASSOC);
        $obs = $this->database->query($sql_observactions)->fetch_all(MYSQLI_ASSOC);

        $req = array_map(function($item)use($obs){
            $item['observations'] = $obs['id'] ?? [];
            return $item;
        }, $req);

        return new Response($req);
    }

    function getRequest(int $id):Response
    {
        return new Response("");
    }

    /**
     * Retorna la información de un usuario. en caso de no encontrar información retorna un error 404.
     */
    function getPersonInfo(string $dni)
    {
        $info = $this->requestModel->getPerson($dni);
        return new Response($info, $info ? 200 : 404);
    }

    /**
     * Inserta una nueva solicitud de asistencia al usuario.
     * En caso de error con el registro response un error 404
     */
    function insertRequest():Response
    {
        $data = $this->getBody();

        $ok_person = false;
        $ok_request = false;

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


        return new Response($ok_request, $ok_request ? 200 : 404);
    }

    /**
     * Retorna los serviscios prestando por el funcionarios
     */
    function getServices():Response
    {
        $res = $this->database->query("SELECT * FROM tb_services")->fetch_all(MYSQLI_ASSOC);
        return new Response($res);
    }

    /**
     * Retorna la EPS registradas en el sistema que se encutren activas
     */
    function getEPS():Response
    {
        return new Response($this->database->query("SELECT * FROM tb_eps WHERE `disable`=0")->fetch_all(MYSQLI_ASSOC));
    }
}