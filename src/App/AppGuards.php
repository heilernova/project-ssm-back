<?php
/**
 * En esta clase puede agregar las restrcicioines de aceceso a las rutas del sistema
 * mediante el uso del los guard almacenso el calse estatica.
 * 
 * todos los método deverar retorna un callable
 */

namespace App;

use App\Controllers\UsersModel;
use HNova\Api\Response;

class AppGuards
{
    public static function authenticate():callable
    {
        return function(){
            $header = apache_request_headers();
            $name_header = "ssm-access-token";
            
            $ok = false;
            // Validamos que el token exista
            if (array_key_exists($name_header, $header)){
                $model = new UsersModel();
                $user = $model->validToken($header[$name_header]);
                if ($user){
                    $_ENV['user']  = $user;
                    $ok = true;
                }
            }

            return $ok ? null : new Response("not - access", 401);
        };
    }
}