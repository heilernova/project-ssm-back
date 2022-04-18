<?php

namespace ApiRest\Controllers;

use ApiRest\BaseController;
use ApiRest\DB\EpsDB;
use HNova\Api\Api;

class EpsController extends BaseController
{
    function __construct(private EpsDB $_epsDB = new EpsDB())
    {
        
    }
    function getActives()
    {
        return $this->_epsDB->getActive();

        
        return "Hola mundo";
    }
}