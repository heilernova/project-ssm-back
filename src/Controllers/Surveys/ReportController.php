<?php

namespace ApiRest\Controllers\Surveys;

use ApiRest\BaseController;
use ApiRest\DB\Surveys\ReportsDB;
use HNova\Api\Api;
use HNova\Api\Response;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Shared\Date as SharedDate;

class ReportController extends BaseController
{

	/**
	 * Method: <<< GET >>>
	 * Retorna el total de las encuestas
	 */
	function getTotals(int $pollster, string $dateStart, string $dateEnd)
	{
		$db = Api::getRouteConfig()->getDatabase();
		$params = [];
		$where = "";
		if ($pollster > 0){
			$where = "user=? AND ";
			$params[] = $pollster;
		}

		$params[] = "$dateStart";
		$params[] = "$dateEnd";
		$where .= "`date` BETWEEN ? AND ?";

		$result = ['total' => 0];
		$result['eps'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_eps WHERE $where", $params)->fetchArray()[0];
		$result['ips'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips WHERE $where", $params)->fetchArray()[0];
		$result['hospitalization'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_hospitalization WHERE $where", $params)->fetchArray()[0];
		$result['laboratory'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_laboratorys WHERE $where", $params)->fetchArray()[0];
		$result['medicine'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_medicine WHERE $where", $params)->fetchArray()[0];
		$result['odontology'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_odontology WHERE $where", $params)->fetchArray()[0];
		$result['pharmacy'] = $db->execute("SELECT COUNT(*) FROM tb_surveys_ips_pharmacy WHERE $where", $params)->fetchArray()[0];
		
		foreach ($result as $value){
			$result['total'] += $value;
		}
		return $result;
	}

	/**
	 * Method: <<< GET >>>
	 * Crea un archivo EXCEL con el reporte de las encuesta
	 */
	function get(int $pollster, string $dateStart, string $dateEnd)
	{

		$db = Api::getRouteConfig()->getDatabase();
        $params = [];
        $where = "";
        if ($pollster > 0){
            $where = "pollsterId=? AND ";
            $params[] = $pollster;
        }

        $params[] = "$dateStart";
        $params[] = "$dateEnd";
        $where .= "`date` BETWEEN ? AND ?";

        $result['eps'] = $db->execute("SELECT * FROM vi_surveys_eps WHERE $where", $params)->fetchAll();
        $result['ips'] = $db->execute("SELECT * FROM vi_surveys_ips WHERE $where", $params)->fetchAll();
        $result['hospitalization'] = $db->execute("SELECT * FROM vi_surveys_ips_hospitalization WHERE $where", $params)->fetchAll();
        $result['laboratory'] = $db->execute("SELECT * FROM vi_surveys_ips_laboratorys WHERE $where", $params)->fetchAll();
        $result['medicine'] = $db->execute("SELECT * FROM vi_surveys_ips_medicine WHERE $where", $params)->fetchAll();
        $result['odontology'] = $db->execute("SELECT * FROM vi_surveys_ips_odontology WHERE $where", $params)->fetchAll();
        $result['pharmacy'] = $db->execute("SELECT * FROM vi_surveys_ips_pharmacy WHERE $where", $params)->fetchAll();

		$reports = $result;

		$temp =  Api::getConfig()->getDir() . "/../temp/Surveys.xlsx";
		$reader = IOFactory::createReader("Xlsx");
		$spreadsheet = $reader->load(Api::getConfig()->getDir() . "/../templates/Surveys.xlsx");

		// Cargamos las EPS
		$sheet = $spreadsheet->getSheetByName("EPS");
		$row = 3;
		foreach ($reports['eps'] as $files){
			unset($files['pollsterId']);
			$colum = 1;
			foreach ($files as $key=>$value){
				if ($key == "date"){
					$value = SharedDate::PHPToExcel($value);
				}
				$sheet->setCellValueByColumnAndRow($colum, $row, $value);
				// $sheet->getColumnDimensionByColumn($colum)->setAutoSize(true);
				$colum++; 
			}

			$row++;
		}

		// Cargamos la IPS
		$sheet = $spreadsheet->getSheetByName("IPS Primaria");
		$row = 3;
		foreach ($reports['ips'] as $files){
			unset($files['pollsterId']);
			$colum = 1;
			foreach ($files as $key=>$value){
				if ($key == "date"){
					$value = SharedDate::PHPToExcel($value);
				}
				$sheet->setCellValueByColumnAndRow($colum, $row, $value);
				// $sheet->getColumnDimensionByColumn($colum)->setAutoSize(true);
				$colum++; 
			}

			$row++;
		}

		// Cargamos las Hostitalizaciones
		$sheet = $spreadsheet->getSheetByName("Hospitalizaciones");
		$row = 3;
		foreach ($reports['hospitalization'] as $files){
			$colum = 1;
			unset($files['pollsterId']);
			foreach ($files as $key=>$value){
				if ($key == "date"){
					$value = SharedDate::PHPToExcel($value);
				}
				$sheet->setCellValueByColumnAndRow($colum, $row, $value);
				// $sheet->getColumnDimensionByColumn($colum)->setAutoSize(true);
				$colum++; 
			}

			$row++;
		}
		
		// Cargamos las laboratorio
		$sheet = $spreadsheet->getSheetByName("Laboratorio");
		$row = 3;
		foreach ($reports['laboratory'] as $files){
			$colum = 1;
			unset($files['pollsterId']);
			foreach ($files as $key => $value){
				
				if ($key == "date"){
					$value = SharedDate::PHPToExcel($value);
				}
				$sheet->setCellValueByColumnAndRow($colum, $row, $value);
				// $sheet->getColumnDimensionByColumn($colum)->setAutoSize(true);
				$colum++; 
			}

			$row++;
		}
		
		// Cargamos medicia general
		$sheet = $spreadsheet->getSheetByName("Medicina");
		$row = 3;
		foreach ($reports['medicine'] as $files){
			$colum = 1;
			unset($files['pollsterId']);
			foreach ($files as $key=>$value){
				if ($key == "date"){
					$value = SharedDate::PHPToExcel($value);
				}
				$sheet->setCellValueByColumnAndRow($colum, $row, $value);
				// $sheet->getColumnDimensionByColumn($colum)->setAutoSize(true);
				$colum++; 
			}

			$row++;
		}
		
		// Cargamos odontología
		$sheet = $spreadsheet->getSheetByName("Odontología");
		$row = 3;
		foreach ($reports['odontology'] as $files){
			$colum = 1;
			unset($files['pollsterId']);
			foreach ($files as $key=>$value){

				if ($key == "date"){
					$value = SharedDate::PHPToExcel($value);
				}
				$sheet->setCellValueByColumnAndRow($colum, $row, $value);
				// $sheet->getColumnDimensionByColumn($colum)->setAutoSize(true);
				$colum++; 
			}

			$row++;
		}

		// Cargamos la farmacia
		$sheet = $spreadsheet->getSheetByName("Farmacia");
		$row = 3;
		foreach ($reports['pharmacy'] as $files){
			$colum = 1;
			unset($files['pollsterId']);
			foreach ($files as $key=>$value){
				if ($key == "date"){
					$value = SharedDate::PHPToExcel($value);
				}
				$sheet->setCellValueByColumnAndRow($colum, $row, $value);
				// $sheet->getColumnDimensionByColumn($colum)->setAutoSize(true);
				$colum++; 
			}
			$row++;
		}
		
		$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
		$writer->save($temp);

		Response::setResponsetype('blob');
		return $temp;
	}
}