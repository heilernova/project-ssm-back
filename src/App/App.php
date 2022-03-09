<?php
namespace App;

use App\Templates\Db\UserDB;

class App
{
    public static function getUser():UserDB
    {
        return $_ENV['user'];
    }
}