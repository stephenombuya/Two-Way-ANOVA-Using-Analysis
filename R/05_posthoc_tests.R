source("R/utils.R")

run_posthoc <- function(model) {

  log_message("Running post-hoc tests (Tukey HSD)...")

  results <- TukeyHSD(model)

  write.table(
    capture.output(results),
    file = paste0(OUTPUT_TABLES_PATH, "posthoc_results.txt"),
    row.names = FALSE
  )

  log_message("Post-hoc results saved")

  return(results)
}
