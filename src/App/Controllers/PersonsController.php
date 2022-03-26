<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use App\Models\PersonsModel;
use App\Templates\Db\PersonDB;
use HNova\Api\Http\ResponseApi;
use HNova\Api\Response;

class PersonsController extends AppBaseController
{
    private PersonsModel $_personModel;
    function __construct()
    {
        $this->_personModel = new PersonsModel();
        parent::__construct();
    }

    
    function get(string $dni):Response
    {
        $result = $this->_personModel->get($dni);
        return new Response($result, $result ? 200 : 404);
    }

    function post():Response{
        $res = new ResponseApi();
        $result = $this->_personModel->insert($this->getBody());

        if ($result){

        }else{
            $code = mysqli_errno($this->_personModel->database->getConnection());
            if ($code == 1062){
                $res->message->content[] = "El número de documento ya esta registrado";
            }
        }

        return new Response($res);
    }

    function put(string $dni){
        $ok = true;
        $data = $this->getBody();
        $res = new ResponseApi();
        
        if (isset($data->dni)){
            $sql = "SELECT * FROM tb_persons where dni=? AND dni<>?";
            $ok = $this->database->query($sql, [$data->dni, $dni])->fetch_assoc() ? true : false;
        }

        if ($ok){
            $res->message->content[] = "El número de documento ya esta asignado a otra persona";
        }else{

            $res->status = $this->_personModel->update($dni, $data);
            if ($res->status){
                $this->_personModel->commit();
                $res->data = new PersonDB($data);
                $res->status =  true;
            }else{
                $res->message->content[] = "No se actualizar al información";
            }
        }

        return $res;
    }
}