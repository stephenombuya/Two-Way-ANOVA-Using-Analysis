# Load configs
source("config/config.R")

# Load modules
source("R/utils.R")
source("R/01_load_data.R")
source("R/02_clean_data.R")
source("R/03_exploratory_analysis.R")
source("R/04_anova_model.R")
source("R/05_posthoc_tests.R")

# Ensure output directories exist
ensure_dir(OUTPUT_PLOTS_PATH)
ensure_dir(OUTPUT_TABLES_PATH)
ensure_dir(OUTPUT_REPORTS_PATH)

log_message("Starting analysis pipeline...")

# 1. Load
df <- load_data("dataset1.csv")

# 2. Clean
df_clean <- clean_data(df)

# Save cleaned data
write.csv(df_clean, paste0(DATA_PROCESSED_PATH, "cleaned_data.csv"), row.names = FALSE)

# 3. EDA
plot_distribution(df_clean)
plot_interaction(df_clean)

# 4. ANOVA
model <- run_two_way_anova(df_clean)

# 5. Post-hoc
posthoc <- run_posthoc(model)

log_message("Analysis pipeline completed successfully.")
