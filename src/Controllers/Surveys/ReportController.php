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
	function __construct(public ReportsDB $_report = new ReportsDB())
	{
		
	}
	function getTotals(int $pollster, string $dateStart, string $dateEnd)
	{
		// return "Hola";
		return $this->_report->getTotals($pollster, $dateStart, $dateEnd);  
	}

	function get(int $pollster, string $dateStart, string $dateEnd)
	{
		// return "Hola munod";
		$reports = $this->_report->getReports($pollster, $dateStart, $dateEnd);

		try {
			//code...
			$temp =  Api::getConfig()->getDir() . "/../temp/Surveys.xlsx";
			$reader = IOFactory::createReader("Xlsx");
			$spreadsheet = $reader->load(Api::getConfig()->getDir() . "/../templates/Surveys.xlsx");
		} catch (\Throwable $th) {
			echo $th;
			
		}
			//throw $th;
		try {
			// $sheet = $spreadsheet->getActiveSheet();

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

			// Ips primaria
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
		} catch (\Exception $e) {
			return 'Ocurrió un error al intentar abrir el archivo ' . $e;
		}
	}
}