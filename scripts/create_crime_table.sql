DROP TABLE IF EXISTS crimes;

CREATE TABLE crimes
AS
SELECT 
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2010
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2011
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2012
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2013
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2014
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2015
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2016
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2017
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2018
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2019
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2020
UNION
SELECT
	incident_id, offense_id, offense_code, offense_code_extension, first_occurrence_date,
	last_occurrence_date, reported_date, incident_address, geo_x, geo_y, geo_lon, geo_lat,
	district_id, precinct_id, neighborhood_id, victim_count, c_year, c_month, c_day, c_dow
FROM crime_2021;

ALTER TABLE crimes
ADD PRIMARY KEY (offense_id);

-- add foreign key to the offense_codes table for more efficient and valid joins
ALTER TABLE crimes
ADD CONSTRAINT fk_offense_code 
FOREIGN KEY (offense_code, offense_code_extension) 
REFERENCES offense_codes (offense_code, offense_code_extension);