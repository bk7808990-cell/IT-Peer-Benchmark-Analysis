# IT Peer Benchmark & Strategic Gap Analysis: Persistent Systems

## Executive Summary
This repository contains an end-to-end benchmarking analysis of Persistent Systems against six mid-tier Indian IT peers (KPIT, Coforge, Mphasis, LTTS, Cyient, and Zensar). The analysis uses four years of public financial data (FY21-FY25) to evaluate operational efficiency and profitability. 

While Persistent Systems achieved the second-highest revenue growth in its peer group, the analysis uncovered a hidden profitability gap. By applying SQL, Excel financial modeling, and Power BI visualization, I identified that the company is losing money not due to high salaries, but due to operational overheads. The project concludes with data-backed strategic recommendations to recover over INR 500 Crores in EBITDA as a strategic target.

## The Business Problem (SCQA Framework)
- **Situation:** The Indian IT services sector is highly competitive. Mid-tier companies must balance aggressive growth with strict cost control.
- **Complication:** Persistent Systems is generating strong revenue, but it is not retaining enough of it as profit. The leadership lacked a quantified view of exactly where the money was leaking compared to competitors.
- **Question:** Where is the profit gap coming from, and what should be the strategic priority to fix it?
- **Answer:** The gap is driven by high Operations and SG&A costs. By streamlining these operations and optimizing employee costs, the company can add up to 288 basis points (bps) to its margin.

## Core Competencies Demonstrated
- **Business Strategy:** Problem framing using the SCQA framework, MECE structuring, and executive communication.
- **Financial Analysis:** P&L analysis, driver-based financial modeling, margin bridge (waterfall), and sensitivity analysis.
- **Data Analytics:** Data cleaning, advanced SQL querying (Window Functions, CTEs), DAX measures, and dashboarding.

## Key Findings (Data-Backed)
1. **The Growth vs. Profit Paradox:** Persistent has the second-highest 4-year Revenue CAGR (29.9%), but ranks fifth out of seven in EBITDA margin (17.24%).
2. **The Real Culprit:** Employee costs are actually under control (57.61% of revenue vs. 58.92% peer median). The real drag is Operations/SG&A costs, which account for a 254 bps hit to the margin.
3. **High Productivity:** The workforce is highly efficient, generating INR 48.54 Lakhs in revenue per employee (the **second-highest** in the peer group, behind Zensar).

## Strategic Recommendations
1. **Streamline Operations:** Implement Zero-Based Budgeting for administrative and facility costs (Target: +150 bps margin).
2. **Optimize Employee Cost:** Target a 5% reduction via better offshore utilization and bench reduction (Impact: +288 bps margin).
3. **Leverage Productivity:** Shift from chasing low-margin revenue to negotiating value-based, high-margin deals.

## Technical Methodology and Stack
- **Data Extraction and Cleaning:** Sourced 4-year P&L data from Screener.in. Handled historical data inconsistencies honestly (documented in the Data Dictionary).
- **SQL Analysis:** Wrote 11 robust queries in MySQL covering CAGR, Percentile Ranking, and Gap-to-Median analysis. Utilized Window Functions and CTEs for advanced benchmarking.
- **Financial Modeling:** Built a dynamic, driver-based model in Excel featuring a Margin Bridge and Scenario/Sensitivity analysis.
- **Data Visualization:** Created a two-page decision-grade dashboard in Power BI featuring KPI cards, Heatmaps, Waterfall bridges, and actionable insight captions.

## AI Integration and Workflow
AI was utilized as a productivity tool to accelerate delivery, not as a replacement for analytical thinking:
- **Debugging & Syntax:** Used AI to troubleshoot a MySQL import issue (blank cells converting to zero) and for quick syntax checks on DAX measures and SQL Window Functions.
- **Document Structuring:** Used AI to help format and structure the README and presentation outlines.
- **Human Override:** The business logic, data extraction, MECE framework, validation of all mathematical calculations, and final strategic recommendations were entirely driven by human analytical thinking. I personally reviewed every line of code and every number to ensure 100% accuracy before inclusion.

## Data Limitations and Transparency
Historical headcount data for FY21-FY23 was inconsistent across public platforms. To prevent false insights, Revenue per Employee was only calculated for FY24-FY25. For the four-year trend, Employee Cost Ratio was used as the primary efficiency metric. No fake data was generated. FY26 forward-looking estimates were strictly excluded.

## Repository Structure
- `01_Business_Understanding`: BRD, Peer Selection Memo, and Business Question Rationale.
- `02_Data_Foundation`: Raw Data CSV and Data Dictionary.
- `03_SQL_Analysis`: All 11 MySQL queries and Insights Summary.
- `04_Financial_Model`: Driver-based Excel Model.
- `05_PowerBI_Dashboard`: Power BI file, dashboard screenshots.
- `06_Recommendations`: 2-page Insight Memo.
- `07_Presentation`: Final 6-slide Executive Deck.
