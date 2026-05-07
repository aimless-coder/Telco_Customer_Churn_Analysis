-- ============================================
-- Query: Churn by Tech Support & Online Security
-- Purpose: Identify how value-added services impact customer retention
--
-- Key Findings:
--   - No Support + No Security : 48.96% churn (2,553 customers)
--   - Yes Support + No Security: 22.33% churn
--   - No Support + Yes Security: 21.30% churn
--   - Yes Support + Yes Security:  9.01% churn
--   - No Internet Service      :  7.40% churn
-- ================================================

SELECT
  Tech_Support,
  Online_Security,
  COUNT(*) AS total,
  ROUND(AVG(CASE WHEN Churn_Label = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS churn_rate_pct
FROM customer_churn
GROUP BY Tech_Support, Online_Security
ORDER BY churn_rate_pct DESC;