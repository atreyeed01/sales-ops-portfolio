SELECT *
FROM forecast_data;


## Query 1 — Q3 2024 rep by rep breakdown

SELECT 
    Rep_ID,
    Rep_Name,
    Segment,
    ROUND(SUM(Forecasted_Revenue), 2) AS Q3_Forecasted,
    ROUND(SUM(Actual_Revenue_Closed), 2) AS Q3_Actual,
    ROUND(SUM(Forecasted_Revenue) - SUM(Actual_Revenue_Closed), 2) AS Q3_Miss_Amount,
    ROUND((SUM(Forecasted_Revenue) - SUM(Actual_Revenue_Closed)) / SUM(Actual_Revenue_Closed) * 100, 1) AS Q3_Miss_Pct
FROM forecast_data
WHERE Quarter = 'Q3 2024'
AND Actual_Revenue_Closed > 0
GROUP BY Rep_ID, Rep_Name, Segment
ORDER BY Q3_Miss_Amount DESC;

## Query 2 — High risk reps (Overforecasted)

SELECT 
    Rep_ID,
    Rep_Name,
    Segment,
    COUNT(*) AS Total_Flagged_Weeks,
    ROUND(SUM(Forecasted_Revenue), 2) AS Total_Forecasted,
    ROUND(SUM(Actual_Revenue_Closed), 2) AS Total_Actual,
    ROUND(SUM(Forecasted_Revenue) - SUM(Actual_Revenue_Closed), 2) AS Total_Miss
FROM forecast_data
WHERE Low_Pipeline_Flag = 'FLAG'
AND Quarter != 'Q4 2024'
AND Actual_Revenue_Closed > 0
GROUP BY Rep_ID, Rep_Name, Segment
ORDER BY Total_Flagged_Weeks DESC;