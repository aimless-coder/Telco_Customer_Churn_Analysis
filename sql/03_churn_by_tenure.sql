-- ============================================
-- Query: Churn by Tenure Bucket
-- Purpose: Understand at what stage of the customer lifecycle churn occurs most
--
-- Key Findings:
--   - 0-12 months  : 47.44% churn (1,037 churned)
--   - 13-24 months : 28.71% churn (294 churned)
--   - 25-48 months : 20.39% churn (325 churned)
--   - 48+ months   :  9.51% churn (213 churned)
-- ==============================================

SELECT
  CASE
    WHEN Tenure_Months BETWEEN 0 AND 12 THEN '0-12 months'
    WHEN Tenure_Months BETWEEN 13 AND 24 THEN '13-24 months'
    WHEN Tenure_Months BETWEEN 25 AND 48 THEN '25-48 months'
    ELSE '48+ months'
  END AS tenure_bucket,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned,
  ROUND(AVG(CASE WHEN Churn_Label = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS churn_rate_pct
FROM customer_churn
GROUP BY tenure_bucket
ORDER BY MIN(Tenure_Months);