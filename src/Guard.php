<?php
/**
 * En esta clase puede agregar las restrcicioines de aceceso a las rutas del sistema
 * mediante el uso del los guard almacenso el calse estatica.
 * 
 * todos los método deverar retorna un callable
 */

namespace ApiRest;

use HNova\Api\Api;
use HNova\Api\Response;

class Guard
{
    public static function authenticate():callable
    {
        return function(){
            $header = apache_request_headers();
            $name_header = "ssm-access-token";
            $ok = false;
            // Validamos que el token exista
            if (array_key_exists($name_header, $header)){

                $database = Api::getRouteConfig()->getDatabase();

                $result = $database->execute("SELECT * FROM tb_users WHERE `token`=?", [$header[$name_header]])->fetchAssoc();

                if ($result){
                    $_ENV['user']  = $result;
                    $ok = true;
                }
            }

            if ($ok){
                return null;
            }else{
                Response::SetHttpResponseCode(401);
                return 'no - access';
            }
        };
    }
}