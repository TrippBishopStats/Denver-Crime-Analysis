SELECT COUNT(*) FROM crime_2019;

-- if a column has empty string values, convert them to NULL
UPDATE crime_2019
SET geo_x = NULL
WHERE geo_x = '';

UPDATE crime_2019
SET geo_y = NULL
WHERE geo_y = '';

UPDATE crime_2019
SET geo_lon = NULL
WHERE geo_lon = '';

UPDATE crime_2019
SET geo_lat = NULL
WHERE geo_lat = '';

UPDATE crime_2019
SET first_occurrence_date = NULL
WHERE first_occurrence_date = '';

UPDATE crime_2019
SET last_occurrence_date = NULL
WHERE last_occurrence_date = '';

UPDATE crime_2019
SET reported_date = NULL
WHERE reported_date = '';

-- now that the empty strings have been replaced with NULL, convert the columns to the correct data type.
ALTER TABLE crime_2019 
ALTER COLUMN geo_x TYPE DECIMAL USING geo_x::numeric;

ALTER TABLE crime_2019 
ALTER COLUMN geo_y TYPE DECIMAL USING geo_y::numeric;

ALTER TABLE crime_2019 
ALTER COLUMN geo_lon TYPE DECIMAL USING geo_lon::numeric;

ALTER TABLE crime_2019 
ALTER COLUMN geo_lat TYPE DECIMAL USING geo_lat::numeric;

ALTER TABLE crime_2019 
ALTER COLUMN first_occurrence_date TYPE DATE USING first_occurrence_date::date;

ALTER TABLE crime_2019 
ALTER COLUMN last_occurrence_date TYPE DATE USING last_occurrence_date::date;

ALTER TABLE crime_2019 
ALTER COLUMN reported_date TYPE DATE USING reported_date::date;

-- confirm the table changes took effect.
SELECT 
  column_name, 
  data_type, 
  character_maximum_length, 
  is_nullable, 
  column_default 
FROM 
  information_schema.columns 
WHERE 
  table_name = 'crime_2019';
  
-- Begin exploration of the columns and their data.
-- start by looking at the columns that we can remove: is_crime, is_traffic, offense_type_id,
-- offense_category_id
SELECT COUNT(*) FROM crime_2019 WHERE is_traffic = FALSE;
-- this returns all records, so this column doesn't carry any information in it.
SELECT COUNT(*) FROM crime_2019 WHERE is_crime = TRUE;
-- this also returns all records, so this column doesn't carry any information in it either.
-- we can drop both columns.
ALTER TABLE crime_2019 DROP COLUMN is_traffic;
ALTER TABLE crime_2019 DROP COLUMN is_crime;

/*
	We also don't need offense_type_id or offense_category_id as we can get this info from the 
	offense_codes table via a JOIN.
*/

ALTER TABLE crime_2019 DROP COLUMN offense_type_id;
ALTER TABLE crime_2019 DROP COLUMN offense_category_id;

-- Now let's quickly look at some of the other columns to sanity check their data.
-- start with district_id
SELECT DISTINCT(district_id) FROM crime_2019;
-- interesting mix of values. There are blank values, a "U", "8" and "9" are missing.
SELECT district_id, COUNT(*) AS totals FROM crime_2019 GROUP BY district_id ORDER BY totals DESC;

-- update the empty strings to NULL
UPDATE crime_2019
SET district_id = NULL
WHERE district_id = '';

-- explore victim_count
SELECT DISTINCT(victim_count) FROM crime_2019;
-- this data look good. No missing values and the value range is reasonable.
SELECT victim_count, COUNT(*) AS total FROM crime_2019 GROUP BY victim_count ORDER BY total DESC;
-- The vast majority of crimes involved a single victim, but the other numbers look reasonable. 
-- 32 in one go?!?

-- explore precinct_id
SELECT DISTINCT(precinct_id) FROM crime_2019;
-- There are 43 precincts. Let's get a sense of the distribution of crime counts within the precincts
SELECT precinct_id, COUNT(*) AS total FROM crime_2019 GROUP BY precinct_id ORDER BY total DESC;
-- The data look reasonable.

-- explore neighborhood_id
SELECT DISTINCT(neighborhood_id) FROM crime_2019;
-- There are 78 neighborhoods and empty string. Let's get a sense of the distribution of crime counts 
-- within the neighborhoods
SELECT neighborhood_id, COUNT(*) AS total FROM crime_2019 GROUP BY neighborhood_id ORDER BY total DESC;
-- The data look reasonable, but 752 incidents don't have a neighborhood. These will be updated to NULL.

UPDATE crime_2019
SET neighborhood_id = NULL
WHERE neighborhood_id = '';

