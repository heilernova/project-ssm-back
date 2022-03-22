<?php
/**
 * Aqui se enceutran las rutas de acceso apara las eps
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

// Rutas Atención  a la comunidad
Routes::parents("persons", [AppGuards::authenticate()]);

// Rutas personas
Routes::post("", [PersonsController::class]);
Routes::get("{dni:string}", [PersonsController::class]);
Routes::put("{dni:string}", [PersonsController::class]);