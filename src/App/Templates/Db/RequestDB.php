<?php
namespace App\Templates\Db;

class RequestDB
{
    public int $id;
    public string $date;
    public bool $status = false;
    public int $user = 0;
    public string $dni = "";
    public int $service = 0;
    public string $accompaniment = "";
    public int $eps = 0;
    public bool $sisben = false;
    public bool $regime = false;
    public bool $olderAdult = false;
    public bool $disable = false;
    public bool $pregnant = false;
    public bool $womenHeadHousehold = false;
    public bool $afrodescendent = false;
    public bool $lgtbi = false;
    public bool $victim = false;
    public bool $displaced = false;
    public bool $demobilized = false;
    public bool $reinserted = false;
    public bool $palenRaizan = false;
    public bool $roomGintano = false;
    public bool $nnaNunaccompaniedAdult = false;
}