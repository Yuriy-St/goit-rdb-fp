USE pandemic;
DROP FUNCTION IF EXISTS date_dif;
DELIMITER //
CREATE FUNCTION date_dif(year INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
	DECLARE res INT;
    SET res = datediff(CURDATE(), MAKEDATE(year, 1));
    RETURN res;
END //

DELIMITER ;

SELECT 
    name AS region, Year, date_dif(Year) as days_dif
FROM
    infectious_cases_norm AS c
        INNER JOIN
    regions AS r ON r.region_id = c.region_id