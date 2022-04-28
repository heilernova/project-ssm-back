<?php
/**
 * Aqui ingrese la rutas de acceso a la api
 */

use ApiRest\Controllers\AuthController;
use ApiRest\Controllers\Cases\CommentsController;
use ApiRest\Controllers\CasesController;
use ApiRest\Controllers\EpsController;
use ApiRest\Controllers\PersonsController;
use ApiRest\Controllers\Surveys\ReportController;
use ApiRest\Controllers\SurveysController;
use ApiRest\Guard;
use HNova\Api\Api;
use HNova\Api\Routes;
use HNova\Api\Routes\Methods;

Routes::add('auth', Methods::Post, [AuthController::class]);
Routes::add('auth', Methods::Get, function(){ return true; });

// Routes::add('attention-community/cases', Methods::Get, [CasesController::class]);
Routes::add('eps/actives', Methods::Get, [EpsController::class, 'getActives']);

Routes::add('attention-community/cases', Methods::Post, [CasesController::class], [Guard::authenticate()]);
Routes::add('attention-community/cases/comments', Methods::Post, [CommentsController::class, ], [Guard::authenticate()]);
Routes::add('attention-community/cases/comments/{id:int}', Methods::Put, [CommentsController::class, ], [Guard::authenticate()]);
Routes::add('attention-community/cases/{id?}', Methods::Get, [CasesController::class], [Guard::authenticate()]);


Routes::add('attention-community/required-attentions', Methods::Get, [CasesController::class, 'requiredAttentions'], [Guard::authenticate()]);

Routes::add('attention-community/users/{dni:string}', Methods::Get, [CasesController::class, 'getUsers'], [Guard::authenticate()]);


Routes::add('persons', Methods::Post, [PersonsController::class]);
Routes::add('persons/{dni:string}', Methods::Get, [PersonsController::class]);
Routes::add('persons/{dni:string}', Methods::Put, [PersonsController::class]);

Routes::add('surveys', Methods::Post, [SurveysController::class]);
Routes::add('surveys/pollsters', Methods::Get, [SurveysController::class, 'getPollters']);

Routes::add('surveys/export/{pollster:int}/{dateStart:string}/{dateEnd:string}', Methods::Get, [ReportController::class], [Guard::authenticate()]);
Routes::add('surveys/totals/{pollster:int}/{dateStart:string}/{dateEnd:string}', Methods::Get, [ReportController::class, 'getTotals'], [Guard::authenticate()]);