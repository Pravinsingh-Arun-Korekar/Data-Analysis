use financial_transactions_database;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
# Que 3.1:  
/* 	Let's determine which client has the highest transaction frequency and assign a ranking to them. 
	In the second part, let's identify which client has the highest total transaction value compared to others.
*/ 
SELECT 
    client_id, 
    Frequency,
    Total_amount,
    DENSE_RANK() OVER (ORDER BY Frequency DESC) AS rank_by_frequency,
    DENSE_RANK() OVER (ORDER BY Total_amount DESC) AS rank_by_total_amount
FROM (
    SELECT 
        client_id, 
        COUNT(*) AS Frequency, 
        SUM(CAST(REPLACE(amount, '$', '') AS DECIMAL(15,2))) AS Total_amount 
    FROM transactions_data
    GROUP BY client_id
) AS temp
order by rank_by_total_amount, rank_by_frequency desc;
-- --------------------------------------------------------------------------------------------------------------------------------
/*
	## Client Segmentation Framework

* **"The Whales" (High Frequency, High Value)**
    * **Profile:** These are your most significant assets, providing both steady activity and high revenue.
    * **Strategy:** Prioritize retention efforts and exclusive VIP perks. Maintain high-touch communication to protect these relationships, as they drive the bulk of your success.

* **"The Loyalists" (High Frequency, Low Value)**
    * **Profile:** These clients provide consistent cash flow through regular, smaller transactions.
    * **Strategy:** Focus on upselling and cross-selling. Your goal is to increase their "average order value" to maximize the revenue from their existing high frequency.

* **"The Occasional Big Spender" (Low Frequency, High Value)**
    * **Profile:** These clients transact infrequently but contribute significantly when they do purchase.
    * **Strategy:** These have high potential for growth. Use predictive analytics to target them with timely, high-value offers exactly when their purchase cycle suggests they are ready for another order.

* **"At-Risk" (Low Frequency, Low Value)**
    * **Profile:** Clients who interact rarely and contribute minimal revenue.
    * **Strategy:** Keep marketing spend and time investment at a minimum here. Focus your energy on the top three segments where your return on investment will be substantially higher.
*/
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

# Que 3.2 
/*
	I am performing a city-level analysis to better understand our user base. 
    This will involve cross-referencing transaction and user data to identify 
    user demographics—specifically total users, gender split, and average transaction value—for each city.
*/

SELECT 
    t.merchant_city,
    COUNT(u.id) AS Number_Of_Users,
    AVG(u.current_age) AS Average_Age,
    SUM(CASE
        WHEN u.gender = 'Male' THEN 1
        ELSE 0
    END) AS Number_Of_Male,
    SUM(CASE
        WHEN u.gender = 'Female' THEN 1
        ELSE 0
    END) AS Number_Of_Female,
    AVG(CAST(REPLACE(t.amount, '$', '') AS DECIMAL (15 , 2 ))) AS Average_Money_Transaction,
    SUM(CAST(REPLACE(t.amount, '$', '') AS DECIMAL (15 , 2 ))) AS Total_Amount
FROM
    transactions_data t
        INNER JOIN
    users_data u ON t.client_id = u.id
GROUP BY t.merchant_city;
 -- ------------------------------------------------------------------------------------------------------------------