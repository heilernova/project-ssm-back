<?php
namespace App\Templates\Db;

use HNova\Api\ApiFunctions;

class PersonDB
{
    public string $dni = '';
    public string $date;
    public string $name = "";
    public string $lastName = "";
    public string|null $sex = null;
    public string|null $birthDate = null;
    public int|null $age = null;
    public string $cellphone = "";
    public string $address = "";
    public int|null $eps = null;
    public int|null $sisben = null;
    public int|null $regime = null;

    public function __construct($data = null)
    {
        if ($data){
            foreach ($data as $key => $value){
                if (isset($this->$key)){
                    $this->$key = $value;
                }
            }
        }
        $this->name = strtolower($this->name);
        $this->lastName = strtolower($this->lastName);

        if ($this->birthDate){
            $this->age = ApiFunctions::date($this->birthDate)->getDiff()->y;
        }
    }
}