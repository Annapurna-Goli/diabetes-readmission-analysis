# Diabetes Readmission Analysis

## Project Overview
This project focuses on analyzing diabetic patient hospital readmission patterns using SQL, Python, and Power BI.

Current stage includes:
- Data cleaning using SQL
- Feature engineering
- Exploratory data analysis
- Initial business insights

Python (Pandas) and Power BI dashboards will be added in the next phase.

---

## Dataset
Dataset contains hospital records of diabetic patients including:
- demographics
- admission details
- medications
- diagnoses
- readmission status

---

## SQL Workflow

### 01_data_cleaning.sql
Performed:
- database creation
- table creation
- CSV import
- datatype corrections
- null value analysis

### 02_feature_engineering.sql
Performed:
- created readmitted_status column
- transformed target values into meaningful categories

### 03_exploratory_analysis.sql
Performed:
- distribution analysis
- null percentage analysis
- distinct value analysis
- categorical exploration

### 04_business_insights.sql
Performed:
- readmission analysis with respect to:
  - gender
  - age
  - admission type
  - discharge disposition
  - medications
  - inpatient visits
  - A1C results
  - procedures

Included initial SQL-based insights and observations.

---

## Current Findings
- Older age groups show higher readmission frequency
- Emergency admissions are linked with higher readmission
- Higher medication count may indicate increased readmission risk
- Patients with abnormal A1C results show higher readmission tendency

---

## Next Steps
- Handle diagnosis code grouping using Python
- Missing value treatment using Pandas
- Feature engineering for diagnosis categories
- Build Power BI dashboard
- Create predictive analysis workflow
