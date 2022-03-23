<?php
/**
 * Aqui se enceutran las rutas de acceso apara las eps
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

// Rutas Atención  a la comunidad
Routes::post("persons", [PersonsController::class]);
Routes::get("persons/{dni:string}", [PersonsController::class]);
Routes::put("persons{dni:string}", [PersonsController::class], [AppGuards::authenticate()]);