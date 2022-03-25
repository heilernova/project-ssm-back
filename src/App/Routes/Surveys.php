<?php
/**
 * Aqui se estableces las rutas de acceso publicas
 */
namespace App\Controllers;

use App\AppGuards;
use HNova\Api\Response;
use HNova\Api\Routes;
use HNova\Api\Routes\Route;

Routes::parents("surveys");

// Registramos una encuesta.
Routes::post("", [SurveysController::class]);

// Obtenelos la lista de encuestadores.
Routes::get("surveyors", [SurveyorsController::class]);

// Obtenemos la EPS 
Routes::get("eps", [EpsController::class, 'getAll']);

// IPS
Routes::get("ips", [SurveysController::class, 'ipsGet']);


// Guardamos la encues5ta
Routes::post("eps", [SurveyorsController::class, 'postEPS']);
Routes::post("ips", [SurveyorsController::class, 'postIPS']);
Routes::post("ips/hospitalization", [SurveyorsController::class, 'postIPSHospitalization']);
Routes::post("ips/laboratory", [SurveyorsController::class, 'postIPSLaboratory']);
Routes::post("ips/pharmacy", [SurveyorsController::class, 'postIPSPharmacy']);
Routes::post("ips/medicine", [SurveyorsController::class, 'postIPSMedicine']);
Routes::post("ips/odontology", [SurveyorsController::class, 'postIPSOdontology']);