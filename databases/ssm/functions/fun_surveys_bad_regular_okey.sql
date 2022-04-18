DROP FUNCTION if EXISTS fun_surveys_bad_regular_okey;

DELIMITER //
CREATE FUNCTION fun_surveys_bad_regular_okey(v_code INT)
RETURNS VARCHAR(30)
BEGIN
	CASE
		WHEN (v_code = 1) THEN RETURN 'MALO';
		WHEN (v_code = 2) THEN RETURN 'REGULAR';
		WHEN (v_code = 3) THEN RETURN 'BUENO';
		ELSE RETURN '';
	END CASE;
END; //