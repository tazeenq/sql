-- Cross Join
/*1. Suppose every vendor in the `vendor_inventory` table had 5 of each of their products to sell to **every** 
customer on record. How much money would each vendor make per product? 
Show this by vendor_name and product name, rather than using the IDs.

HINT: Be sure you select only relevant columns and rows. 
Remember, CROSS JOIN will explode your table rows, so CROSS JOIN should likely be a subquery. 
Think a bit about the row counts: how many distinct vendors, product names are there (x)?
How many customers are there (y). 
Before your final group by you should have the product of those two queries (x*y).  */
SELECT vendor.vendor_name, product.product_name, 5 * vendor_inventory.original_price * (SELECT COUNT(*) FROM customer) AS total_money_earned
FROM vendor_inventory
JOIN product ON vendor_inventory.product_id = product.product_id
JOIN vendor ON vendor_inventory.vendor_id = vendor.vendor_id
CROSS JOIN customer
GROUP BY vendor.vendor_name, product.product_name;


-- INSERT
/*1.  Create a new table "product_units". 
This table will contain only products where the `product_qty_type = 'unit'`. 
It should use all of the columns from the product table, as well as a new column for the `CURRENT_TIMESTAMP`.  
Name the timestamp column `snapshot_timestamp`. */
CREATE TABLE product_units AS 
SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
FROM product
WHERE product_qty_type = 'unit';

/*2. Using `INSERT`, add a new row to the product_units table (with an updated timestamp). 
This can be any product you desire (e.g. add another record for Apple Pie). */
INSERT INTO product_units (product_id, product_name, product_qty_type, product_size, product_category_id, snapshot_timestamp)
VALUES (101, 'Cherry Pie', 'unit', 'large', 1, CURRENT_TIMESTAMP);



-- DELETE
/* 1. Delete the older record for the whatever product you added. 

HINT: If you don't specify a WHERE clause, you are going to have a bad time.*/
DELETE FROM product_units
WHERE product_name = 'Cherry Pie'
AND snapshot_timestamp < CURRENT_TIMESTAMP;
/* When I deleted the older record, both rows with Cherry pie dissappeared. I think that was my mistake. I re-added my Cherry pie record again (as in part 2 of this question).*/

-- UPDATE
/* 1.We want to add the current_quantity to the product_units table. 
First, add a new column, current_quantity to the table using the following syntax.

ALTER TABLE product_units
ADD current_quantity INT;

Then, using UPDATE, change the current_quantity equal to the last quantity value from the vendor_inventory details.

HINT: This one is pretty hard. 
First, determine how to get the "last" quantity per product. 
Second, coalesce null values to 0 (if you don't have null values, figure out how to rearrange your query so you do.) 
Third, SET current_quantity = (...your select statement...), remembering that WHERE can only accommodate one column. 
Finally, make sure you have a WHERE statement to update the right row, 
	you'll need to use product_units.product_id to refer to the correct row within the product_units table. 
When you have all of these components, you can run the update statement. */
UPDATE product_units
SET current_quantity = (
  SELECT COALESCE(MAX(vendor_inventory.quantity), 0) 
  FROM vendor_inventory
  WHERE vendor_inventory.product_id = product_units.product_id
)

