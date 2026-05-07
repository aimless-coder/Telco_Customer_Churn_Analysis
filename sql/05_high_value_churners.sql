-- ============================================
-- Query: High Value Churners (Top 50)
-- Purpose: Identify the highest-revenue customers who have already churned, to prioritize
--          win-back campaigns
--
-- Key Findings:
--   - ALL 50 high-value churners use Fiber Optic
--   - Monthly charges range: $108 - $118/month
--   - Highest total value lost: $8,684 (2889-FPWRM)
--   - Electronic check is most common payment method
-- ============================================

SELECT
  CustomerID,
  Tenure_Months,
  Contract,
  Monthly_Charges,
  Total_Charges,
  Payment_Method,
  Internet_Service
FROM customer_churn
WHERE Churn_Label = 'Yes'
  AND Monthly_Charges > (SELECT AVG(Monthly_Charges) FROM customer_churn)
ORDER BY Monthly_Charges DESC
LIMIT 50;
