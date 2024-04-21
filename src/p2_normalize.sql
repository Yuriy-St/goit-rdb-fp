use pandemic;
CREATE TABLE regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128),
    code VARCHAR(8)
);

insert into regions (name, code)
select distinct entity, code from infectious_cases;

CREATE TABLE infectious_cases_norm AS
SELECT * FROM infectious_cases;

ALTER TABLE infectious_cases_norm 
ADD case_id INT AUTO_INCREMENT NOT NULL FIRST,
ADD region_id INT NULL AFTER case_id,
ADD PRIMARY KEY (case_id),
ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);

UPDATE infectious_cases_norm AS c 
SET 
    region_id = (SELECT 
            region_id
        FROM regions AS r
        WHERE r.code = c.code)
WHERE
    c.case_id > 0;

ALTER TABLE infectious_cases_norm
DROP COLUMN Entity,
DROP COLUMN Code;

