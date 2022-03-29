<?php
/**
 * Aqui se enceutran las rutas de acceso apara las eps
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

// Rutas Atención  a la comunidad
Routes::parents("attention-community", [AppGuards::authenticate()]);
Routes::parents("attention-community");

// Casosos
Routes::get("cases/{id:int}" ,[CasesController::class]);
Routes::post("cases", [CasesController::class]);
Routes::put("cases/{id:int}", []);
Routes::delete("cases/{id:int}", [CasesController::class]);
Routes::patch("cases/{id:int}/close", [CasesController::class, 'patchClose']);

Routes::post("cases/{id:int}/observations", [CasesController::class, 'postObservations']); // Rgistar un observación al caso
Routes::put("cases/observations/{id:int}", [CasesController::class, 'putObservations']); // Rgistar un observación al caso
Routes::delete("cases/observations/{id:int}", [CasesController::class, 'deleteObservations']); // Rgistar un observación al caso

// Servicios prestados

Routes::get('required-attentions', [AttentionCommunityController::class, 'getRequiredAttentions']);
Routes::post('services', [AttentionCommunityController::class, 'postService']);
Routes::put('services/{id:int}', [AttentionCommunityController::class, 'putService']);

Routes::get('users/{dni:string}', [AttentionCommunityController::class, 'getUsers']);