SELECT * FROM finance_data.finance_data;

-- Check for NULL
SELECT 
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS Null_Age,
    SUM(CASE WHEN Investment_Avenues IS NULL THEN 1 ELSE 0 END) AS Null_Investment_Avenues
FROM finance_data;

-- Check duplicates
SELECT 
    gender, age, Investment_Avenues, COUNT(*) 
FROM Finance_data
GROUP BY gender, age, Investment_Avenues
HAVING COUNT(*) > 1;

-- Gender Distribution
SELECT gender, COUNT(*) AS Count
FROM finance_data
GROUP BY gender;

-- Age Distribution
SELECT age, COUNT(*) AS COUNT
FROM finance_data
GROUP BY age
ORDER BY age;

-- Count Investment
SELECT Investment_Avenues, COUNT(*) AS Count
FROM finance_data
GROUP BY Investment_Avenues
ORDER BY Investment_Avenues DESC;

-- COUNT Saving objectives
SELECT Savings_Objectives, COUNT(*) AS Count
FROM finance_data
GROUP BY Savings_Objectives
ORDER BY Count DESC;

-- Age vs. Preferred Investment
SELECT age, Investment_Avenues, COUNT(*) AS Count
FROM finance_data
GROUP BY age, Investment_Avenues
ORDER BY age, Count DESC;

-- Duration of Investment vs. Expectation
SELECT Duration, Expect, COUNT(*) AS Count
FROM finance_data
GROUP BY Duration, Expect
ORDER BY Duration, Count DESC;

SELECT * FROM finance_data.finance_data;

-- Gender vs. Investment 

SELECT gender, 
       SUM(CASE WHEN Investment_Avenues = 'Yes' THEN 1 ELSE 0 END) AS Interested,
       SUM(CASE WHEN Investment_Avenues = 'No' THEN 1 ELSE 0 END) AS Not_Interested
FROM finance_data
GROUP BY gender;

SELECT gender, age, Investment_Avenues FROM Finance_data;

SELECT * 
FROM Finance_data
WHERE gender = 'Male' AND age > 30;


SELECT Investment_Avenues, COUNT(*) AS Count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS Ranking
FROM Finance_data
GROUP BY Investment_Avenues;

WITH Gender_Stats AS (
    SELECT gender, Investment_Avenues, COUNT(*) AS Count
    FROM Finance_data
    GROUP BY gender, Investment_Avenues
)
SELECT * 
FROM Gender_Stats
WHERE Count > 15;

SELECT gender, age, objective 
From finance_data
where Invest_Monitor = 'Monthly'
GROUP BY gender, age, objective 
ORDER BY age;

SELECT ROUND(AVG(age),2) AS Average_Age FROM Finance_data;

SELECT gender, ROUD(AVG(Duration),2) AS Average_Duration
FROM Finance_data
GROUP BY gender;

SELECT Savings_Objectives,
       COUNT(*) AS Count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Finance_data), 2) AS Percentage
FROM Finance_data
GROUP BY Savings_Objectives
ORDER BY Percentage DESC;

SELECT gender, SUM(Equity_Market) AS Total_Equity_Investment
FROM Finance_data
GROUP BY gender
ORDER BY Total_Equity_Investment DESC;

SELECT Source,
   ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Finance_data), 2) AS Percentage
FROM Finance_data
WHERE Source = 'Television'
order by gender;

SELECT Source, COUNT(*) AS Count
FROM Finance_data
WHERE Expect_Range = 'High'
GROUP BY Source
ORDER BY Count DESC;
