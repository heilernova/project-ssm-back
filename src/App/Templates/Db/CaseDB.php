<?php
namespace App\Templates\Db;

use HNova\Api\ApiFunctions;

class CaseDB
{
    public int $id;
    public string $date;
    public string $dni = "";
    public string $name = "";
    public string|null $sex = null;
    public string|null $birthDate = null;
    public int|null $age = null;
    public string $cellphone = "";
    public string|null $email = null;
    public string $address = "";
    public string $eps = "";
    public int|null $regime = 0;
    public int|null $sisben = 0;
    public string $requiredAttention = "";
    public string $note = "";
    public bool $status = false;
    public array $observations = [];

    function __construct()
    {
        $this->date .= "z";
        $this->name = strtolower($this->name);
        $this->email = strtolower($this->email);
        $this->address = strtolower($this->address);
        if ($this->birthDate){
            $this->age = ApiFunctions::date($this->birthDate)->getDiff()->y;
        }
    }
}