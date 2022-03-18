<?php
/**
 * Clase controlador que contiene los metodos a ser ejecutados por las rutas.
 * 
 * todos lo métodos deben retornar un HNova\Api\Response
 */
namespace App\Controllers;

use App\App;
use App\AppBaseController;
use App\Models\CasesModel;
use App\Models\ObservationsModel;
use App\Models\RequestsModel;
use App\Templates\Db\RequestHistoryDB;
use App\Templates\Db\RequestHistoryObservationsDB;
use HNova\Api\Http\ResponseApi;
use HNova\Api\Response;

class CasesController extends AppBaseController
{
    private RequestsModel $requestModel;
    private CasesModel $_cases;
    private ObservationsModel $_observations;
    function __construct()
    {
        $this->requestModel = new RequestsModel();
        $this->_cases = new CasesModel();
        $this->_observations = new ObservationsModel();
        parent::__construct();
    }

    // Retorn todos los casos
    function get(int $id = null):Response
    {
        return new Response($this->_cases->get($id));
    }
    /**
     * Registra un nuevo caso en la base de datos.
     */
    function post():Response{
        $ok = $this->_cases->insert($this->getBody());
        return new Response($ok);
    }

    /**
     * Actualiza la información de un caso.
     */
    function put(int $id):Response{
        return new Response($this->_cases->update($id, $this->getBody()) ? true : null);
    }

    /**
     * Elimina un caso.
     */
    function delete(int $id):Response{
        return new Response($this->_cases->delete($id) ? true : null);
    }

    function postObservations(int $id):Response{
        return new Response($this->_observations->insert($id, $this->getBody()));
    }
}