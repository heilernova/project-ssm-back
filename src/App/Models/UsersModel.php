<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Controllers;

use App\AppBaseModel;
use App\Templates\Db\UserDB;

class UsersModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_users");
    }

    /**
     * Busca la información del usuario en la base de datos.
     * @return object|null retorna null en caso de encontrar el usuario en la base de datos.
     */
    public function get(string $searh):?UserDB
    {
        $field = strpos($searh, '@') ? 'email' : 'username';

        return $this->database->execute("SELECT *  FROM tb_users WHERE $field=?", [$searh])->fecthObject(UserDB::class);
    }

    /**
     * Retorna un array con todos los usuarios registrados en la aplicación.
     * @return UserDB[]
     */
    public function getAll():array
    {
        return $this->database->execute("SELECT *  FROM tb_users")->fetchAllObjects(UserDB::class);
    }

    /**
     * Registra un usuario.
     * @return UserDB|null En caso de ser exitos retorna el objeto con el id generado, de lo contrario retorna null
     */
    public function add(UserDB $user):?UserDB
    {
        // unset($user->id); // Eliminamos 
        $result = $this->database->insert($user);
        if ($result->insertId > 0){
            $this->database->commit();
            $user->id = $result->insertId;
        }else{
            return null;
        }

    }

    /**
     * Deshabilita el acceso a un usuario
     */
    public function disable(int $id):bool
    {
        return $this->database->update(['disable'=>true], ['id=?', [$id]])->result;
    }
    
    /**
     * Habilita el acceso a un usuario
     */
    public function enable(int $id)
    {
        return $this->database->update(['disable'=>false], ['id=?', [$id]])->result;
    }

    /**
     * Valida que el token sea correcto
     * @return UserDB|null en caso de no ser correcto retorna null
     */
    public function validToken(string $token):?UserDB
    {
        return $this->database->execute("SELECT *  FROM tb_users WHERE token=?", [$token])->fecthObject(UserDB::class);
    }
}