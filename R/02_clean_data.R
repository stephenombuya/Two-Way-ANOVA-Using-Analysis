library(dplyr)
source("R/utils.R")

clean_data <- function(df) {

  log_message("Cleaning data...")

  # Remove missing values
  df <- df %>% na.omit()

  # Convert categorical variables
  df <- convert_to_factor(df, c(FACTOR_1, FACTOR_2))

  return(df)
}
