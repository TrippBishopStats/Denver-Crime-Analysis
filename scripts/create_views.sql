-- Burglaries residential
DROP VIEW IF EXISTS residential_burglary_dynamics_by_week;
CREATE OR REPLACE VIEW residential_burglary_dynamics_by_week AS
SELECT 
	c_year, 
	EXTRACT(WEEK FROM first_occurrence_date) AS c_week, 
	COUNT(*)
FROM crimes
WHERE offense_code = '2203' AND offense_code_extension = 0
GROUP BY c_year, c_week
ORDER BY c_year ASC, c_week ASC;

-- Burglaries business
DROP VIEW IF EXISTS business_burglary_dynamics_by_week;
CREATE OR REPLACE VIEW business_burglary_dynamics_by_week AS
SELECT 
	c_year, 
	TO_CHAR(TO_TIMESTAMP(c_month::text, 'MM'), 'Month') AS month_name,
	EXTRACT(WEEK FROM first_occurrence_date) AS c_week, 
	COUNT(*)
FROM crimes
WHERE offense_code = '2204' AND offense_code_extension = 0
GROUP BY c_year, c_month, c_week
ORDER BY c_year ASC, c_month ASC, c_week ASC;

-- Auto theft
DROP VIEW IF EXISTS auto_theft_dynamics_by_week;
CREATE OR REPLACE VIEW auto_theft_dynamics_by_week AS
SELECT 
	c_year, 
	TO_CHAR(TO_TIMESTAMP(c_month::text, 'MM'), 'Month') AS month_name,
	EXTRACT(WEEK FROM first_occurrence_date) AS c_week, 
	COUNT(*)
FROM crimes
WHERE offense_code = '2404' AND offense_code_extension = 0
GROUP BY c_year, c_month, c_week
ORDER BY c_year ASC, c_month ASC, c_week ASC;

-- Theft of auto parts
DROP VIEW IF EXISTS parts_theft_dynamics_by_week;
CREATE OR REPLACE VIEW parts_theft_dynamics_by_week AS
SELECT 
	c_year, 
	TO_CHAR(TO_TIMESTAMP(c_month::text, 'MM'), 'Month') AS month_name,
	EXTRACT(WEEK FROM first_occurrence_date) AS c_week, 
	COUNT(*)
FROM crimes
WHERE offense_code = '2304' AND offense_code_extension = 0
GROUP BY c_year, c_month, c_week
ORDER BY c_year ASC, c_month ASC, c_week ASC;

-- Burglaries residential
DROP VIEW IF EXISTS residential_burglary_dynamics_by_month;
CREATE OR REPLACE VIEW residential_burglary_dynamics_by_month AS
SELECT 
	TO_TIMESTAMP(CONCAT(c_year,'-', c_month), 'YYYY-MM') AS agg_date,
	TO_CHAR(TO_TIMESTAMP(c_month::text, 'MM'), 'Month') AS month_name, 
	COUNT(*)
FROM crimes
WHERE offense_code = '2203' AND offense_code_extension = 0
GROUP BY c_year, c_month
ORDER BY agg_date ASC;

-- Burglaries business
DROP VIEW IF EXISTS business_burglary_dynamics_by_month;
CREATE OR REPLACE VIEW business_burglary_dynamics_by_month AS
SELECT 
	TO_TIMESTAMP(CONCAT(c_year,'-', c_month), 'YYYY-MM') AS agg_date, 
	TO_CHAR(TO_TIMESTAMP(c_month::text, 'MM'), 'Month') AS month_name,
	COUNT(*)
FROM crimes
WHERE offense_code = '2204' AND offense_code_extension = 0
GROUP BY c_year, c_month
ORDER BY agg_date ASC;

-- Auto theft
DROP VIEW IF EXISTS auto_theft_dynamics_by_month;
CREATE OR REPLACE VIEW auto_theft_dynamics_by_month AS
SELECT 
	TO_TIMESTAMP(CONCAT(c_year,'-', c_month), 'YYYY-MM') AS agg_date, 
	TO_CHAR(TO_TIMESTAMP(c_month::text, 'MM'), 'Month') AS month_name, 
	COUNT(*)
FROM crimes
WHERE offense_code = '2404' AND offense_code_extension = 0
GROUP BY c_year, c_month
ORDER BY agg_date ASC;

-- Theft of auto parts
DROP VIEW IF EXISTS parts_theft_dynamics_by_month;
CREATE OR REPLACE VIEW parts_theft_dynamics_by_month AS
SELECT 
	TO_TIMESTAMP(CONCAT(c_year,'-', c_month), 'YYYY-MM') AS agg_date, 
	TO_CHAR(TO_TIMESTAMP(c_month::text, 'MM'), 'Month') AS month_name,
	COUNT(*)
FROM crimes
WHERE offense_code = '2304' AND offense_code_extension = 0
GROUP BY c_year, c_month
ORDER BY agg_date ASC;