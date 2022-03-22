<?php
namespace App\Templates\Db;

use HNova\Api\ApiFunctions;

class PersonRequestDB{
    public string $dni = "";
    public string $dniType = "";
    public string $date = "";
    public string $name = "";
    public string $lastName = "";
    public string $cellphone = "";
    public string|null $email = null;
    public string|null $sex = null;
    public string|null $birthDate = null;
    public int|null $age = null;
    public string $address = "";
    public int $eps = 0;
    public string $epsName = "";
    public int $sisben = 0;
    public int $regime = 0;

    public function __construct()
    {
        if ($this->birthDate){
            $this->age = ApiFunctions::date($this->birthDate)->getDiff()->y;
        }
        if ($this->email){
            $this->email = strtolower($this->email);
        }
        $this->address = strtolower($this->address);
        $this->name = strtolower($this->name);
        $this->lastName = strtolower($this->lastName);
    }
}