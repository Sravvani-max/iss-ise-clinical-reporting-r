library(dplyr)
library(readr)
library(survival)
library(survminer)

adtte <- read_csv("data/derived/adtte.csv", show_col_types = FALSE)

dir.create("output/figures", recursive = TRUE, showWarnings = FALSE)

fit <- survfit(Surv(AVAL, 1 - CNSR) ~ TRTA, data = adtte)

png("output/figures/km_pfs.png", width = 900, height = 700)
print(
  ggsurvplot(
    fit,
    data = adtte,
    risk.table = TRUE,
    conf.int = FALSE,
    pval = FALSE,
    title = "Kaplan-Meier Plot for PFS",
    xlab = "Days",
    ylab = "Progression-Free Survival Probability"
  )
)
dev.off()

message("KM plot created: output/figures/km_pfs.png")