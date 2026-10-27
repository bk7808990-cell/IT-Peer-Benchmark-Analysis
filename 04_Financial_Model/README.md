# Excel Financial Model: Peer Matrix & Margin Bridge

This document outlines the structure and logic of the Excel financial model built for this project. The model is divided into three key tabs, designed to translate raw financial data into actionable business insights.

## Tab 1: Peer Matrix (The Baseline)
This tab contains the raw data and core derived metrics for all 7 companies across 5 years (FY21-FY25).
- **Metrics Included:** Revenue (₹ Cr), EBITDA (₹ Cr), Employee Cost (₹ Cr), EBITDA Margin (%), and Employee Cost Ratio (%).
- **Key Features:** 
  - Calculates the **Peer Median** for every metric. (Why median? To ignore the distortion caused by extreme high/low performers like KPIT).
  - Ranks Persistent Systems against its peers for FY25 across all core metrics.

## Tab 2: Margin Bridge (The Gap Analysis)
This tab uses a **Waterfall Chart** to show exactly *where* and *how much* Persistent Systems is losing in EBITDA margin compared to the peer median.
- **Start Point:** Persistent Systems FY25 EBITDA Margin.
- **End Point:** Peer Median FY25 EBITDA Margin.
- **The Buckets (MECE Framework):**
  1.  **Employee Cost Effect:** How much margin is lost/gained due to a higher/lower Employee Cost Ratio.
  2.  **Other Cost Effect:** The impact of operational efficiencies (SG&A, etc.).
  3.  **Revenue Mix Effect:** The impact of scale and pricing power.

## Tab 3: Scenario & Sensitivity Analysis (Decision Support)
This tab answers the leadership's "What-If" questions.
- **Scenario Analysis:** 3-year forward projection under Base (current trajectory), Best (margin expansion), and Worst (margin contraction) cases.
- **Sensitivity Table:** A mini-table showing the impact on EBITDA margin if Employee Cost is reduced by 5%, 10%, or if Revenue drops by 5%. (E.g., A 5% cost reduction adds ~290 bps to the margin).

---
*Note: The actual Excel file (`06_Excel_Margin_Bridge_Model.xlsx`) will be uploaded to this folder. This README serves as the logic documentation for the file.*
