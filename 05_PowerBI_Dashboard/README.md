# Power BI Dashboard: Peer Benchmark & Strategic Gaps

This document outlines the design, logic, and visual structure of the Power BI dashboard (`07_Peer_Benchmark_Dashboard.pbix`). The dashboard is designed to be "Decision-Grade", meaning every visual answers a specific business question for the leadership.

## Data Lineage
All visuals are connected to the `peer_financials` dataset. The core metrics (EBITDA Margin, Employee Cost Ratio) are calculated using DAX measures, ensuring they dynamically update if the data changes.

## Page 1: Peer Comparison (The "What")
**Objective:** To give a quick, scannable overview of where Persistent Systems stands against its peers in FY25.

*   **KPI Cards (Top):** Persistent Revenue, Persistent EBITDA Margin, and Peer Average Margin.
*   **Heatmap Matrix (Visual 1):** A 7x4 matrix showing Company vs Metrics (EBITDA Margin, Employee Cost Ratio). Conditional formatting (Red-Yellow-Green) is used to instantly highlight who is best and worst in each category.
*   **Ranking Bar Charts (Visual 2 & 3):** Two bar charts showing the ranking of all 7 companies by EBITDA Margin and Employee Cost Ratio. Persistent is highlighted in a distinct blue color, while peers are in grey.

## Page 2: Strategic Gaps (The "So-What")
**Objective:** To quantify the gap and show exactly where the money is leaking for Persistent Systems.

*   **Gap-to-Average Bar Chart (Visual 4):** Shows the exact gap in ₹ Crores for Revenue and EBITDA compared to the peer average.
*   **Margin Bridge Breakdown (Visual 5):** A visual showing the 2 MECE buckets (Employee Cost Effect and Operations Effect) that explain the 1.13% margin gap.
*   **Scenario Projection (Visual 6):** A 3-year line chart showing Base, Best, and Worst-case revenue growth projections.
*   **Insight Captions:** Every single visual has a 1-line text box below it explaining the "So-What" (e.g., "Persistent lags peers by 113 bps in margin").

## Design Principles
*   **No Clutter:** Clean layout with a consistent color theme.
*   **Excluded:** No scatter plots or correlation visuals, as n=7 is statistically too small for reliable correlation.
