library(tidyverse)
library(janitor)
df_crime_2010 <- read_csv("data/crime2010.csv")
df_offense_codes <- read_csv("data/offense_codes.csv")

glimpse(df_crime_2010)
glimpse(df_offense_codes)

df_crime_2010 |> 
  distinct(offense_type_id)

df_offense_codes |> 
  distinct(OFFENSE_TYPE_ID)

# clean up the offense codes dataset.
df_offense_codes <- df_offense_codes |> 
  clean_names() |> 
  select(-c(is_crime, is_traffic))

df_offense_codes |> write_csv(file="data/offense-codes-prepped.csv")

# create a function of prepare each data file
prep_raw_data <- function(filename) {
  df_crime <- read_csv(filename)
  filename <- str_replace(filename, "\\.csv", "")
  output_filename <- paste(filename, "-prepped.csv", sep = "")
  
  df_crime <- df_crime |> 
    clean_names()
  
  # is the is_traffic feature really needed? Probably all 0's since this is a
  # crimes dataset.
  df_crime |> 
    distinct(is_traffic)
  
  # all records have 0, so we can drop this feature.
  df_crime <- df_crime |> 
    select(-is_traffic)
  
  # is the is_crime feature really needed? Probably all 1's since this is a
  # crimes dataset.
  
  df_crime |> 
    distinct(is_crime)
  
  # all records have 1, so we can drop this feature too.
  df_crime <- df_crime |> 
    select(-is_crime)
  
  # drop the incident address and the geo_x and geo_y fields. We also have
  # lat/lng data, and that will be sufficient to map the incident.
  df_crime <- df_crime |> 
    select(-c(incident_address, geo_x, geo_y))
  
  # offense data is available in the offense_codes dataset. We can drop
  # redundant fields here and then join to the offense_codes data if needed. The
  # two fields we need to keep are offense_code and offense_code_extension, we
  # can drop the others.
  df_crime <- df_crime |> 
    select(-c(offense_type_id, offense_category_id))
  
  # save the data out to a new flat file that can be read by other applications.
  df_crime |> write_csv(file=output_filename)
}

# get all files from the data directory that match the pattern "crimeYYYY.csv"
# and process them.
files <- list.files(path="data/", pattern="crime\\d{4}\\.csv$", full.names = TRUE)

# iterate over the data file collection and generate "prepped" versions of the
# files.
for(filename in files) {
  prep_raw_data(filename)
}
