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
use App\Templates\Db\PersonRequestDB;
use App\Templates\Db\RequestHistoryDB;
use App\Templates\Db\RequestHistoryObservationsDB;
use HNova\Api\Response;

class AttentionCommunityController extends AppBaseController
{

    /**
     * Retorna los serviscios prestando por el funcionarios
     */
    function getServices():Response
    {
        $res = $this->database->query("SELECT * FROM tb_requests_services")->fetch_all(MYSQLI_ASSOC);
        return new Response($res);
    }

    function postService():Response{
        $service = (string)$this->getBody();
        $res = $this->database->insert(["description"=>$service], 'tb_requests_services');
        if ($res->result){
            $this->database->commit();
            return new Response(['id'=>$res->insertId, 'description'=>$service]);
        }
        return new Response(null);
    }

    function putService(int $id):Response{
        $service = (string)$this->getBody();
        $res = $this->database->update(["description"=>$service], ['id=?', [$id]] ,'tb_requests_services');
        if ($res->result){
            $this->database->commit();
            return new Response(true);
        }
        return new Response(null);
    }

    function getUsers(string $dni):Response{
        $person = $this->database->execute("SELECT * FROM tb_persons WHERE dni=?", [$dni])->fecthObject(PersonRequestDB::class);

        if ($person){
            $res = $this->database->query("SELECT * FROM tb_requests WHERE dni=? ORDER BY id DESC LIMIT 1", [$dni])->fetch_assoc();
            $person->lastRequest = $res;
        }

        return new Response($person);
    }
}