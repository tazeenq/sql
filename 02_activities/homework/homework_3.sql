-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */
SELECT CAST(vendor_id AS INTEGER), COUNT(*) AS number_of_times_booth_rented

  FROM vendor_booth_assignments
GROUP BY vendor_id;

/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */

SELECT customer.customer_id, customer.customer_last_name, customer.customer_first_name, 
       SUM(CAST(customer_purchases.quantity AS FLOAT) * CAST(customer_purchases.cost_to_customer_per_qty AS FLOAT)) AS total_amount_spent
FROM customer_purchases
  FROM customer

INNER JOIN customer_purchases ON customer.customer_id = customer_purchases.customer_id
GROUP BY customer.customer_id
HAVING total_amount_spent > 2000
ORDER BY customer.customer_last_name, customer.customer_first_name;
-- in HAVING clause, using '> 2000' and '>= 2000' yield the same results.


--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/
DROP TABLE IF EXISTS new_vendor;

CREATE TEMP TABLE new_vendor AS
SELECT * 
FROM vendor;

INSERT INTO new_vendor (vendor_id, vendor_name, vendor_type, vendor_owner_first_name, vendor_owner_last_name)
VALUES (10, 'Thomass Superfood Store', 'Fresh Focused', 'Thomas', 'Rosenthal');

-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */
SELECT customer_id, STRFTIME('%m', market_date) AS month, STRFTIME('%Y', market_date) AS year

  FROM customer_purchases;


/* 2. Using the previous query as a base, determine how much money each customer spent in April 2022. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */
SELECT customer_id, SUM(CAST(quantity AS FLOAT) * CAST(cost_to_customer_per_qty AS FLOAT)) AS total_amount_spent
FROM customer_purchases
WHERE STRFTIME('%m', market_date) = '04' 

  AND STRFTIME('%Y', market_date) = '2019'

GROUP BY customer_id;
