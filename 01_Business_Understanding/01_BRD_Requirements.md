# Business Requirements Document (BRD)
## Project: IT Peer Benchmark & Strategic Gap Analysis

## 1. Project Background & Trigger (Why this project?)
While analyzing the Indian IT services sector, I noticed a trend: mid-tier companies are growing rapidly, but their profit margins are often squeezed by rising employee costs. Persistent Systems stood out—it has shown strong revenue growth, but its EBITDA margin has historically hovered around 17%, which seemed lower than its closest competitors. 

**The Trigger:** If I were a Business Analyst or Finance partner at Persistent, leadership would ask: *"We are growing, but are we as profitable and efficient as our competitors? If not, where exactly are we losing money, and how much is it costing us?"* This project is a direct response to that leadership query.

## 2. How the Business Questions were Framed
To answer the leadership's question, I didn't just guess metrics. I used a top-down approach based on the **IT Services business model**:
*   **Profitability:** Since IT is a service business, EBITDA Margin is the core health indicator.
*   **The Cost Driver:** In IT, 50-60% of revenue goes into salaries. So, the primary efficiency metric must be the *Employee Cost Ratio*.
*   **The Benchmark:** Comparing against a raw average is misleading due to outliers. Therefore, I decided to frame questions around the *Peer Median* and *Percentile Rankings* to get a true picture of where Persistent stands.

## 3. Business Objectives
| Objective | Metric | Target |
| :--- | :--- | :--- |
| Identify profitability gap | EBITDA Margin vs Peer Median | Quantify gap in basis points (bps) |
| Identify efficiency gap | Employee Cost Ratio vs Peer Median | Quantify gap in percentage (%) |
| Quantify financial impact | EBITDA lost vs Median | In ₹ Crores |
| Provide recommendations | Actionable steps | 3 strategic recommendations |

## 4. Project Scope
**In Scope:**
- 7 Indian IT services companies (Persistent Systems + 6 peers).
- Time Period: FY2021 to FY2025 (4-year growth window).
- Metrics: Revenue, EBITDA, Employee Cost, and Headcount.
- Deliverables: SQL Analysis, Financial Model, Power BI Dashboard, Insight Memo.

**Out of Scope:**
- FY2026 forward-looking estimates.
- Market Valuation metrics (P/E ratio, EV/EBITDA).
- DCF (Discounted Cash Flow) modeling.

## 5. Stakeholders
- **Business Leadership:** Needs to know where to optimize operations.
- **Finance Team:** Needs accurate benchmarking data.
- **Analyst (Me):** Responsible for data extraction, SQL analysis, and building the financial model.

## 6. Problem Statement (Current State)
- Persistent Systems' EBITDA margin is lagging compared to the peer group median.
- The Employee Cost Ratio is better than the median, indicating that the issue lies elsewhere.
- The leadership does not have a consolidated view of exactly *where* the gaps are and *how much* financial impact they carry.

## 7. Desired Outcome (Future State)
- Every core metric will have a quantified gap-to-median.
- A Margin Bridge (Waterfall) analysis will show exactly where the margin is leaking.
- The leadership will receive 3 actionable recommendations with estimated financial impact (₹ Cr).

## 8. Assumptions & Constraints
- **Data Source:** Publicly available financial data from Screener.in and Annual Reports (FY21-FY25).
- **Data Limitation:** Historical headcount data for FY21-FY23 was inconsistent across sources. To maintain data integrity, `Revenue per Employee` will only be calculated for FY24-FY25. For the 4-year trend, `Employee Cost Ratio` will be used.
- **Historical Data:** The analysis is strictly based on past performance, not future estimates.

## 9. Success Criteria
- [ ] Verified data for 7 companies across 4 years.
- [ ] 11 SQL queries executed with business insights.
- [ ] Excel Margin Bridge model built.
- [ ] 2-page Power BI dashboard created.
- [ ] 3 quantified recommendations delivered in the final memo.
