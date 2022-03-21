<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\AppBaseModel;
use App\Templates\Db\PersonDB;

class PersonsModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_persons");
    }

    /**
     * Retorna la información de una persona
     */
    public function get(string $dni):?PersonDB
    {
        $sql = "SELECT * FROM tb_persons WHERE dni=?";
        return $this->database->execute($sql, [$dni])->fecthObject(PersonDB::class);
    }

    /**
     * Retorna una lista de personas
     * @param int $limit Limite de los resultad por defecto es 1000
     * @return PersonDB[]
     */
    public function getAll(int $limit = 1000):array
    {
        return $this->database->execute("SELECT * FROM tb_persons LIMIT $limit")->fetchAllObjects(PersonDB::class);
    }

    /**
     * Registar en la base de datos los datos de un persona
     * @return PersonDB|null returna un objeto con la información de la persona registrada en caso
     */
    public function insert($data):?PersonDB
    {
        $ok  = $this->database->insert($data);
        if ($ok->result) {
            $this->database->commit();
            $dni = $data->dni;
            return $this->database->execute("SELECT * FROM tb_persons WHERE dni=$dni")->fecthObject(PersonDB::class);
        }else{
            return null;
        }
    }

    /**
     * Valida si el dni ya esta registrado.
     */
    public function validDNI(string $dni):bool
    {
        return $this->database->query("SELECT * FROM tb_persons WHERE dni=?", [$dni])->num_rows == 1;
    }

    /**
     * Actualiza la información de una persona
     * @return bool true si la actualización se genero correctamente.
     */
    public function update(string $dni, array|object $data):bool
    {
        return $this->database->update($data, ['dni=?', [$dni]])->result;
    }
}