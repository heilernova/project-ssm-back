<?php
namespace App\Templates\Db;

class PersonDB
{
    public int $dni;
    public string $date;
    public string $name ="";
    public string $lastName = "";
    public string $cellphone = "";
    public bool|null $sex = null;
    public string|null $birthDate = null;
    public string $address = "";
    public int $eps;
    public bool $sisben = false;
    public bool $regime = false;
}