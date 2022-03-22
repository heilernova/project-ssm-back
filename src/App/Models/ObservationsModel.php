<?php
/**
 * Clase modelo para intercturar con la base de datos.
 */
namespace App\Models;

use App\App;
use App\AppBaseModel;

class ObservationsModel extends AppBaseModel
{

    public function __construct()
    {
        parent::__construct("tb_requests_observations");
    }

    public function insert($id, string $content):object|null
    {
        $data = [
            "user" => App::getUser()->id,
            "request" => $id,
            "content" => $content,
        ];

        $ok = $this->database->insert($data);
        if ($ok->result){
            $this->database->commit();
            $id = $ok->insertId;
            return $this->database->execute("SELECT * FROM tb_requests_observations WHERE id = $id")->fecthObject();
        }
        return null;
    }

    public function update($id, string $content):bool{
        $ok = $this->database->update(['content'=>$content], ["id=?", [$id]])->result;
        if ($ok){
            $this->commit();
            return true;
        }
        return false;
    }

    public function delete($id):bool{
        $ok = $this->database->delete(["id=?", [$id]])->result;
        if ($ok){
            $this->commit();
            return true;
        }
        return false;
    }
}