<?php
/**
 * esta clase contendra las funcionalidades que herederan los controladores de la api.
 */

namespace App;

use HNova\Api\ApiController;

class AppBaseController extends ApiController
{
    public function __construct()
    {
        parent::__construct();
    }
}