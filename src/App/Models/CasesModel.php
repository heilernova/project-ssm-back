<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\App;
use App\AppBaseModel;
use App\Templates\Db\CaseDB;
use App\Templates\Db\CaseObservationDB;

class CasesModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_requests");
    }

    public function get(int $id = null){
        $where_id = $id ? "AND id=?" : "";
        $where_request = $id ? "AND request=?" : "";
        $sql_request = "SELECT * FROM `vi_requests_history` WHERE `status`=1 $where_id ORDER BY `id` DESC";
        $sql_observactions = "SELECT t1.* FROM tb_requests_observations t1 INNER JOIN tb_requests t2 ON t2.id=t1.request AND t2.`status`=1 $where_request ORDER BY t1.id ASC";
        
        if ($id){
            $req = $this->database->execute($sql_request, [$id])->fecthObject(CaseDB::class);
            if ($req){
                $req->observations  = $this->database->execute($sql_observactions, [$id])->fetchAllObjects(CaseObservationDB::class);
            }
            return $req;
        }else{

            $req = $this->database->execute($sql_request)->fetchAllObjects(CaseDB::class);
            $obs = $this->database->execute($sql_observactions)->fetchAllObjects(CaseObservationDB::class);
    
            $req = array_map(function(CaseDB $item) use($obs){
    
                $id = $item->id;
                // $item->observations = $obs;
                $item->observations = array_reduce($obs, function($carry, CaseObservationDB $item) use ($id){
                    static $carry = [];
                    if ($item->valid($id)){
                        $carry[] = $item;
                    }
                    return $carry;
                });
    
                return $item;
            }, $req);

            return $req;
        }
    }


    /**
     * Regisrrea un nuevo caso en la base de datos.
     */
    public function insert($data):CaseDB|null
    {
        $id_user = App::getUser()->id;
        $data->user = $id_user;

        $res = $this->database->insert($data);
        if ($res->result){
            $this->commit();
            return $this->get($res->insertId);
        }else{
            return null;
        }
    }

    /**
     * Elimina un caso
     */
    public function delete(int $id):bool{
        $ok = $this->database->delete(["id=?", [$id]])->result;
        if ($ok){
            $this->commit();
        }
        return $ok;
    }

    /**
     * Actualiza la información de un caso
     */
    public function update(int $id, $data):bool{
        $ok = $this->database->update($data, ['id=?', [$id]])->result;

        if ($ok) $this->commit();

        return $ok;
    }
}