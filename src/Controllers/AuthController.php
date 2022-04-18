<?php

namespace ApiRest\Controllers;

use ApiRest\BaseController;
use HNova\Api\Api;
use HNova\Api\Data\Database;
use HNova\Api\Funs;
use HNova\Api\HttpRequest;
use HNova\Api\Response;

class AuthController extends BaseController
{

	function post()
	{
		// header("Access-Control-Expose-Headers: nv-data");
		$data = HttpRequest::getContentBody(); // Retorna un objecto con [ username, password ]
		$database = Api::getRouteConfig()->getDatabase();
		$field = strpos($data->username, '@') ? 'email' : 'username';
		$sql = "SELECT * FROM tb_users WHERE $field=?";

		$user = $database->query($sql,[$data->username])->fetch_assoc();
	

		if ($user){

			// Validamos que el usuario no este bloqueado.
			if ($user['disable'] == 1){
				Response::addMessage("Tu cuenta se encuentra deshabilitada.");
			}else{

				if (password_verify($data->password, $user['password'])){
					
					// En caso de que la constraseña sea correcta.
					$toke = Funs::generateToken(50);
					$ok = $database->update(['token'=>$toke], ["id=?", $user['id']], 'tb_users')->result;
					if ($ok){
						$database->commit();
						return [
							"token" => $toke,   
							"username" => $user["username"],
							"rule" => $user["rule"]
						];
					}else{
						Response::addMessage("Ups, Lo sentimos");
						Response::addMessage("Ocurrio un error por favor intentalo nuevamente.");
						return null;
					}
				}else{
					
					Response::addMessage("Contraseña incorrecta.");
					return null;
				}
			}
		}else{
			Response::addMessage("El usuario no se encutra registrado.");
			return null;
		}
	}
}