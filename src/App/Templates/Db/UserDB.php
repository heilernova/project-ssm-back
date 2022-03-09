<?php
namespace App\Templates\Db;

class UserDB
{
    public int $id;
    public string $date = "";
    public string $username = "";
    public string $email = "";
    public string $password = "";
    public string $token = "";
    public int $rule = 0;
    public bool $disable = false;
}