library(dplyr)
library(readr)
library(tidyr)

adsl <- read_csv("data/derived/adsl.csv", show_col_types = FALSE)
adae <- read_csv("data/derived/adae.csv", show_col_types = FALSE)

dir.create("output/tables", recursive = TRUE, showWarnings = FALSE)

popn <- adsl %>%
  filter(SAFFL == "Y") %>%
  count(TRTA, name = "BIG_N")

ae_table <- adae %>%
  filter(TRTEMFL == "Y") %>%
  distinct(USUBJID, TRTA, AESOC, AEDECOD) %>%
  count(TRTA, AESOC, AEDECOD, name = "n") %>%
  left_join(popn, by = "TRTA") %>%
  mutate(
    pct = round((n / BIG_N) * 100, 1),
    result = paste0(n, " (", pct, "%)")
  ) %>%
  select(TRTA, AESOC, AEDECOD, result) %>%
  pivot_wider(names_from = TRTA, values_from = result)

write_csv(ae_table, "output/tables/ae_summary_by_soc_pt.csv")

message("AE summary table created: output/tables/ae_summary_by_soc_pt.csv")