USE pandemic;
SELECT name as region, avg(Number_rabies), min(Number_rabies), max(Number_rabies), sum(Number_rabies)
FROM infectious_cases_norm as c
INNER JOIN regions as r ON r.region_id = c.region_id
WHERE Number_rabies != ''
GROUP BY region
ORDER BY avg(Number_rabies) DESC
LIMIT 10