library(dplyr)
library(readr)
library(lubridate)

adsl <- read_csv("data/derived/adsl.csv", show_col_types = FALSE)

set.seed(789)

adtte <- adsl %>%
  mutate(
    PARAMCD = "PFS",
    PARAM   = "Progression-Free Survival",
    CNSR    = sample(c(0, 1), n(), replace = TRUE, prob = c(0.65, 0.35)),
    EVENTDT = case_when(
      CNSR == 0 ~ TRTSDT + sample(30:150, n(), replace = TRUE),
      TRUE ~ as.Date(NA)
    ),
    ADT = case_when(
      CNSR == 0 ~ EVENTDT,
      TRUE ~ EOSDT
    ),
    STARTDT = TRTSDT,
    AVAL = as.numeric(ADT - STARTDT + 1)
  ) %>%
  select(
    STUDYID, USUBJID, TRTA,
    PARAMCD, PARAM, STARTDT, ADT, CNSR, AVAL
  )

write_csv(adtte, "data/derived/adtte.csv")

message("ADTTE created: data/derived/adtte.csv")