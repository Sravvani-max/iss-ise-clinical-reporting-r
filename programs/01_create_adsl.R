library(dplyr)
library(readr)
library(lubridate)

dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
dir.create("data/derived", recursive = TRUE, showWarnings = FALSE)

set.seed(123)

adsl <- tibble(
  STUDYID  = rep(c("STUDY01", "STUDY02"), each = 10),
  USUBJID  = c(sprintf("STUDY01-%03d", 1:10), sprintf("STUDY02-%03d", 1:10)),
  SITEID   = sample(c("101", "102", "103"), 20, replace = TRUE),
  AGE      = sample(35:75, 20, replace = TRUE),
  SEX      = sample(c("F", "M"), 20, replace = TRUE),
  RACE     = sample(c("WHITE", "ASIAN", "BLACK OR AFRICAN AMERICAN", "OTHER"), 20, replace = TRUE),
  ARM      = sample(c("Placebo", "DrugA"), 20, replace = TRUE),
  RANDDT   = as.Date("2025-01-01") + sample(0:30, 20, replace = TRUE),
  TRTSDT   = RANDDT + sample(0:5, 20, replace = TRUE),
  EOSDT    = TRTSDT + sample(60:180, 20, replace = TRUE)
) %>%
  mutate(
    TRTA  = ARM,
    TRTP  = ARM,
    SAFFL = "Y",
    ITTFL = "Y"
  )

write_csv(adsl, "data/derived/adsl.csv")

message("ADSL created: data/derived/adsl.csv")