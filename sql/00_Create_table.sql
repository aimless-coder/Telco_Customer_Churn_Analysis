-- ============================================
-- Query: Create Table — customer_churn
--
-- Note:
--   Total_Charges may contain blank spaces for new
--   customers - handle with NULL ' ' during CSV import.
-- =============================================


CREATE TABLE customer_churn (
    CustomerID        VARCHAR(20) PRIMARY KEY,
    CountNum          INT,
    Country           VARCHAR(100),
    StateName         VARCHAR(100),
    City              VARCHAR(100),
    Zip_Code          VARCHAR(20),
    Lat_Long          VARCHAR(50),
    Latitude          DECIMAL(9, 6),
    Longitude         DECIMAL(9, 6),
    Gender            VARCHAR(10),
    Senior_Citizen    VARCHAR(5),
    Partner           VARCHAR(5),
    Dependents        VARCHAR(5),
    Tenure_Months     INT,
    Phone_Service     VARCHAR(5),
    Multiple_Lines    VARCHAR(20),
    Internet_Service  VARCHAR(20),
    Online_Security   VARCHAR(20),
    Online_Backup     VARCHAR(20),
    Device_Protection VARCHAR(20),
    Tech_Support      VARCHAR(20),
    Streaming_TV      VARCHAR(20),
    Streaming_Movies  VARCHAR(20),
    Contract          VARCHAR(30),
    Paperless_Billing VARCHAR(5),
    Payment_Method    VARCHAR(50),
    Monthly_Charges   DECIMAL(10, 2),
    Total_Charges     DECIMAL(10, 2),
    Churn_Label       VARCHAR(5),
    Churn_Value       INT,
    Churn_Score       INT,
    CLTV              INT,
    Churn_Reason      TEXT
);