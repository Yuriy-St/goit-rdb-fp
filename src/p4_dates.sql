USE pandemic;
SELECT 
    name AS region, Year, MAKEDATE(Year, 1) as year_begin, CURDATE() as today, datediff(CURDATE(), MAKEDATE(Year, 1)) as days_dif
FROM
    infectious_cases_norm AS c
        INNER JOIN
    regions AS r ON r.region_id = c.region_id