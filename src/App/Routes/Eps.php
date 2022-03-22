<?php
/**
 * Aqui se enceutran las rutas de acceso apara las eps
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

// Rutas del las EPS
Routes::get("eps", [EpsController::class, 'getAll']);
Routes::get("eps/active", [EpsController::class, 'getAllActive']);
Routes::get("eps/{id:int}", [EpsController::class, 'get']);
Routes::put("eps/{id:int}", [EpsController::class, 'update']);
Routes::post("eps", [EpsController::class, 'insert']);
Routes::patch("eps/{id:int}/disable", [EpsController::class, 'disable']);
Routes::patch("eps/{id:int}/enable", [EpsController::class, 'enable']);
