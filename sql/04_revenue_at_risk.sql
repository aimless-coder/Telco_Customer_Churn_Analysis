-- ============================================
-- Query: Monthly Revenue at Risk
-- Purpose: Convert churn percentages into actual dollar impact by contract type
--
-- Key Findings:
--   - Month-to-month : $120,847/month | $1,450,165/year
--   - One year       :  $14,118/month |   $169,421/year
--   - Two year       :   $4,165/month |    $49,984/year
--   - TOTAL          : $139,131/month | $1,669,570/year
-- ================================================

SELECT
  Contract,
  ROUND(SUM(CASE WHEN Churn_Label = 'Yes' THEN Monthly_Charges ELSE 0 END), 2) AS monthly_revenue_lost,
  ROUND(SUM(CASE WHEN Churn_Label = 'Yes' THEN Monthly_Charges * 12 ELSE 0 END), 2) AS annualized_revenue_at_risk
FROM customer_churn
GROUP BY Contract
ORDER BY monthly_revenue_lost DESC;