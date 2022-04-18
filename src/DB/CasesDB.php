<?php
namespace ApiRest\DB;

use ApiRest\BaseDB;
use ApiRest\Models\Cases\CaseModel as CasesCaseModel;
use ApiRest\Models\Cases\ObservationModel;

class CasesDB extends BaseDB
{
    public function __construct()
    {
        parent::__construct('tb_sac_cases', 'ssm');
    }


    public function get($id, int $limit = 1000)
    {
        
        $where_id = $id ? "AND id=?" : "";
        $where_request = $id ? "AND `case`=?" : "";
        $sql_request = "SELECT * FROM `vi_cases` WHERE `status`=1 $where_id ORDER BY `id` DESC";
        $sql_observactions = "SELECT t1.* FROM tb_sac_cases_comments t1 INNER JOIN tb_sac_cases t2 ON t2.id=t1.case AND t2.`status`=1 $where_request ORDER BY t1.id ASC";
        if ($id){
            $req = $this->_database->execute($sql_request, [$id])->fecthObject(CasesCaseModel::class);
            if ($req){
                $req->observations  = $this->_database->execute($sql_observactions, [$id])->fetchAllObjects(ObservationModel::class);
            }
            return $req;
        }else{

            $req = $this->_database->execute($sql_request)->fetchAllObjects(CasesCaseModel::class);
            $obs = $this->_database->execute($sql_observactions)->fetchAllObjects(ObservationModel::class);
    
            $req = array_map(function(CasesCaseModel $item) use($obs){
    
                $id = $item->id;
                $list_observations = array_reduce($obs, function($carry, ObservationModel $item) use ($id){
                    static $carry = [];
                    if ($item->valid($id)){
                        $carry[] = $item;
                    }
                    return $carry;
                });
                if (is_array($list_observations)) $item->observations = $list_observations;
    
                return $item;
            }, $req);
            
            return $req;
        }
    }

    public function insert($data, bool $auto_commit = false):bool
    {
        $ok = $this->database->insert($data)->result;
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