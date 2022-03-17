<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\App;
use App\AppBaseController;
use App\Models\RequestsModel;
use App\Templates\Db\RequestHistoryDB;
use App\Templates\Db\RequestHistoryObservationsDB;
use HNova\Api\Http\ResponseApi;
use HNova\Api\Response;

class CasesController extends AppBaseController
{
    private RequestsModel $requestModel;
    function __construct()
    {
        $this->requestModel = new RequestsModel();
        parent::__construct();
    }

    // Retorn todos los casos
    function get(int $id = null):Response
    {
        $where_id = $id ? "AND id=?" : "";
        $where_request = $id ? "AND request=?" : "";
        $sql_request = "SELECT * FROM `vi_requests_history` WHERE `status`=1 $where_id ORDER BY `id` DESC";
        $sql_observactions = "SELECT t1.* FROM tb_requests_observations t1 INNER JOIN tb_requests t2 ON t2.id=t1.request AND t2.`status`=1 $where_request ORDER BY t1.id ASC";
        
        if ($id){
            $req = $this->database->execute($sql_request, [$id])->fecthObject(RequestHistoryDB::class);
            if ($req){
                $req->observations  = $this->database->execute($sql_observactions, [$id])->fetchAllObjects(RequestHistoryObservationsDB::class);
            }
            return new Response($req);
        }else{

            $req = $this->database->execute($sql_request)->fetchAllObjects(RequestHistoryDB::class);
            $obs = $this->database->execute($sql_observactions)->fetchAllObjects(RequestHistoryObservationsDB::class);
    
            $req = array_map(function(RequestHistoryDB $item) use($obs){
    
                $id = $item->id;
                $item->observations = array_reduce($obs, function($carry, RequestHistoryObservationsDB $item) use ($id){
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
        }

    /**
     * Registra un nuevo caso en la base de datos.
     */
    function post():Response{
        $id = App::getUser()->id;
        $data = $this->getBody();
        $data->user = $id;
        $ok = $this->requestModel->insert($data);

        return new Response(null);
    }

    /**
     * Actualiza la información de un caso.
     */
    function put(int $id):Response{
        return new Response(null);
    }

    /**
     * Elimina un caso.
     */
    function delete(int $id):Response{
        return new Response(null);
    }
}