<?php
/**
 * Ingrese aquí las rutas de acceso de la api
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

Routes::post("auth", [AuthController::class, 'autenticate']);

// Routes::parents('', [AppGuards::authenticate()]);

// Rutas del las EPS
Routes::get("eps", [EpsController::class, 'getAll']);
Routes::get("eps/active", [EpsController::class, 'getAllActive']);
Routes::get("eps/{id:int}", [EpsController::class, 'get']);
Routes::put("eps/{id:int}", [EpsController::class, 'update']);
Routes::post("eps", [EpsController::class, 'insert']);
Routes::patch("eps/{id:int}/disable", [EpsController::class, 'disable']);
Routes::patch("eps/{id:int}/enable", [EpsController::class, 'enable']);

// Rutas personas
Routes::get("persons/{dni:string}", [PersonsController::class, 'get']);
Routes::put("persons/{dni:string}", [PersonsController::class, 'get']);

// Rutas Atención  a la comunidad
Routes::parents("attention-community");

// Casosos
Routes::get("cases/{id:int}" ,[CasesController::class]);
Routes::post("cases", []);
Routes::put("cases/{id:int}", []);
Routes::delete("cases/{id:int}", []);


// Routes::get("attention-community", [AttentionCommunityController::class, 'getAll']);
// Routes::get("attention-community/full", [AttentionCommunityController::class, 'getFullAll']);
// Routes::get("attention-community/services", [AttentionCommunityController::class, 'getServices']);
// Routes::post("attention-community", [AttentionCommunityController::class, 'insertRequest']);

// // Registros
// Routes::get("attention-community/{id:int}", [AttentionCommunityController::class, 'get']);
// Routes::put("attention-community/{id:int}", [AttentionCommunityController::class, 'update']);
// Routes::delete("attention-community/{id:int}", [AttentionCommunityController::class, 'delete']);

// // Registros comentarios
// Routes::post("attention-community/{id:int}/comments", [RequestController::class, 'addComment']);

// Routes::get("attention-community/users/{dni:string}", [AttentionCommunityController::class, 'getPersonInfo']);