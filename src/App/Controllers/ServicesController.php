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

class ServicesController extends AppBaseController
{

    /**
     * Responde la lista de los servicios
     */
    function get():Response
    {
        $list = $this->database->execute("SELECT *  FROM tb_services")->fetchAll();
        return new Response($list);
    }

    /**
     * Registra un nuevo servicio
     */
    function post():Response
    {
        $description = $this->getBody();
        $res = new ResponseApi();
        $ok = $this->database->query("SELECT * FROM tb_services WHERE  `description`=?", [$description])->num_rows == 0;
        
        if ($ok){
            $result = $this->database->insert([$description], "tb_services");
            if ($result->result){
                $this->database->commit();
                $res->data = [
                    "id" => $result->insertId,
                    "description" => $description
                ];
                $res->status = true;
            }else{
                $res->message->content[] = "No se pudo realizar el registro";
            }
        }else{
            $res->message->content[] = "El servicio ya esta registrado.";
        }
        
        return new Response($res);
    }
    
    
    function update(int $id):Response
    {
        $description = $this->getBody();
        $ok = $this->database->query("SELECT * FROM tb_services WHERE  `description`=? AND `id`<>?", [$description, $id])->num_rows == 0;
        $res = new ResponseApi();

        if ($ok){
            $ok = $this->database->update(['description'=>$description], ['id=?', [$id]], 'tb_services')->result;
            
            if ($ok){
                $this->database->commit();
                $res->status = true;
            }else{
                $res->message->content[] = "No se pudo actulizar los datos";
            }
        }else{
            $res->message->content[] = "El nombre del servicio ya esta registrado.";
        }
        return new Response($description);
    }

    /**
     * Elimina un servicio
     */
    function delete():Response
    {
        return new Response(null);
    }
}