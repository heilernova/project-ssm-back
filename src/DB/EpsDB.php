<?php
namespace ApiRest\DB;

use ApiRest\BaseDB;

class EpsDB extends BaseDB
{
    public function __construct()
    {
        parent::__construct('tb_eps', 'ssm');
    }


    public function get($id, int $limit = 1000)
    {
        $data = [
            "condition"=>['id=?', [$id]],
            'fields'=>'*'
        ];
        $this->database->select($data);
    }
    public function getActive(int $limit = 1000)
    {
        $data = [
            "condition"=>['disable=?', [0]],
            'fields'=>'*'
        ];
        return $this->_database->select($data)->fetchAll();
    }

    public function insert($data, bool $auto_commit = false):bool
    {
        $ok = $this->_database->insert($data)->result;
        if ($ok){
            if ($auto_commit) $this->database->commit();
            return true;
        }else{
            return false;
        }
    }

    public function update($data, $id, bool $auto_commit = false):bool
    {
        $ok = $this->database->update($data, ['id=?', [$id]])->result;
        if ($ok){
            if ($auto_commit) $this->database->commit();
            return true;
        }else{
            return false;
        }
    }

    public function delete($id, $auto_commit = false):bool
    {
        $ok = $this->database->delete(['id=?', [$id]])->result;
        if ($ok){
            if ($auto_commit) $this->database->commit();
            return true;
        }else{
            return false;
        }
    }
}