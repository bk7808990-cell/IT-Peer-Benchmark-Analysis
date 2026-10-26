-- =========================================================================
-- Project: IT Peer Benchmark & Strategic Gap Analysis
-- File: 04_SQL_Queries.sql
-- Database: MySQL 8.0+ (Workbench compatible)
-- Table: peer_financials
-- =========================================================================

-- -------------------------------------------------------------------------
-- Query 1: Revenue CAGR (5-Year Growth)
-- Business Question: Kis company ka 5 saal ka growth sabse fast hai?
-- So-What: Highlights the industry growth leaders vs. laggards.
-- -------------------------------------------------------------------------
SELECT 
    a.company,
    ROUND((POWER(b.revenue / a.revenue, 1.0/5) - 1) * 100, 2) AS cagr_5_year_percent
FROM peer_financials a
JOIN peer_financials b ON a.company = b.company
WHERE a.fiscal_year = 'FY21' AND b.fiscal_year = 'FY25'
ORDER BY cagr_5_year_percent DESC;


-- -------------------------------------------------------------------------
-- Query 2: EBITDA Margin Trend for Persistent
-- Business Question: Persistent ka margin 5 saal mein kaise change hua?
-- So-What: Reveals if the margin is improving or shrinking over time.
-- -------------------------------------------------------------------------
SELECT 
    fiscal_year,
    ROUND((ebitda / revenue) * 100, 2) AS ebitda_margin_percent
FROM peer_financials
WHERE company = 'Persistent Systems'
ORDER BY fiscal_year;


-- -------------------------------------------------------------------------
-- Query 3: Employee Cost Ratio Trend
-- Business Question: Kaunsi company apni revenue ka sabse zyada hissa employees par kharch kar rahi hai?
-- So-What: A higher ratio means less money for EBITDA. Primary efficiency metric.
-- -------------------------------------------------------------------------
SELECT 
    company,
    fiscal_year,
    ROUND((employee_cost / revenue) * 100, 2) AS employee_cost_percent
FROM peer_financials
ORDER BY company, fiscal_year;


-- -------------------------------------------------------------------------
-- Query 4: Peer Ranking by Revenue (FY25)
-- Business Question: FY25 mein size ke hisaab se sabki rank kya hai?
-- So-What: Establishes where Persistent stands in terms of scale.
-- -------------------------------------------------------------------------
SELECT 
    company,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM peer_financials
WHERE fiscal_year = 'FY25';


-- -------------------------------------------------------------------------
-- Query 5: Percentile Ranking (FY25 EBITDA Margin)
-- Business Question: Persistent profitability mein top 10% mein hai ya bottom 20% mein?
-- So-What: Decision-grade positioning. Tells exactly how far they are from the top.
-- -------------------------------------------------------------------------
SELECT 
    company,
    ROUND((ebitda / revenue) * 100, 2) AS ebitda_margin_percent,
    ROUND(PERCENT_RANK() OVER (ORDER BY (ebitda / revenue) ASC) * 100, 2) AS percentile_rank
FROM peer_financials
WHERE fiscal_year = 'FY25';


-- -------------------------------------------------------------------------
-- Query 6: Gap-to-Peer Average Analysis (FY25)
-- Business Question: Persistent aur baaki peers ke average mein kitna gap hai?
-- So-What: Quantifies the exact revenue and EBITDA gap compared to the average peer.
-- -------------------------------------------------------------------------
SELECT 
    p.company,
    ROUND(p.revenue - a.avg_revenue, 2) AS revenue_gap,
    ROUND(p.ebitda - a.avg_ebitda, 2) AS ebitda_gap
FROM peer_financials p
JOIN (
    SELECT fiscal_year, AVG(revenue) as avg_revenue, AVG(ebitda) as avg_ebitda
    FROM peer_financials
    GROUP BY fiscal_year
) a ON p.fiscal_year = a.fiscal_year
WHERE p.company = 'Persistent Systems' AND p.fiscal_year = 'FY25';


-- -------------------------------------------------------------------------
-- Query 7: Revenue per Employee (FY24 & FY25 Only)
-- Business Question: Kaun sabse efficient hai per employee revenue generate karne mein?
-- So-What: Shows true workforce productivity. 
-- Note: employee_count > 0 is used because MySQL imported blank cells as 0.
-- -------------------------------------------------------------------------
SELECT 
    company,
    fiscal_year,
    ROUND(revenue / employee_count, 2) AS revenue_per_employee
FROM peer_financials
WHERE employee_count > 0
ORDER BY fiscal_year DESC, revenue_per_employee DESC;


-- -------------------------------------------------------------------------
-- Query 8: Sensitivity Analysis (Employee Cost -5%)
-- Business Question: Agar hum employee cost 5% kam kar dein toh margin kya hoga?
-- So-What: Gives leadership a "What-If" lever for cost-cutting.
-- -------------------------------------------------------------------------
SELECT 
    company,
    ROUND((ebitda / revenue) * 100, 2) AS current_margin_percent,
    ROUND(((ebitda + (employee_cost * 0.05)) / revenue) * 100, 2) AS new_margin_percent
FROM peer_financials
WHERE fiscal_year = 'FY25';


-- -------------------------------------------------------------------------
-- Query 9: YoY Revenue Growth (FY24 to FY25)
-- Business Question: Pichle saal ke muqable is saal kiska growth sabse zyada hai?
-- So-What: Shows the immediate momentum of the companies.
-- -------------------------------------------------------------------------
SELECT 
    a.company,
    ROUND(((b.revenue - a.revenue) / a.revenue) * 100, 2) AS yoy_growth_percent
FROM peer_financials a
JOIN peer_financials b ON a.company = b.company
WHERE a.fiscal_year = 'FY24' AND b.fiscal_year = 'FY25'
ORDER BY yoy_growth_percent DESC;


-- -------------------------------------------------------------------------
-- Query 10: EBITDA vs Peer Average Delta
-- Business Question: Average margin se peeche hone ki wajah se kitna EBITDA (₹ Cr) loss hua?
-- So-What: Translates percentage gaps into hard cash (₹ Cr) lost.
-- -------------------------------------------------------------------------
SELECT 
    p.fiscal_year,
    p.ebitda AS actual_ebitda,
    ROUND(a.avg_ebitda, 2) AS peer_avg_ebitda,
    ROUND(a.avg_ebitda - p.ebitda, 2) AS ebitda_lost
FROM peer_financials p
JOIN (
    SELECT fiscal_year, AVG(ebitda) as avg_ebitda
    FROM peer_financials
    GROUP BY fiscal_year
) a ON p.fiscal_year = a.fiscal_year
WHERE p.company = 'Persistent Systems';


-- -------------------------------------------------------------------------
-- Query 11: Composite Score (Overall Ranking)
-- Business Question: Overall kaun best hai (Margin + Efficiency combine karke)?
-- So-What: Creates a single leaderboard for overall performance.
-- -------------------------------------------------------------------------
SELECT 
    company,
    RANK() OVER (ORDER BY (ebitda / revenue) DESC) AS margin_rank,
    RANK() OVER (ORDER BY (revenue / employee_count) DESC) AS efficiency_rank,
    (RANK() OVER (ORDER BY (ebitda / revenue) DESC) + RANK() OVER (ORDER BY (revenue / employee_count) DESC)) AS total_composite_score
FROM peer_financials
WHERE fiscal_year = 'FY25' AND employee_count > 0
ORDER BY total_composite_score ASC;
