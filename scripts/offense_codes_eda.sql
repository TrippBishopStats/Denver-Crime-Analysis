SELECT * FROM offense_codes

-- first, confirm that we got all of the rows.
SELECT COUNT(*) FROM offense_codes
-- there are 300, so this checks out.

/*
Now, I suspect that the is_crime and is_traffic fields are not needed because the is_crime field will only
ever be TRUE and the is_traffic field only FALSE. If this is the case, we can alter the table by dropping
these columns.
*/
SELECT COUNT(*) FROM offense_codes WHERE is_crime = TRUE
SELECT COUNT(*) FROM offense_codes WHERE is_traffic = TRUE AND is_crime = FALSE
-- There are 6 records related to traffic codes. We can delete these records and then drop the two columns.
DELETE FROM offense_codes WHERE is_traffic = TRUE AND is_crime = FALSE
-- confirm the deletion
SELECT COUNT(*) FROM offense_codes WHERE is_crime = TRUE AND is_traffic = FALSE
/*
that confirms the 6 deletions. There are also 2 records in the table where is_crime AND is_traffic are
TRUE. Since the is_crime condition is satified, these two rows will be kept.
*/

-- Now, drop the unneeded columns
ALTER TABLE offense_codes DROP COLUMN is_crime;
ALTER TABLE offense_codes DROP COLUMN is_traffic;

-- confirm the columns are dropped.
SELECT 
  column_name, 
  data_type, 
  character_maximum_length, 
  is_nullable, 
  column_default 
FROM 
  information_schema.columns 
WHERE 
  table_name = 'offense_codes';
-- looks good, columns are gone.

-- now, lets get a sense for what values exist in the remaining columns

-- start with the object id.
SELECT DISTINCT(object_id) FROM offense_codes;
/*
They are all unique. We could probably make this field a primary key, but it may actually be unnecesary
because it may not be a field that is used as a foreign key in the crime tables. We may ultimately drop
this column too.
*/

-- move on to the offense_code column
SELECT DISTINCT(offense_code) FROM offense_codes;
/*
There are 225 unique values. The code extension field probably comes into play here. it might be the case
that we set up a compound key with offense_code and offense_code_extention. With that in mind, let's look
at the offense_code_extension column.
*/
-- move on to the offense_code column
SELECT DISTINCT(offense_code_extension) FROM offense_codes;

-- There are 7 unique values. Now that we know this, lets look at the distinct combos
SELECT DISTINCT(offense_code, offense_code_extension) FROM offense_codes;

/*
Okay, so there are 294 distinct values, so this combo DOES unique identify the records. This will be
used as a primary key and then we can drop the object_id field.
*/

ALTER TABLE offense_codes ADD PRIMARY KEY (offense_code, offense_code_extension);

-- confirm the change
SELECT tc.table_schema, tc.table_name, kc.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kc 
  ON kc.table_name = tc.table_name 
  AND kc.table_schema = tc.table_schema 
  AND kc.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'PRIMARY KEY'
  AND kc.ordinal_position IS NOT null
  AND tc.table_name = 'offense_codes'
ORDER BY tc.table_schema,
         tc.table_name,
         kc.position_in_unique_constraint;
-- primary key is in place. Now drop the unneed column object_id.
ALTER TABLE offense_codes DROP COLUMN object_id;

SELECT 
  column_name, 
  data_type, 
  character_maximum_length, 
  is_nullable, 
  column_default 
FROM 
  information_schema.columns 
WHERE 
  table_name = 'offense_codes';
  -- Confirmed that the column is removed.
  
-- Continuing with the exploration, let's look at the distinct values for offense_type_id.
SELECT DISTINCT(offense_type_id) FROM offense_codes;
-- There are 289 unique values. What about unique type names?
SELECT DISTINCT(offense_type_name) FROM offense_codes;
-- There are 287 unique values. The code extension may explain this.
-- Now look at offense_category_id.
SELECT DISTINCT(offense_category_id) FROM offense_codes;
-- There are 14 unique values including a catch all, "all-other-crimes"
SELECT DISTINCT(offense_category_name) FROM offense_codes;
-- Again, 14 distinct values.
-- Let's make sure that there are only 14 combos. This will identify any records that are not consistent.
SELECT DISTINCT(offense_category_id, offense_category_name) FROM offense_codes;
-- There are only 14 results, so there are no concerns about inconsistent records.