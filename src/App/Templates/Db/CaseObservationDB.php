<?php
namespace App\Templates\Db;

class CaseObservationDB
{
    public int $id;
    public int $request  = 0;
    public string $date;
    public string $content;
    function __construct()
    {
        $this->date .= "z";
    }

    function valid($id):bool{
        return $this->request == $id ;
    }
}