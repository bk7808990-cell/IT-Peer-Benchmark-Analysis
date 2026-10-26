# Data Dictionary & Cleaning Log

## 1. Data Source & Scope
To ensure the benchmarking analysis is factual and reliable, I carefully defined the data boundaries:
- **Source:** Financial data (Revenue, EBITDA, Employee Cost) was extracted from Screener.in. Headcount was verified using Annual Reports and Investor Presentations.
- **Time Frame:** The core analysis is restricted to a 5-year window from FY2021 to FY2025.
- **Data Scope (What was excluded):** Screener.in also displays forward-looking estimates for FY2026. Because this is a historical benchmarking project, I strictly excluded the FY2026 data to prevent the analysis from being polluted by estimates. The dataset only contains hard facts up to FY2025.

## 2. Data Dictionary
The dataset (`peer_financials.csv`) contains the following 6 fields:

| Column Name | Description | Data Type |
| :--- | :--- | :--- |
| `company` | Name of the IT services company | Text |
| `fiscal_year` | Indian Financial Year (April-March) | Text |
| `revenue` | Net Sales / Income from Operations | Number (₹ Cr) |
| `ebitda` | Operating Profit / PBDIT (excluding Other Income) | Number (₹ Cr) |
| `employee_cost` | Employee Benefit Expense | Number (₹ Cr) |
| `employee_count` | Total closing headcount at the end of the financial year | Number |

## 3. Data Cleaning Log (Challenges & Solutions)
During the project, I encountered specific data issues. Instead of ignoring them, I documented and resolved them to maintain data integrity:

**Challenge 1: Inconsistent Historical Headcount (FY21-FY23)**
- **Issue:** Historical headcount data for FY21, FY22, and FY23 was inconsistent across different public platforms. 
- **Solution:** To prevent false insights, I intentionally left `employee_count` blank for these three years in the CSV. Only verified numbers for FY24 and FY25 were recorded. As a result, metrics like `Revenue per Employee` are only calculated for the last two years.

**Challenge 2: The MySQL 'Blank to Zero' Import Bug**
- **Issue:** When I imported the CSV into MySQL Workbench for SQL analysis, the software automatically converted the blank headcount cells (FY21-FY23) into `0`. This is a known behavior in MySQL when the column data type is set to Integer.
- **Solution:** If I had divided revenue by `0`, it would have resulted in errors or fake metrics. To handle this, I built a safeguard directly into my SQL queries. In Query 7 and Query 11, I explicitly added the condition `WHERE employee_count > 0`. This ensures that the productivity metrics only calculate for the years where real headcount data exists, filtering out the dummy zeros.
