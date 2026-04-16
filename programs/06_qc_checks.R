library(dplyr)
library(readr)

dir.create("output/report", recursive = TRUE, showWarnings = FALSE)

adsl  <- read_csv("data/derived/adsl.csv", show_col_types = FALSE)
adae  <- read_csv("data/derived/adae.csv", show_col_types = FALSE)
adtte <- read_csv("data/derived/adtte.csv", show_col_types = FALSE)

qc_summary <- tibble(
  check = c(
    "ADSL has unique USUBJID",
    "ADAE subjects exist in ADSL",
    "ADTTE AVAL is positive",
    "ADTTE CNSR is 0 or 1"
  ),
  status = c(
    ifelse(nrow(adsl) == n_distinct(adsl$USUBJID), "PASS", "FAIL"),
    ifelse(all(adae$USUBJID %in% adsl$USUBJID), "PASS", "FAIL"),
    ifelse(all(adtte$AVAL > 0), "PASS", "FAIL"),
    ifelse(all(adtte$CNSR %in% c(0, 1)), "PASS", "FAIL")
  )
)

write_csv(qc_summary, "output/report/qc_summary.csv")

message("QC summary created: output/report/qc_summary.csv")