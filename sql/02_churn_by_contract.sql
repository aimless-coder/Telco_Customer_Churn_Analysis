-- ============================================
-- Query: Churn by Contract Type
-- Purpose: Identify which contract segments drive the most churn
-- 
-- Key Findings:
--   - Month-to-month : 42.71% churn (1,655 churned)
--   - One year       : 11.27% churn (166 churned)
--   - Two year       :  2.83% churn (48 churned)
-- ============================================



SELECT
  Contract,
  COUNT(*) AS total,
  SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned,
  ROUND(AVG(CASE WHEN Churn_Label = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS churn_rate_pct,
  ROUND(AVG(Monthly_Charges), 2) AS avg_monthly_charges
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_pct DESC;