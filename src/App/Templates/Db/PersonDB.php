<?php
namespace App\Templates\Db;

use HNova\Api\ApiFunctions;

class PersonDB
{
    public int $dni;
    public string $date;
    public string $name = "";
    public string $lastName = "";
    public bool|null $sex = null;
    public string|null $birthDate = null;
    public int|null $years = null;
    public string $cellphone = "";
    public string $address = "";
    public int $eps = 0;
    public int $sisben = 0;
    public int $regime = 0;

    public function __construct()
    {
        $this->name = strtolower($this->name);
        $this->lastName = strtolower($this->lastName);

        if ($this->birthDate){
            $this->years = ApiFunctions::date($this->birthDate)->getDiff()->y;
        }
    }
}