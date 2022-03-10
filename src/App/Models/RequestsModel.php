<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\AppBaseModel;

class RequestsModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_requests");
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

    public function insert($data):bool
    {
        return $this->database->insert($data)->result;
    }
}