<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\AppBaseController;
use HNova\Api\ApiFunctions;
use HNova\Api\Http\ResponseApi;
use HNova\Api\Response;

class AuthController extends AppBaseController
{
    function autenticate():Response
    {
        $data = $this->getBody(); // Retorna un objecto con [ username, password ]
        
        $field = strpos($data->username, '@') ? 'email' : 'username';
        $sql = "SELECT * FROM tb_users WHERE $field=?";

        $user = $this->database->query($sql,[$data->username])->fetch_assoc();
        
        $res = new ResponseApi();
        $res->message->title = "Credenciales erroneas";
        $res->message->type = 1;

        if ($user){
            if (password_verify($data->password, $user['password'])){
                
                // En caso de que la constraseña sea correcta.
                $toke = ApiFunctions::generateToken(50);
                $ok = $this->database->update(['token'=>$toke], ["id=?", $user['id']], 'tb_users')->result;
                if ($ok){
                    $this->database->commit();
                    $res->data = [
                        "token" => $toke,   
                        "username" => $user["username"],
                        "rule" => $user["rule"]
                    ];
                    $res->status = true;
                }else{
                    $res->message->title = "Ups, Lo sentimos";
                    $res->message->content[] = "Ocurrio un error por favor intentalo nuevamente.";
                }
            }else{
                
                $res->message->content[] = "Contraseña incorrecta.";
            }
        }else{
            $res->message->content[] = "El usuario no se encutra registrado.";
        }
        
        return new Response($res);
    }
}