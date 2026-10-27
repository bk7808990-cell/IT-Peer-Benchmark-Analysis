# Excel Financial Model: Peer Matrix & Margin Bridge

This document explains the exact logic, formulas, and structure of the Excel model (`06_Excel_Margin_Bridge_Model.xlsx`). The model is designed to be driver-based, meaning raw data is entered once, and all metrics update automatically.

## Tab 1: Peer Matrix (Data & Baseline Metrics)
This tab houses the raw historical data and calculates the core performance metrics for all 7 companies.

**Data Structure & Formulas:**
*   **Raw Data Columns:** `Company`, `Fiscal Year`, `Revenue`, `EBITDA`, `Employee Cost`.
*   **Derived Metric 1 (EBITDA Margin %):** `= EBITDA / Revenue * 100`
*   **Derived Metric 2 (Employee Cost Ratio %):** `= Employee Cost / Revenue * 100`
*   **Benchmark (Peer Median):** Instead of an average, I used `=MEDIAN(Range)` for FY25 metrics. Why? Because with a small sample (n=7), an outlier like KPIT (high margin) or Zensar (low margin) can distort the average. Median gives the true "middle" company.

## Tab 2: Margin Bridge (The Gap Analysis)
This tab uses a Waterfall Chart to isolate exactly *why* Persistent's margin is different from the Peer Median. 

**The Math & Framework (MECE):**
1.  **Start Point:** Persistent Systems FY25 EBITDA Margin (17.24%).
2.  **End Point:** Peer Median FY25 EBITDA Margin (Approx 18.40%).
3.  **The Gap:** The difference (Approx 1.16%) is broken down into impact buckets:
    *   **Employee Cost Effect:** `(Persistent Emp Cost Ratio - Median Emp Cost Ratio) * Persistent Revenue`. This shows how much margin was lost purely due to higher salary costs.
    *   **Operational Efficiency Effect:** The remaining gap, which represents other costs (SG&A, Rent, etc.) and revenue mix.

## Tab 3: Scenario & Sensitivity Analysis (Decision Support)
This tab provides leadership with forward-looking "What-If" scenarios.
- **Scenario Projection:** A 3-year forward view (FY26-FY28) under Base (current trajectory), Best (margin expansion by 100 bps), and Worst (margin contraction).
- **Sensitivity Table:** 
  - *What if Employee Cost drops by 5%?* -> Formula: `= New EBITDA / Revenue`. 
  - *What if Revenue drops by 5%?* -> Formula: `= EBITDA / New Revenue`.
  - This isolates the direct impact of cost-cutting vs. revenue loss.
