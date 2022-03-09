<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\AppBaseModel;
use App\Templates\Db\EpsDB;

class EpsModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_eps");
    }

    /**
     * Retorna un array con las eps registradas
     * @return EpsBD[]
     */
    public function getAll():array
    {
        return $this->database->execute("SELECT * FROM tb_eps")->fetchAllObjects(EpsDB::class);
    }

    /**
     * Retorna la información de la eps buscada.
     */
    public function get(int $id):?EpsDB
    {
        return $this->database->execute("SELECT * FROM tb_eps WHERE id=?", [$id])->fecthObject(EpsDB::class);
    }

    /**
     * Registra los datos de la eps en la base de datos.
     */
    public function add(EpsDB $eps):?EpsDB
    {
        
        $ok = $this->database->insert($eps);
        if ($ok->result) {
            $this->database->commit();
            $eps->id = $ok->insertId;
            return $eps;
        }else{
            return null;
        }
    }

    /**
     * Desactiva la eps
     */
    public function desabele(int $id):bool
    {
        $ok = $this->database->update(["desable"=>true], ["id=?", [$id]])->result;
        if ($ok) $this->database->commit();
        return $ok;
    }

    /**
     * Activa la eps
     */
    public function enabele(int $id):bool
    {
        $ok = $this->database->update(["desable"=>false], ["id=?", [$id]])->result;
        if ($ok) $this->database->commit();
        return $ok;
    }

    /**
     * Valida que el nombre de la EPS no se encutre registrado.
     */
    public function validName(string $name):bool
    {
        return $this->database->query("SELECT * FROM tb_eps WHERE `name`=?", [$name])->num_rows == 1;
    }
}