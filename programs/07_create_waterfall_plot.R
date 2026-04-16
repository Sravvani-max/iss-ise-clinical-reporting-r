library(dplyr)
library(readr)
library(ggplot2)

adsl <- read_csv("data/derived/adsl.csv", show_col_types = FALSE)

dir.create("output/figures", recursive = TRUE, showWarnings = FALSE)

set.seed(999)

waterfall <- adsl %>%
  transmute(
    STUDYID,
    USUBJID,
    TRTA,
    CHG = case_when(
      TRTA == "DrugA"   ~ sample(-85:35, n(), replace = TRUE),
      TRTA == "Placebo" ~ sample(-30:60, n(), replace = TRUE),
      TRUE ~ sample(-50:50, n(), replace = TRUE)
    )
  ) %>%
  arrange(CHG) %>%
  mutate(SUBJ_ORDER = row_number())

write_csv(waterfall, "data/derived/adrs_waterfall.csv")

p <- ggplot(waterfall, aes(x = reorder(USUBJID, CHG), y = CHG)) +
  geom_col(aes(fill = TRTA)) +
scale_fill_manual(values = c("DrugA" = "steelblue", "Placebo" = "orange")) +
 geom_hline(yintercept = -30, linetype = "dashed", color = "blue") +
geom_hline(yintercept = 20, linetype = "dashed", color = "red") +
  coord_flip() +
  labs(
    title = "Waterfall Plot of Best Percent Change from Baseline (RECIST-like Response)",
    x = "Subject",
    y = "Best % Change from Baseline"
  )

ggsave(
  filename = "output/figures/waterfall_plot.png",
  plot = p,
  width = 8,
  height = 10
)

message("Waterfall plot created: output/figures/waterfall_plot.png")
message("Waterfall dataset created: data/derived/adrs_waterfall.csv")
