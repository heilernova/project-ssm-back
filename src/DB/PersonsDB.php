<?php
namespace ApiRest\DB;

use ApiRest\BaseDB;
use ApiRest\Models\PersonModel;

class PersonsDB extends BaseDB
{
    public function __construct()
    {
        parent::__construct('tb_persons', 'ssm');
    }


    public function get($dni = null, int $limit = 1000):PersonModel|array|null
    {

        if ($dni){
            return $this->_database->execute("SELECT * FROM tb_persons WHERE dni=?", [$dni])->fecthObject(PersonModel::class);
        }else{
            $this->_database->execute("SELECT * FROM tb_persons WHERE dni=?", [$dni])->fetchAllObjects(PersonModel::class);
        }
        
    }

    public function insert($data, bool $auto_commit = true):?PersonModel
    {
        $ok = $this->_database->insert($data)->result;
        if ($ok){
            if ($auto_commit) $this->_database->commit();
            $dni = $data->dni;
            return $this->_database->execute("SELECT * FROM tb_persons WHERE dni=$dni")->fecthObject(PersonModel::class);
        }else{
            return null;
        }
    }

    public function update($dni, $data):bool
    {
        // return true;
        $ok = $this->_database->update($data, ['dni=?', [$dni]])->result;
        if ($ok){
            $this->_database->commit();
            return true;
        }else{
            return false;
        }
    }

    public function delete($id, $auto_commit = false):bool
    {
        $ok = $this->_database->delete(['id=?', [$id]])->result;
        if ($ok){
            if ($auto_commit) $this->database->commit();
            return true;
        }else{
            return false;
        }
    }
}