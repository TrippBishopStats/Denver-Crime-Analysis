DROP PROCEDURE IF EXISTS update_table;
CREATE OR REPLACE PROCEDURE update_table(
	_tbl varchar(50)
)
LANGUAGE plpgsql
AS $$
BEGIN

-- Update emptry strings to NULLs.
EXECUTE format('UPDATE %s SET geo_x = NULL WHERE geo_x = '''';', _tbl);
EXECUTE format('UPDATE %s SET geo_y = NULL WHERE geo_y = '''';', _tbl);
EXECUTE format('UPDATE %s SET geo_lat = NULL WHERE geo_lat = '''';', _tbl);
EXECUTE format('UPDATE %s SET geo_lon = NULL WHERE geo_lon = '''';', _tbl);
EXECUTE format('UPDATE %s SET first_occurrence_date = NULL WHERE first_occurrence_date = '''';', _tbl);
EXECUTE format('UPDATE %s SET last_occurrence_date = NULL WHERE last_occurrence_date = '''';', _tbl);
EXECUTE format('UPDATE %s SET reported_date = NULL WHERE reported_date = '''';', _tbl);

-- Alter columns to be of the correct data type.
EXECUTE format('ALTER TABLE %s ALTER COLUMN geo_x TYPE DECIMAL USING geo_x::numeric;', _tbl);
EXECUTE format('ALTER TABLE %s ALTER COLUMN geo_y TYPE DECIMAL USING geo_y::numeric;', _tbl);
EXECUTE format('ALTER TABLE %s ALTER COLUMN geo_lon TYPE DECIMAL USING geo_lon::numeric;', _tbl);
EXECUTE format('ALTER TABLE %s ALTER COLUMN geo_lat TYPE DECIMAL USING geo_lat::numeric;', _tbl);
EXECUTE format('ALTER TABLE %s ALTER COLUMN first_occurrence_date TYPE TIMESTAMP USING first_occurrence_date::timestamp', _tbl);
EXECUTE format('ALTER TABLE %s ALTER COLUMN last_occurrence_date TYPE TIMESTAMP USING last_occurrence_date::timestamp;', _tbl);
EXECUTE format('ALTER TABLE %s ALTER COLUMN reported_date TYPE TIMESTAMP USING reported_date::timestamp;', _tbl);

-- Drop unneeded columns
EXECUTE format('ALTER TABLE %s DROP COLUMN is_traffic;', _tbl);
EXECUTE format('ALTER TABLE %s DROP COLUMN is_crime;', _tbl);
EXECUTE format('ALTER TABLE %s DROP COLUMN offense_type_id;', _tbl);
EXECUTE format('ALTER TABLE %s DROP COLUMN offense_category_id;', _tbl);

-- Update string fields what contain empty strings or back ticks
EXECUTE format('UPDATE %s SET district_id = NULL WHERE district_id = '''' OR district_id = ''`'';', _tbl);
EXECUTE format('UPDATE %s SET neighborhood_id = NULL WHERE neighborhood_id = '''';', _tbl);

-- Add new date related columns
EXECUTE format('ALTER TABLE %s ADD COLUMN c_year INT;', _tbl);
EXECUTE format('ALTER TABLE %s ADD COLUMN c_month INT;', _tbl);
EXECUTE format('ALTER TABLE %s ADD COLUMN c_day INT;', _tbl);
EXECUTE format('ALTER TABLE %s ADD COLUMN c_dow INT;', _tbl);

-- Add data to the new date related columns
EXECUTE format('UPDATE %s SET c_year = EXTRACT(YEAR FROM first_occurrence_date), '
			   'c_month = EXTRACT(MONTH FROM first_occurrence_date), '
			   'c_day = EXTRACT(DAY FROM first_occurrence_date), '
			   'c_dow = EXTRACT(ISODOW FROM first_occurrence_date);'
		, _tbl);
END; $$