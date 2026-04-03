# Global configuration

options(stringsAsFactors = FALSE)

# Paths
DATA_RAW_PATH <- "data/raw/"
DATA_PROCESSED_PATH <- "data/processed/"
OUTPUT_PLOTS_PATH <- "outputs/plots/"
OUTPUT_TABLES_PATH <- "outputs/tables/"
OUTPUT_REPORTS_PATH <- "outputs/reports/"

# Columns (edit to match your dataset)
FACTOR_1 <- "factor1"
FACTOR_2 <- "factor2"
DEPENDENT_VAR <- "dependent_variable"

# Reproducibility
set.seed(123)
