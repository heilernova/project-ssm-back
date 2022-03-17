<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\AppBaseModel;
use App\Templates\Db\RequestDB;

class RequestsModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_requests");
    }

    public function get(int $id){
        
    }

    public function getPerson(string $dni)
    {
        $info = null;

        $sql_persons = "SELECT * FROM tb_persons WHERE dni=?";
        $sql_request = "SELECT * FROM tb_requests WHERE dni=? ORDER BY id DESC LIMIT 1";

        $person = $this->database->query($sql_persons, [$dni])->fetch_assoc();
        if ($person){
            $info["person"] = $person;
            $info["request"] = $this->database->query($sql_request, [$dni])->fetch_assoc();
        }

        return $info;
    }

    /**
     * Registra un nuevo
     */
    public function insert($data):bool
    {
        return $this->database->insert($data)->result;
    }

    /**
     * Retorna una lista de los registros activos
     * @return RequestDB[]
     */
    public function getRegisterActive():array
    {
        $sql_request = "SELECT * FROM `vi_requests` WHERE `status`=1 LIMIT 1000";
        $sql_observactions = "SELECT * FROM `tb_requests_observations` t1 INNER JOIN tb_requests t2 ON t2.request=t1.id AND t2.`status`=1 ORDER BY t1.id ASC";
        
        $req = $this->database->execute($sql_request)->fetchAllObjects(RequestDB::class);
        $obs = $this->database->query($sql_observactions)->fetch_all(MYSQLI_ASSOC);

        $req = array_map(function($item)use($obs){
            // $item->observations = $obs['id'] ?? [];
            $id = $item->id;
            $item->observations = array_filter($obs, function($item) use ($id){ 
                return $item['request'] == $id;
            });
            return $item;
        }, $req);

        return $req;
    }
}