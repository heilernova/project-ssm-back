<?php
/**
 * Aqui se estableces las rutas de acceso publicas
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

Routes::parents("public");

Routes::get('persons/{dni:strin}',[]);