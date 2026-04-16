# End-to-End ISS/ISE Workflow in R (ADaM + TLF + QC)

This project demonstrates a sponsor-style clinical trial reporting workflow using R, aligned with statistical programming activities in regulatory and FSP environments.

## 🔑 Highlights
- Developed ADaM-style datasets: ADSL, ADAE, ADTTE  
- Implemented treatment-emergent adverse event (TEAE) logic  
- Generated AE summary tables (ISS-style outputs)  
- Created Kaplan-Meier survival analysis (PFS)  
- Performed QC validation checks across datasets  
- Structured project using industry-standard folder organization  

## 📊 Datasets Created
- **ADSL** – Subject-level analysis dataset  
- **ADAE** – Adverse events analysis dataset  
- **ADTTE** – Time-to-event dataset (Progression-Free Survival)  

## 📈 Outputs
- AE summary table by SOC and PT  
- Kaplan-Meier plot for PFS  
- QC validation summary report  

## 🛠 Tools Used
- R  
- tidyverse (dplyr, tidyr)  
- survival, survminer  
- ggplot2  

## 📁 Project Structure
- `data/` → raw and derived datasets  
- `programs/` → analysis scripts  
- `output/` → tables, figures, reports  
- `docs/` → documentation  

## ⚠️ Note
All data in this project are simulated and used for demonstration purposes only.
