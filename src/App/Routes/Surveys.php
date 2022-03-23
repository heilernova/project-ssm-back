<?php
/**
 * Aqui se estableces las rutas de acceso publicas
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;

Routes::parents("surveys");


// Registramos una encuesta.
Routes::post("", [SurveysController::class]);

// Obtenelos la lista de encuestadores.
Routes::get("surveyors", [SurveyorsController::class]);