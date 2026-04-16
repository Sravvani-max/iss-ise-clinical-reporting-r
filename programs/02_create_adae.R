library(dplyr)
library(readr)
library(lubridate)

adsl <- read_csv("data/derived/adsl.csv", show_col_types = FALSE)

set.seed(456)

ae_terms <- tibble(
  AESOC   = c(
    "GASTROINTESTINAL DISORDERS",
    "GASTROINTESTINAL DISORDERS",
    "NERVOUS SYSTEM DISORDERS",
    "GENERAL DISORDERS",
    "SKIN DISORDERS"
  ),
  AEDECOD = c(
    "NAUSEA",
    "DIARRHOEA",
    "HEADACHE",
    "FATIGUE",
    "RASH"
  )
)

adae <- bind_rows(lapply(seq_len(nrow(adsl)), function(i) {
  n_ae <- sample(1:3, 1)
  chosen <- ae_terms[sample(1:nrow(ae_terms), n_ae, replace = TRUE), ]

  start_offsets <- sample(-5:40, n_ae, replace = TRUE)
  end_offsets   <- start_offsets + sample(1:10, n_ae, replace = TRUE)

  tibble(
    STUDYID = adsl$STUDYID[i],
    USUBJID = adsl$USUBJID[i],
    AESEQ   = seq_len(n_ae),
    AESOC   = chosen$AESOC,
    AEDECOD = chosen$AEDECOD,
    AESTDT  = adsl$TRTSDT[i] + start_offsets,
    AEENDT  = adsl$TRTSDT[i] + end_offsets,
    AESEV   = sample(c("MILD", "MODERATE", "SEVERE"), n_ae, replace = TRUE, prob = c(0.5, 0.4, 0.1)),
    AESER   = sample(c("N", "Y"), n_ae, replace = TRUE, prob = c(0.9, 0.1)),
    TRTA    = adsl$TRTA[i],
    TRTSDT  = adsl$TRTSDT[i]
  )
})) %>%
  mutate(
    TRTEMFL = if_else(AESTDT >= TRTSDT, "Y", "N"),
    AESEVN  = case_when(
      AESEV == "MILD" ~ 1,
      AESEV == "MODERATE" ~ 2,
      AESEV == "SEVERE" ~ 3,
      TRUE ~ NA_real_
    )
  ) %>%
  select(
    STUDYID, USUBJID, AESEQ, TRTA,
    AESOC, AEDECOD, AESTDT, AEENDT,
    AESEV, AESEVN, AESER, TRTEMFL
  )

write_csv(adae, "data/derived/adae.csv")

message("ADAE created: data/derived/adae.csv")