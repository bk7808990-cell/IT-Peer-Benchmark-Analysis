-- =========================================================================
-- Project: IT Peer Benchmark & Strategic Gap Analysis
-- File: 04_SQL_Queries.sql
-- Database: MySQL 8.0+ (Workbench compatible)
-- Table: peer_financials
-- =========================================================================

-- -------------------------------------------------------------------------
-- Query 1: Revenue CAGR (4-Year Growth: FY21 to FY25)
-- Business Question: Kis company ka 4 saal (FY21-FY25) ka growth sabse fast hai?
-- So-What: Highlights the industry growth leaders vs. laggards.
-- -------------------------------------------------------------------------
SELECT 
    a.company,
    ROUND((POWER(b.revenue / a.revenue, 1.0/4) - 1) * 100, 2) AS cagr_4_year_percent
FROM peer_financials a
JOIN peer_financials b ON a.company = b.company
WHERE a.fiscal_year = 'FY21' AND b.fiscal_year = 'FY25'
ORDER BY cagr_4_year_percent DESC;


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
-- Query 5: Peer Median Margin (FY25) - Excluding Persistent
-- Business Question: Baaki 6 peers ka median margin kya hai?
-- So-What: True benchmark to compare Persistent against.
-- -------------------------------------------------------------------------
WITH PeerMargins AS (
    SELECT 
        company,
        (ebitda / revenue) * 100 AS margin_pct
    FROM peer_financials
    WHERE fiscal_year = 'FY25' AND company != 'Persistent Systems'
),
RankedMargins AS (
    SELECT margin_pct, 
           ROW_NUMBER() OVER (ORDER BY margin_pct) as rn,
           COUNT(*) OVER() as cnt
    FROM PeerMargins
)
SELECT 
    ROUND(AVG(margin_pct), 2) AS peer_median_margin
FROM RankedMargins
WHERE rn IN (FLOOR((cnt+1)/2), CEIL((cnt+1)/2));


-- -------------------------------------------------------------------------
-- Query 6: Gap-to-Peer Median Analysis (FY25)
-- Business Question: Persistent aur Peer Median ke beech exact gap kya hai?
-- So-What: Quantifies the exact financial impact in ₹ Cr.
-- -------------------------------------------------------------------------
WITH PeerMedian AS (
    SELECT AVG(margin_pct) as med_margin
    FROM (
        SELECT (ebitda / revenue) * 100 AS margin_pct, 
               ROW_NUMBER() OVER (ORDER BY (ebitda / revenue)) as rn,
               COUNT(*) OVER() as cnt
        FROM peer_financials
        WHERE fiscal_year = 'FY25' AND company != 'Persistent Systems'
    ) sub
    WHERE rn IN (FLOOR((cnt+1)/2), CEIL((cnt+1)/2))
)
SELECT 
    p.company,
    ROUND((p.ebitda / p.revenue) * 100, 2) AS persistent_margin,
    ROUND(pm.med_margin, 2) AS peer_median_margin,
    ROUND(pm.med_margin - ((p.ebitda / p.revenue) * 100), 2) AS gap_bps,
    ROUND(((pm.med_margin - ((p.ebitda / p.revenue) * 100)) / 100) * p.revenue, 2) AS ebitda_lost_cr
FROM peer_financials p
CROSS JOIN PeerMedian pm
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
    ROUND(((ebitda + (employee_cost * 0.05)) / revenue) * 100, 2) AS new_margin_percent,
    ROUND(((((ebitda + (employee_cost * 0.05)) / revenue) * 100) - ((ebitda / revenue) * 100)) * 100, 0) AS margin_gain_bps
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
-- Query 10: EBITDA vs Peer Median Delta (Historical)
-- Business Question: Har saal Peer Median se kitna EBITDA peeche rahe?
-- So-What: Translates percentage gaps into hard cash (₹ Cr) lost over time.
-- -------------------------------------------------------------------------
WITH PeerMedians AS (
    SELECT fiscal_year, 
           AVG(ebitda) as med_ebitda
    FROM (
        SELECT fiscal_year, ebitda, 
               ROW_NUMBER() OVER(PARTITION BY fiscal_year ORDER BY ebitda) as rn,
               COUNT(*) OVER(PARTITION BY fiscal_year) as cnt
        FROM peer_financials
        WHERE company != 'Persistent Systems'
    ) sub
    WHERE rn IN (FLOOR((cnt+1)/2), CEIL((cnt+1)/2))
    GROUP BY fiscal_year
)
SELECT 
    p.fiscal_year,
    p.ebitda AS actual_ebitda,
    ROUND(m.med_ebitda, 2) AS peer_median_ebitda,
    ROUND(m.med_ebitda - p.ebitda, 2) AS ebitda_lost_cr
FROM peer_financials p
JOIN PeerMedians m ON p.fiscal_year = m.fiscal_year
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
