use financial_transactions_database;

show tables;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
select 
	(select count(distinct id) from cards_data) as Card_Datapoints,
    (select count(distinct id) from transactions_data) as Transaction_DataPoints,
    (select count(distinct id) from users_data) as User_DataPoints;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Card_Datapoints : 6146	
-- Transaction Datapoints : 40911
-- User Datapoints : 2000 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

# Question 1.1 : 
/* we want to categorize our User based on Credit Score here is categorize Criteria : 
		-- 800 to 850 : Exceptional
		-- 740 to 799 : Very Good
		-- 670 to 739 : Good
		-- 580 to 669 : Fair
		-- 300 to 579 : Poor
*/
select  
case 
	when credit_score >800 then "Exceptional"
    when credit_score > 740 then "Very Good"
    when credit_score > 670 then "Good"
    when credit_score >580 then "Fair"
    when credit_score > 300 then "Poor"	
end as User_type, count(*) as "Number of User" from users_data
group by User_type;	
----------------------------------------------------------------------------------------------------------------------------------------------------------------

# Que 1.2:   Identify the user who is both a high-frequency credit card user and a high-risk client.

# Part 01: Calculate the total aggregate spending.
SELECT 
    u.id,
    u.retirement_age,
    u.credit_score,
    SUM(CAST(REPLACE(t.amount, '$', '') AS DECIMAL (15 , 2 ))) AS Total_Transaction_Amount
FROM
    users_data u
        LEFT JOIN
    transactions_data t ON u.id = t.client_id
GROUP BY u.id , u.retirement_age , u.credit_score;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------


# Part 02 : Determine the overall credit limit.
SELECT 
    c.client_id,
    SUM(c.num_cards_issued) AS 'Total Cards',
    SUM(CAST(REPLACE(c.credit_limit, '$', '') AS DECIMAL (15 , 2 ))) AS 'Credit_Limit'
FROM
    cards_data c
GROUP BY c.client_id;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
#  Credit Utilization  = (total_Spend / total_limit) * 100 	
select  total_transaction_table.id, 
	round((total_transaction_table.total_transaction_amount/Credit_limit.Credit_Limit)*100,2) 'Credit Utilization Score'
from 
(SELECT 
    u.id,
    u.retirement_age,
    u.credit_score,
    SUM(CAST(REPLACE(t.amount, '$', '') AS DECIMAL (15 , 2 ))) AS Total_Transaction_Amount
FROM
    users_data u
        LEFT JOIN
    transactions_data t ON u.id = t.client_id
GROUP BY u.id , u.retirement_age , u.credit_score) 
total_transaction_table
left join (
SELECT 
    c.client_id,
    SUM(c.num_cards_issued) AS 'Total Cards',
    SUM(CAST(REPLACE(c.credit_limit, '$', '') AS DECIMAL (15 , 2 ))) AS 'Credit_Limit'
FROM
    cards_data c
GROUP BY c.client_id) 
Credit_limit
on Credit_limit.client_id = total_transaction_table.id;
---------------------------------------------------------------------------------------------------------------------------------------------------------------

# Que 1.3 :  Debt to Income Ratio
SELECT 
    id, current_age, gender, retirement_age, per_capita_income
FROM
    users_data
WHERE
    credit_score > 700
        AND (0.4 > (RIGHT(total_debt,
        LENGTH(total_debt) - 1) / RIGHT(yearly_income,
        LENGTH(yearly_income) - 1)));
----------------------------------------------------------------------------------------------------------------------------------------------------------------

# Que 1.4 : we will check :
	-- Whose user who having 0 debt
SELECT 
    *
FROM
    users_data
WHERE
    CAST(REPLACE(total_debt, '$', '') AS DECIMAL (15 , 2 )) = 0;
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM users_data 
WHERE id NOT IN (SELECT DISTINCT client_id FROM transactions_data);
-- OR
SELECT 
    users_data.id,users_data.gender
FROM
    users_data
        LEFT JOIN
    transactions_data ON users_data.id = transactions_data.client_id
WHERE
    transactions_data.client_id IS NULL;
