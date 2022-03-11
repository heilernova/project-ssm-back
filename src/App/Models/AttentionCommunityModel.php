<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\AppBaseModel;

class AttentionCommunityModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("table");
    }


    public function getPerson(string $dni)
    {
        return $this->database->query("SELECT * FROM tb_requests WHERE dni=?", [$dni])->fetch_assoc();
    }
}