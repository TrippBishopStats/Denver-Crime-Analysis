library(RPostgres)
# Make a query. The function handles establishing the connection, fetching the
# requested data, and then closing the connection.
db_make_query <- function(query) {
  con <- dbConnect(
    Postgres(),
    dbname = "denver_crime", 
    user = Sys.getenv("DB_USER"), 
    password = Sys.getenv("DB_PWD")
  )
  df_result <- dbGetQuery(con, query)
  dbDisconnect(con)
  return (df_result)
}
