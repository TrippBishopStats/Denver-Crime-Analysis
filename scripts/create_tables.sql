CREATE TABLE offense_codes (
	object_id 				INT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_type_name 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	offense_category_name	VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN
);

COPY offense_codes(
	object_id, 
	offense_code, 
	offense_code_extension, 
	offense_type_id,
	offense_type_name,
	offense_category_id,
	offense_category_name,
	is_crime,
	is_traffic
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\offense_codes.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE IF EXISTS crime_2010;
CREATE TABLE crime_2010 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2010(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2010.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2011;
CREATE TABLE crime_2011 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2011(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2011.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2012;
CREATE TABLE crime_2012 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2012(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2012.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2013;
CREATE TABLE crime_2013 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2013(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2013.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2014;
CREATE TABLE crime_2014 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2014(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2014.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2015;
CREATE TABLE crime_2015 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2015(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2015.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2016;
CREATE TABLE crime_2016 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2016(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2016.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2017;
CREATE TABLE crime_2017 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2017(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2017.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2018;
CREATE TABLE crime_2018 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2018(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2018.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2019;
CREATE TABLE crime_2019 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2019(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2019.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2020;
CREATE TABLE crime_2020 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2020(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2020.csv'
DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS crime_2021;
CREATE TABLE crime_2021 (
	incident_id 			BIGINT,
	offense_id				BIGINT,
	offense_code 			VARCHAR(10),
	offense_code_extension 	INT,
	offense_type_id 		VARCHAR(255),
	offense_category_id 	VARCHAR(255),
	first_occurrence_date	VARCHAR(50),
	last_occurrence_date	VARCHAR(50),
	reported_date			VARCHAR(50),
	incident_address		VARCHAR(500),
	geo_x					VARCHAR(50),
	geo_y					VARCHAR(50),
	geo_lon					VARCHAR(50),
	geo_lat					VARCHAR(50),
	district_id				VARCHAR(10),
	precinct_id				INT,
	neighborhood_id			VARCHAR(255),
	is_crime				BOOLEAN,
	is_traffic				BOOLEAN,
	victim_count			INT
);

COPY crime_2021(
	incident_id,
	offense_id,
	offense_code,
	offense_code_extension,
	offense_type_id,
	offense_category_id,
	first_occurrence_date,
	last_occurrence_date,
	reported_date,
	incident_address,
	geo_x,
	geo_y,
	geo_lon,
	geo_lat,
	district_id,
	precinct_id,
	neighborhood_id,
	is_crime,
	is_traffic,
	victim_count
)
FROM 'D:\R-projects\Denver-Crime-Analysis\data\crime2021.csv'
DELIMITER ',' CSV HEADER;