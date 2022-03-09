<?php
/**
 * Ingrese aquí las rutas de acceso de la api
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

Routes::post("auth", [AuthController::class, 'autenticate']);

// Rutas del las EPS
Routes::get("eps", [EpsController::class, 'getAll']);
Routes::get("eps/{id:int}", [EpsController::class, 'get']);
Routes::post("eps", [EpsController::class, 'insert']);
Routes::patch("eps/{id:int}/disable", [EpsController::class, 'disable']);
Routes::patch("eps/{id:int}/enable", [EpsController::class, 'enable']);

// Rutas personas
Routes::get("persons/{dni:string}", [PersonsController::class, 'get']);
Routes::put("persons/{dni:string}", [PersonsController::class, 'get']);