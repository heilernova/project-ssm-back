<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\AppBaseModel;

class CommentsModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_requests_observations");
    }

    public function add($id, $data):object|null
    {
        $data->request = $id;
        $ok = $this->database->insert($data);
        if ($ok->result){
            $this->database->commit();
            $id = $ok->insertId;
            return $this->database->execute("SELECT * FROM tb_requests_observations WHERE id = $id")->fecthObject();
        }
        return null;
    }
}