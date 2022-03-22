<?php
/**
 * Ingrese aquí las rutas de acceso de la api
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

Routes::post("auth", [AuthController::class, 'autenticate']);

require "Routes/Eps.php";
require "Routes/Attention-community.php";
require "Routes/Persons.php";
require "Routes/Publics.php";