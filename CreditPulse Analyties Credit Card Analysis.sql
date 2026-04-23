use financial_transactions_database;
show tables;

# Que 01 : 
	/*
		What is the current card-to-client density within our portfolio, 
        and how does the average number of cards held per client reflect 
        our overall market penetration and cross-selling effectiveness?
    */
    
SELECT 
    COUNT(DISTINCT client_id) AS Total_Client,
    COUNT(id) AS Total_card,
    ROUND(COUNT(id) / COUNT(DISTINCT client_id), 2) AS Per_User_Card
FROM
    cards_data;    
-- ----------------------------------------------------------------------------------------------------------------------------------------

# Que 02 : 
/* How does portfolio penetration and card ownership density vary across 
	gender demographics, and what does this reveal about our market reach 
    within these segments?
*/

SELECT 
    u.gender,
    COUNT(c.id) AS Number_of_Card,
    COUNT(DISTINCT c.client_id) AS Number_Of_User,
    ROUND(COUNT(c.id) / COUNT(DISTINCT c.client_id),
            2) AS Number_Of_Card_Per_User
FROM
    users_data u
        RIGHT JOIN
    cards_data c ON c.client_id = u.id
GROUP BY u.gender;

-- ----------------------------------------------------------------------------------------------------------------------------------------
# Que 03 : 
	/*
		How do the various card brands within our current portfolio compare in 
        terms of market distribution, average credit capacity, and technological 
        modernization (chip-enabled security)
    */
SELECT 
    card_brand,
    COUNT(*) AS Datapoint,
    ROUND(AVG(CAST(REPLACE(credit_limit, '$', '') AS DECIMAL (15 , 2 ))),
            2) AS Credit_Limit,
    SUM(CASE
        WHEN has_chip = 'YES' THEN 1
        ELSE 0
    END) AS Has_Chip,
    SUM(CASE
        WHEN has_chip = 'NO' THEN 1
        ELSE 0
    END) AS Has_No_Chip,
    ROUND(COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    cards_data),
            2) * 100 AS Brand_Share_In_this_dataset_in_percentage
FROM
    cards_data
GROUP BY card_brand;
-- ----------------------------------------------------------------------------------------------------------------------------------------


