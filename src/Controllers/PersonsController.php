<?php

namespace ApiRest\Controllers;

use ApiRest\BaseController;
use ApiRest\DB\PersonsDB;
use HNova\Api\HttpRequest;

class PersonsController extends BaseController
{
    function __construct(private PersonsDB $_person = new PersonsDB())
    {
        parent::__construct();
    }

    function get(string $dni = null)
    {
        return $this->_person->get($dni);
    }

    function post(){
        return $this->_person->insert(HttpRequest::getContentBody());
    }

    function put(string $dni){
        // return  HttpRequest::getContentBody();
        if ($this->_person->update( $dni, HttpRequest::getContentBody())){
            return $this->_person->get($dni);
        }else{
            return false;
        }
    }
}