# Data Dictionary & Cleaning Log

## 1. Project Overview
This document serves as the single source of truth for the data used in the "IT Peer Benchmark & Strategic Gap Analysis" project. All SQL queries and dashboards are strictly based on this dataset and the limitations documented below.

## 2. Data Source
- **Primary Source:** Screener.in (Consolidated Financial Statements).
- **Secondary Source:** Annual Reports and Quarterly Investor Presentations (for Headcount verification).
- **Companies Covered:** Persistent Systems (Company X) and 6 Peers (KPIT, Coforge, Mphasis, LTTS, Cyient, Zensar).
- **Time Period:** FY2021 to FY2025 (5 Years).
- **Currency:** All financial figures are normalized to ₹ Crores (INR Cr).

## 3. Data Dictionary
The dataset contains the following columns:

| Column Name | Description | Data Type |
| :--- | :--- | :--- |
| `company` | Name of the IT services company | Text |
| `fiscal_year` | Indian Financial Year (April-March) | Text |
| `revenue` | Net Sales / Income from Operations | Number (₹ Cr) |
| `ebitda` | Operating Profit / PBDIT (excluding Other Income) | Number (₹ Cr) |
| `employee_cost` | Employee Benefit Expense | Number (₹ Cr) |
| `employee_count` | Total closing headcount at the end of the financial year | Number |

## 4. Cleaning Log (Data Limitations & Handling)
To ensure data integrity and transparency, the following limitations were identified and handled during the analysis:

1. **Headcount Data (FY21-FY23):** 
   - **Issue:** Historical headcount data across different sources (Annual reports vs. third-party aggregators) was inconsistent for the years FY2021, FY2022, and FY2023. 
   - **Handling:** To prevent any false analysis, `employee_count` is intentionally left blank for FY21-FY23 in the raw CSV. We have only recorded verified headcount data for FY24 and FY25.

2. **Handling Blank Cells during MySQL Import:**
   - **Issue:** When importing the raw CSV into MySQL Workbench, the blank cells in the `employee_count` column (for FY21-FY23) were automatically converted to `0`. 
   - **Handling:** To fix this and prevent division-by-zero errors, I explicitly used the filter `WHERE employee_count > 0` in my SQL queries (Query 7 and Query 11). This ensures that productivity metrics are only calculated for FY24 and FY25 where genuine data exists.

3. **Metrics Adjustments:**
   - Because 5-year headcount is unavailable, the metric `Revenue per Employee` will only be calculated for FY24 and FY25.
   - For the 5-year trend analysis, `Employee Cost Ratio` (Employee Cost / Revenue) will be used as the primary efficiency metric, as it does not require headcount.

4. **Data Scope:**
   - Any forward-looking estimates (like FY2026 projections available on Screener.in) have been strictly excluded. The project only analyzes historical, factual data up to FY2025.
