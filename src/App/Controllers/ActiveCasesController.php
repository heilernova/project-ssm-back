<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use App\Templates\Db\RequestHistoryDB;
use App\Templates\Db\RequestHistoryObservationsDB;
use HNova\Api\Http\ResponseApi;
use HNova\Api\Response;

class ActiveCasesController extends AppBaseController
{
    function __construct()
    {
        
        parent::__construct();
    }

    // Restrona los casos activos.
    function get():Response
    {
        $sql_request = "SELECT * FROM `vi_requests_history` WHERE `status`=1 ORDER BY `id` DESC";
        $sql_observactions = "SELECT t1.* FROM tb_requests_observations t1 INNER JOIN tb_requests t2 ON t2.id=t1.request AND t2.`status`=1 ORDER BY t1.id ASC";
        
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