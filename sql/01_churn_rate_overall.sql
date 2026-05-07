-- ============================================
-- Query: Overall Churn Rate
-- Purpose: Calculate the headline churn metric
-- Result: 26.54% churn rate (1,869 / 7,043)
-- ============================================

SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned,
  ROUND(
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
  ) AS churn_rate_pct
FROM customer_churn;
