<?php
/**
 * Ingrese aquí las rutas de acceso de la api
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;
use HNova\Api\Routes\Router;

Routes::post("auth", [AuthController::class, 'autenticate']);

require "Routes/Eps.php";
require "Routes/Persons.php";
require "Routes/Publics.php";
require "Routes/Surveys.php";

require "Routes/Attention-community.php";
// echo json_encode(Router::getRoutes()); exit;