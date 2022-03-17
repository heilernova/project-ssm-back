<?php
namespace App\Templates\Db;

class CaseDB
{
    public int $id;
    public string $date;
    public string $dni = "";
    public string $name = "";
    public string|null $birthDate = null;
    public string $cellphone = "";
    public string|null $email = null;
    public string $address = "";
    public string $eps = "";
    public int $regime = 0;
    public int $sisben = 0;
    public string $service = "";
    public string $accompaniment = "";
    public bool $status = false;
    public array $observations = [];

    function __construct()
    {
        $this->date .= "z";
        $this->name = strtolower($this->name);
        $this->email = strtolower($this->email);
        $this->address = strtolower($this->address);
    }
}