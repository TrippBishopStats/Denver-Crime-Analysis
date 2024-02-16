-- quick query to see how crimes per month changes over the range of the dataset.
SELECT c_year, c_month, COUNT(*)
FROM crimes
GROUP BY c_year, c_month
ORDER BY c_year, c_month ASC

-- What are the distinct categories of offenses?
SELECT DISTINCT(offense_category_name) FROM offense_codes;

-- what are the difference types of "auto theft"?
SELECT * FROM offense_codes WHERE offense_category_id = 'auto-theft';

-- how many motor vehicle thefts occurred each month from 2010 to 2021?
SELECT c_year, c_month, COUNT(*)
FROM crimes
INNER JOIN offense_codes ON
offense_codes.offense_code = crimes.offense_code AND
offense_codes.offense_code_extension = crimes.offense_code_extension
WHERE offense_codes.offense_type_id = 'theft-of-motor-vehicle'
GROUP BY c_year, c_month
ORDER BY c_year, c_month ASC;

-- What are the different murder offenses?
SELECT * FROM offense_codes WHERE offense_category_id = 'murder';

-- take a quick look at all murders
SELECT c_year, c_month, COUNT(*)
FROM crimes
INNER JOIN offense_codes ON
offense_codes.offense_code = crimes.offense_code AND
offense_codes.offense_code_extension = crimes.offense_code_extension
WHERE offense_codes.offense_category_id = 'murder'
GROUP BY c_year, c_month
ORDER BY c_year, c_month ASC;

SELECT
	c_year, c_month, murder_count, SUM(murder_count) OVER (
		PARTITION BY c_year 
		ORDER BY c_month ASC
	) AS murder_cum_sum
FROM (
SELECT c_year, c_month, COUNT(*) AS murder_count
FROM crimes
INNER JOIN offense_codes ON
offense_codes.offense_code = crimes.offense_code AND
offense_codes.offense_code_extension = crimes.offense_code_extension
WHERE offense_codes.offense_category_id = 'murder'
GROUP BY c_year, c_month
ORDER BY c_year, c_month ASC
);


