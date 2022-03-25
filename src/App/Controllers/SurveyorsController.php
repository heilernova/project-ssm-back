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

class SurveyorsController extends AppBaseController
{
    function __construct()
    {
        
        parent::__construct();
    }
    function get()
    {
        $res = $this->database->execute("SELECT id, CONCAT(`name`, ' ', `lastName`) as `name` FROM tb_users")->fetchAll();
        return $res;
    }

    function postEPS(){
        $data = $this->getBody();
        $res = $this->database->insert($data, 'tb_surveys_eps')->result;
        if ($res){
            $this->database->commit();
            return true;
        }else{
            $res = new ResponseApi();
            $res->message->content[] = "No se pudo guardar las datos.";
            return $res;
        }
    }

    function postIPS(){
        $data = $this->getBody();
        $res = $this->database->insert($data, 'tb_surveys_ips_evaluation');

        if ($res){
            $this->database->commit();
            return true;
        }else{
            $res = new ResponseApi();
            $res->message->content[] = "No se pudo guardar las datos.";
            return $res;
        }
    }
    function postIPSHospitalization(){
        $data = $this->getBody();
        $res = $this->database->insert($data, 'tb_surveys_ips_hospitalization');

        if ($res){
            $this->database->commit();
            return true;
        }else{
            $res = new ResponseApi();
            $res->message->content[] = "No se pudo guardar las datos.";
            return $res;
        }
    }
    function postIPSLaboratory(){
        $data = $this->getBody();
        $res = $this->database->insert($data, 'tb_surveys_ips_laboratorys');

        if ($res){
            $this->database->commit();
            return true;
        }else{
            $res = new ResponseApi();
            $res->message->content[] = "No se pudo guardar las datos.";
            return $res;
        }
    }

    function postIPSPharmacy(){
        $data = $this->getBody();
        $res = $this->database->insert($data, 'tb_surveys_ips_pharmacy');

        if ($res){
            $this->database->commit();
            return true;
        }else{
            $res = new ResponseApi();
            $res->message->content[] = "No se pudo guardar las datos.";
            return $res;
        }
    }
    
    function postIPSMedicine(){
        $data = $this->getBody();
        $res = $this->database->insert($data, 'tb_surveys_ips_medicine');
    
        if ($res){
            $this->database->commit();
            return true;
        }else{
            $res = new ResponseApi();
            $res->message->content[] = "No se pudo guardar las datos.";
            return $res;
        }
    }
    
    function postIPSOdontology(){
        $data = $this->getBody();
        $res = $this->database->insert($data, 'tb_surveys_ips_odontology');
    
        if ($res){
            $this->database->commit();
            return true;
        }else{
            $res = new ResponseApi();
            $res->message->content[] = "No se pudo guardar las datos.";
            return $res;
        }
    }
}