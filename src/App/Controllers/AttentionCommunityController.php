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
use App\Templates\Db\RequestHistoryDB;
use App\Templates\Db\RequestHistoryObservationsDB;
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
        $sql_request = "SELECT * FROM `vi_requests_history` WHERE `status`=1 ORDER BY `id` DESC";
        $sql_observactions = "SELECT t1.* FROM tb_requests_observations t1 INNER JOIN tb_requests t2 ON t2.id=t1.request AND t2.`status`=1 ORDER BY t1.id ASC";
        $req = $this->database->execute($sql_request)->fetchAllObjects(RequestHistoryDB::class);
        $obs = $this->database->execute($sql_observactions)->fetchAllObjects(RequestHistoryObservationsDB::class);

        $req = array_map(function(RequestHistoryDB $item) use($obs){

            $id = $item->id;
            // $item->observations = array_filter($obs,function(RequestHistoryObservationsDB $item) use ($id)
            // {
            //     return $item->valid($id);
            // });

            $item->observations = array_reduce($obs, function($carry, RequestHistoryObservationsDB $item) use ($id)
            {
                $carry = [];
                if ($item->valid($id)){
                    $carry[] = $item;
                }
                return $carry;
            });
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
        return new Response($info);
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


        return new Response($ok_request);
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