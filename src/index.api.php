<?php
/**
 * Script de entrada para el manejo de la API.
 */

use HNova\Api\Api;

require_once __DIR__.'./../vendor/autoload.php'; // Llamamos el autoload de composer.

/**
 * Iniciamos la app
 * el $_GET['url'] viene definido por la configuración del archivo .htaccess de la carpeta [ www ] 
 */
Api::run($_GET['url'] ?? '')->echo();