-- explore offense_code
SELECT DISTINCT(offense_code) FROM crime_2019;
-- we have 135 of the 294 offense_codes represented in this table. Let's now look at extensions.
SELECT DISTINCT(offense_code_extension) FROM crime_2019;
-- codes 0-5 are represented in this data.
SELECT DISTINCT(offense_code, offense_code_extension) FROM crime_2019;
-- There are 177 distinct offense_code, offense_code_extension combinations
SELECT offense_code, offense_code_extension, COUNT(*) AS total 
FROM crime_2019 
GROUP BY offense_code, offense_code_extension
ORDER BY total DESC;

-- There aren't any missing values. The data look reasonable.
-- Sanity check that the previous groupings add back up to the total number of incidents
SELECT SUM(total)
FROM (
SELECT offense_code, offense_code_extension, COUNT(*) AS total 
FROM crime_2019 
GROUP BY offense_code, offense_code_extension
ORDER BY total DESC) AS groupings;
-- they do, so the data are coherant.

-- Lets see how many incidents are missing a lat/lng value.
SELECT COUNT(*) FROM crime_2019 WHERE geo_x ISNULL OR geo_y ISNULL;
-- There are 1044 incidents where one or both of the values is missing.
SELECT COUNT(*) FROM crime_2019 WHERE geo_lon ISNULL OR geo_lat ISNULL;
-- There are 1044 incidents where one or both of the values is missing. Are they the same records?
SELECT COUNT(*) 
FROM crime_2019 
WHERE geo_lon ISNULL AND geo_lat ISNULL
	AND geo_lon ISNULL AND geo_lat ISNULL;
-- Yes. This is indeed the case, all of this data is missing together.
-- Could we geocode the incidents with the address?
SELECT COUNT(*) 
FROM crime_2019 
WHERE geo_lon ISNULL AND geo_lat ISNULL
	AND geo_lon ISNULL AND geo_lat ISNULL
	AND incident_address ISNULL;
-- This returns a zero count, so all 1076 records have an address. If would be possible to geocode them
-- to generate lat/lng coordinates if we wanted to.

-- Now consider the date fields
-- How many incidents are missing first_occurrence_date?
SELECT COUNT(*) FROM crime_2019 WHERE first_occurrence_date ISNULL;
-- none, all records have a first_occurrence_date value.

-- How many incidents are missing last_occurrence_date?
SELECT COUNT(*) FROM crime_2019 WHERE last_occurrence_date ISNULL;
-- many, 34263 records are missing a last_occurrence_date value.

-- How many incidents are missing reported_date?
SELECT COUNT(*) FROM crime_2019 WHERE reported_date ISNULL;
-- none, all records have a reported_date value.

-- How often is the first_occurrence_date different to the reported_date?
SELECT COUNT(*) FROM crime_2019 WHERE first_occurrence_date <>reported_date;
-- quite often. In fact, this happens a little more than 33% of the time so we can't make assumptions
-- about either value based on what we know about the other.

-- Create new fields that will make it much easier to do month/day/year groupings.
ALTER TABLE crime_2019
ADD COLUMN c_year INT;

ALTER TABLE crime_2019
ADD COLUMN c_month INT;

ALTER TABLE crime_2019
ADD COLUMN c_day INT;

ALTER TABLE crime_2019
ADD COLUMN c_dow INT;

UPDATE crime_2019
SET c_year = EXTRACT(YEAR FROM first_occurrence_date),
c_month = EXTRACT(MONTH FROM first_occurrence_date),
c_day = EXTRACT(DAY FROM first_occurrence_date),
c_dow = EXTRACT(ISODOW FROM first_occurrence_date);

-- sanity check the new fields
SELECT COUNT(*) FROM crime_2019 WHERE c_year = 2019;
-- year is good. All incidents happened in 2014.
-- Let's look at the incident counts by month.
SELECT c_month, COUNT(*) AS total FROM crime_2019 GROUP BY c_month ORDER BY c_month ASC;
-- month looks good. do the numbers add up?
SELECT SUM(total)
FROM (
	SELECT c_month, COUNT(*) AS total FROM crime_2019 GROUP BY c_month
) 
AS month_crime;
-- Yes.

-- Let's look at the incident counts by day.
SELECT c_day, COUNT(*) AS total FROM crime_2019 GROUP BY c_day ORDER BY c_day ASC;
-- day looks good. do the numbers add up?
SELECT SUM(total)
FROM (
	SELECT c_day, COUNT(*) AS total FROM crime_2019 GROUP BY c_day
) 
AS day_crime;
-- Yes.

-- Let's look at the incident counts by day of the week.
SELECT c_dow, COUNT(*) AS total FROM crime_2019 GROUP BY c_dow ORDER BY c_dow ASC;
-- day of week looks good. do the numbers add up?
SELECT SUM(total)
FROM (
	SELECT c_dow, COUNT(*) AS total FROM crime_2019 GROUP BY c_dow
) 
AS dow_crime;
-- Yes.