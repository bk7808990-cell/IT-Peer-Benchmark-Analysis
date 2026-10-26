# Business Requirements Document (BRD)
## Project: IT Peer Benchmark & Strategic Gap Analysis

---

## 1. Executive Summary
Persistent Systems is a fast-growing mid-tier Indian IT services company. However, when its financial metrics are compared with 6 of its closest peers, there are visible gaps in profitability and employee efficiency. This project will benchmark Persistent Systems against these peers to quantify the exact gaps and provide actionable recommendations to the leadership.

## 2. Business Objectives

| Objective | Metric | Target |
| :--- | :--- | :--- |
| Identify profitability gap | EBITDA Margin vs Peer Median | Quantify gap in basis points (bps) |
| Identify efficiency gap | Employee Cost Ratio vs Peer Median | Quantify gap in percentage (%) |
| Quantify financial impact | EBITDA lost vs Median | In ₹ Crores |
| Provide recommendations | Actionable steps | 3 strategic recommendations |

## 3. Project Scope

**In Scope:**
- 7 Indian IT services companies (Persistent Systems + 6 peers).
- Time Period: FY2021 to FY2025 (5 years).
- Metrics: Revenue, EBITDA, Employee Cost, and Headcount.
- Deliverables: SQL Analysis, Financial Model, Power BI Dashboard, Insight Memo.

**Out of Scope:**
- FY2026 forward-looking estimates.
- Market Valuation metrics (P/E ratio, EV/EBITDA).
- DCF (Discounted Cash Flow) modeling.

## 4. Stakeholders

| Role | Responsibility |
| :--- | :--- |
| **Data/Business Analyst (Project Owner)** | Data collection, SQL analysis, financial modeling, and reporting. |
| **Business Leadership** | Using the insights for strategic decision-making. |
| **Finance Team** | Validation of financial metrics and assumptions. |

## 5. Problem Statement (Current State)
- Persistent Systems' EBITDA margin is lagging compared to the peer group median.
- The Employee Cost Ratio is higher than the most efficient peers, indicating an opportunity for operational optimization.
- The leadership does not have a consolidated view of exactly *where* the gaps are and *how much* financial impact they carry.

## 6. Desired Outcome (Future State)
- Every core metric will have a quantified gap-to-median.
- A Margin Bridge (Waterfall) analysis will show exactly where the margin is leaking.
- The leadership will receive 3 actionable recommendations with estimated financial impact (₹ Cr).

## 7. Assumptions & Constraints
- **Data Source:** Publicly available financial data from Screener.in and Annual Reports.
- **Data Limitation:** Historical headcount data for FY21-FY23 was inconsistent. Therefore, `Revenue per Employee` will only be calculated for FY24-FY25. For the 5-year trend, `Employee Cost Ratio` will be used.
- **Historical Data:** The analysis is strictly based on past performance, not future estimates.

## 8. Success Criteria
- [ ] Verified data for 7 companies across 5 years.
- [ ] 11 SQL queries executed with business insights.
- [ ] Excel Margin Bridge model built.
- [ ] 2-page Power BI dashboard created.
- [ ] 3 quantified recommendations delivered in the final memo.
