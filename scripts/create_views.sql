CREATE OR REPLACE VIEW murder_dynamics_by_month AS 
SELECT c_year, c_month, oc.offense_type_name, COUNT(*) AS murder_count
FROM crimes
INNER JOIN offense_codes AS oc ON
oc.offense_code = crimes.offense_code AND
oc.offense_code_extension = crimes.offense_code_extension
WHERE oc.offense_category_id = 'murder'
GROUP BY c_year, c_month, oc.offense_type_name
ORDER BY c_year, c_month, oc.offense_type_name ASC;

CREATE OR REPLACE VIEW auto_theft_dynamics_by_month AS
SELECT c_year, c_month, oc.offense_type_name, COUNT(*) AS auto_theft_count
FROM crimes
INNER JOIN offense_codes AS oc ON
oc.offense_code = crimes.offense_code AND
oc.offense_code_extension = crimes.offense_code_extension
WHERE oc.offense_category_id = 'auto-theft'
GROUP BY c_year, c_month, oc.offense_type_name
ORDER BY c_year, c_month, oc.offense_type_name ASC;