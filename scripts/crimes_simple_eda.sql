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

-- Create some cumulative summaries to see how murder counts change month by month year on year.
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

-- get min/max data for lat/lng fields to ensure that there are no spurious points in the data.
-- we know that there are a number of NULL values each year that we will need to exclude in the R scripts
-- that query the database.
SELECT
	c_year,
	MIN(geo_lon) AS min_lon,
	MAX(geo_lon) AS max_lon,
	MIN(geo_lat) AS min_lat,
	MAX(geo_lat) AS max_lat
FROM crimes
GROUP BY c_year
ORDER BY c_year ASC;
	
-- There are clearly bad coordinates in the result set. -115W longitude is in Nevada and 34N is in 
-- New Mexico and these are common values for minimum lat/lng values in the database. The easiest way
-- to handle this will be to st_join the crime locations with the neighborhood geometries in R rather
-- than in the database.