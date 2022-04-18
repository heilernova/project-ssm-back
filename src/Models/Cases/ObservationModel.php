<?php
namespace ApiRest\Models\Cases;

class ObservationModel
{
    public int $id;
    public int $case  = 0;
    public string $date;
    public string $content;
    function __construct()
    {
        $this->date .= "z";
    }

    function valid($id):bool{
        return $this->case == $id ;
    }
}