DROP FUNCTION if EXISTS fun_surveys_yes_no;

DELIMITER //
CREATE FUNCTION fun_surveys_yes_no(v_code INT)
RETURNS VARCHAR(30)
BEGIN
	CASE
		WHEN (v_code = 1) THEN RETURN 'SI';
		WHEN (v_code = 2) THEN RETURN 'NO';
		ELSE RETURN '';
	END CASE;
END; //