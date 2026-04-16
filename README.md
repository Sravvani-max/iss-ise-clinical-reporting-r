# End-to-End ISS/ISE Clinical Reporting Workflow in R

This project demonstrates a **sponsor-style statistical programming workflow** using R, designed to mirror real-world activities performed in **clinical trials, regulatory submissions, and FSP environments**.

---

## 🔑 Key Highlights

* Built **ADaM-style datasets**: ADSL, ADAE, ADTTE
* Implemented **treatment-emergent adverse event (TEAE) logic**
* Developed **ISS-style AE summary tables (SOC/PT level)**
* Performed **time-to-event analysis (Progression-Free Survival)**
* Generated **Kaplan-Meier survival plots**
* Created **oncology-specific waterfall plot** for tumor response
* Applied **RECIST-like thresholds**:

  * **-30% → Partial Response (PR)**
  * **+20% → Progressive Disease (PD)**
* Implemented **QC validation checks** across datasets
* Structured project following **industry-standard clinical programming practices**

---

## 📊 Analysis Datasets

| Dataset            | Description                              |
| ------------------ | ---------------------------------------- |
| **ADSL**           | Subject-level analysis dataset           |
| **ADAE**           | Adverse events dataset with TEAE flag    |
| **ADTTE**          | Time-to-event dataset (PFS)              |
| **ADRS (derived)** | Best % change dataset for waterfall plot |

---

## 📈 Outputs

* 📄 AE summary table (SOC / Preferred Term)
* 📉 Kaplan-Meier plot for Progression-Free Survival
* 📊 Waterfall plot for tumor response visualization
* ✅ QC validation summary report

---

## 🛠 Technologies Used

* **R Programming**
* tidyverse (dplyr, tidyr)
* ggplot2
* survival / survminer

---

## 📁 Project Structure

```text
data/
  raw/
  derived/

programs/
  01_create_adsl.R
  02_create_adae.R
  03_create_ae_summary_table.R
  04_create_adtte.R
  05_create_km_plot.R
  06_qc_checks.R
  07_create_waterfall_plot.R

output/
  tables/
  figures/
  report/

metadata/
docs/
```

---

## 🧠 Clinical Relevance

This project reflects real-world statistical programming tasks including:

* ADaM dataset creation aligned with SAP logic
* Integrated Safety/Efficacy-style reporting
* Oncology endpoint visualization
* QC and traceability considerations for submissions

---

## ⚠️ Disclaimer

All data used in this project are **simulated** and intended for demonstration purposes only.
No real clinical trial data is used.

---

## 💡 About This Project

This project was built to demonstrate **end-to-end clinical reporting capabilities** in R, including:

* dataset derivation
* analysis implementation
* visualization
* quality control

---

## 📌 Author

**Sravani Aripaka**
Senior Statistical Programmer
SAS | R | CDISC (SDTM, ADaM) | ISS/ISE | Oncology

---
