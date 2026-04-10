-- Q1. From orders table, display id, status_id and a column order_status using Simple CASE:
-- 0 → 'New'
-- 1 → 'Processing'
-- 2 → 'Shipped'
-- 3 → 'Closed'
-- anything else → 'Unknown'

SELECT * FROM ORDERS;
SELECT STATUS_ID,ID,
CASE
 WHEN STATUS_ID=0 THEN 'NEW'
 WHEN STATUS_ID=1 THEN 'PROCESSING'
 WHEN STATUS_ID=2 THEN 'SHIPPED'
 WHEN STATUS_ID=3 THEN 'UNKNOWN'
 END AS ORDER_STATUS
 FROM ORDERS;

-- Q2. From products table, display product_name, discontinued and a column stock_status using Simple CASE:
-- 0 → 'Available'
-- 1 → 'Discontinued'
SELECT product_name, discontinued,
CASE
 WHEN discontinued=0 THEN 'DISCONTINUED'
 WHEN discontinued=1 THEN 'AVAILABLE'
 END AS STOCK_STATUS
 FROM products;

 SELECT * FROM products;  
--  Q3. From orders table, display id, payment_type and a column payment_category using Simple CASE:
-- 'Credit Card' → 'Card'
-- 'Cash' → 'Cash'
-- 'Check' → 'Cheque'
-- else → 'Other'
SELECT * FROM ORDERS;
SELECT ID, PAYMENT_TYPE,
CASE
 WHEN PAYMENT_TYPE='Card'THEN 'CREDIT CARD'
 WHEN PAYMENT_TYPE='Cash' THEN 'CASH'
  WHEN PAYMENT_TYPE='Check' THEN 'CHEQUE'
  ELSE 'OTHER'
 END AS STOCK_STATUS
 FROM ORDERS;

-- Q4. From purchase_orders table, display id, status_id and a column po_status using Simple CASE:
-- 0 → 'New'
-- 1 → 'Submitted'
-- 2 → 'Approved'
-- 3 → 'Received'
-- else → 'Closed'
 
SELECT ID, STATUS_ID,
CASE
 WHEN STATUS_ID=0 THEN 'NEW'
  WHEN STATUS_ID=1 THEN 'SUBMITTED'
  WHEN STATUS_ID=2 THEN 'APPROVED'
   WHEN STATUS_ID=3 THEN 'RECEIVED'
   ELSE 'CLOSED'
 END AS STOCK_STATUS
 FROM PURCHASE_ORDERS;
--  
--  Q5. From inventory_transaction_types table, display id, type_name and a column transaction_label using Simple CASE on id:
-- 1 → 'Sold'
-- 2 → 'Purchase'
-- 3 → 'Inventory Adjustment'
-- else → 'Other'

SELECT id, type_name,
CASE
 WHEN ID=0 THEN 'Sold'
  WHEN ID=1 THEN'Purchase'
  WHEN ID=3 THEN 'Inventory Adjustment'
   ELSE 'OTHER'
 END AS transaction_label
FROM inventory_transaction_types;

-- Q6. From orders table, display id, shipper_id and a column shipper_name using Simple CASE:
-- 1 → 'Shipping Company A'
-- 2 → 'Shipping Company B'
-- 3 → 'Shipping Company C'
-- else → 'Not Assigned']

SELECT id, shipper_id,
CASE
 WHEN shipper_id=1 THEN 'Shipping Company A'
  WHEN shipper_id=2 THEN 'Shipping Company B'
  WHEN shipper_id=3 THEN 'Shipping Company C'
   ELSE 'Not Assigned'
 END AS shipper_name
FROM orders;


-- Q7. From products table, display product_name, reorder_level and a column reorder_flag using Simple CASE:
-- 0 → 'No Reorder'
-- 10 → 'Low Reorder'
-- 25 → 'Medium Reorder'
-- else → 'Check Manually'
SELECT product_name, reorder_level,
CASE
 WHEN reorder_level=0 THEN 'No Reorder'
 WHEN reorder_level=10 THEN 'Low Reorder'
WHEN reorder_level=25 THEN 'Medium Reorder'
   ELSE 'Check Manually'
 END AS reorder_flag 
 SELECT *
FROM products;


-- Q8. From products table, classify list_price into a column price_tier:
-- 0 to 20 → 'Budget'
-- 20 to 100 → 'Standard'
-- above 100 → 'Premium'
-- else → 'Unknown'

SELECT list_price,
CASE
 WHEN  list_price BETWEEN 0 AND 20 THEN 'Budget'
 WHEN  list_price BETWEEN 20 AND 100 THEN 'Standard'
 WHEN  list_price>100 THEN 'Premium'
 ELSE 'UNKNOWN'
 END AS price_tier
FROM products;


-- Q9. From orders table, classify shipping_fee into a column shipping_band:
-- 0 → 'Free'
-- less than 50 → 'Low'
-- 50 to 200 → 'Standard'
-- above 200 → 'Express'

SELECT shipping_fee,
CASE
 WHEN  shipping_fee=0 THEN 'Free'
 WHEN  shipping_fee>50 THEN 'Standard'
 WHEN  shipping_fee between 50 AND 200 THEN 'EXPRESS'
 END AS shipping_band
FROM orders;

-- Q10. From orders table, create a column delivery_status:
-- shipped_date IS NULL AND status_id < 2 → 'Awaiting Shipment'
-- shipped_date IS NOT NULL → 'Dispatched'
-- else → 'Check Manually'

SELECT shipping_fee,
CASE
 WHEN  shipped_date IS NULL AND status_id < 2 THEN 'Awaiting Shipment'
 WHEN  shipped_date IS NOT NULL THEN 'Dispatched'
ELSE 'CHECK MANUALLY'
 END AS delivery_status
FROM orders;

-- Q11. From products table, create a column margin_status using list_price and standard_cost:
-- list_price - standard_cost > 50 → 'High Margin'
-- between 10 and 50 → 'Medium Margin'
-- less than 10 → 'Low Margin'
-- standard_cost IS NULL → 'No Cost Data'
SELECT LIST_PRICE,
CASE
 WHEN  list_price - standard_cost > 50 THEN 'High Margin'
 WHEN  list_price- standard_cost between 10 and 50 THEN 'Medium Margin'
 WHEN  list_price- standard_cost<10 THEN 'Low Margin'
 WHEN standard_cost IS NULL THEN 'No Cost Data'
 END AS margin_status
FROM products;

-- Q12. From purchase_orders table, create a column urgency_level based on expected_date:
-- NULL → 'No Date Set'
-- already passed → 'Overdue'
-- within 7 days → 'Urgent'
-- within 30 days → 'Upcoming'
-- beyond 30 days → 'Planned'
SELECT 
CASE
 WHEN  expected_date IS NULL THEN 'No Date Set'
 WHEN  timestampDIFF(DAY,EXPECTED_DATE,NOW())<0 THEN  'Overdue'
 WHEN  timestampDIFF(DAY,EXPECTED_DATE,NOW())<=7 THEN 'Urgent'
 WHEN timestampDIFF(DAY,EXPECTED_DATE,NOW())<=30  THEN 'Upcoming'
 WHEN timestampDIFF(DAY,EXPECTED_DATE,NOW())>30  THEN 'PLANNED'
 END AS urgency_level
FROM purchase_orders;

-- Q13. From order_details table, classify discount into a column discount_category:
-- 0 → 'No Discount'
-- greater than 0 and up to 0.1 → 'Small Discount'
-- greater than 0.1 and up to 0.3 → 'Medium Discount'
-- above 0.3 → 'Heavy Discount'
SELECT DISCOUNT,
CASE
 WHEN   DISCOUNT=0 THEN 'No Date Set'
WHEN   DISCOUNT between 0 AND 0.1  THEN 'Small Discount'
WHEN   DISCOUNT between 0.1 AND 0.3  THEN 'No Date Set'
WHEN   DISCOUNT>0.3  THEN 'Heavy Discount'
 END AS discount_category
FROM order_details;
SELECT * FROM ORDER_DETAILS WHERE DISCOUNT>1; 

-- Q14. From customers table, create a column contact_availability:
-- mobile_phone IS NOT NULL → 'Mobile Available'
-- home_phone IS NOT NULL → 'Home Available'
-- business_phone IS NOT NULL → 'Work Available'
-- all NULL → 'No Contact'

SELECT mobile_phone,home_phone,business_phone,
CASE
 WHEN   mobile_phone IS NOT NULL THEN 'Mobile Available'
WHEN  home_phone IS NOT NULL  THEN 'Home Available'
WHEN   business_phone IS NOT NULL THEN 'Work Available'
ELSE 'No Contact'
 END AS contact_availability
FROM customers;
SELECT * FROM customers; 
-- Q15. From products table, create a column product_flag:
-- discontinued = 1 → 'Discontinued'
-- active AND list_price > 100 → 'Active - Premium'
-- active AND list_price > 20 → 'Active - Standard'
-- active AND list_price <= 20 → 'Active - Budget'

SELECT LIST_PRICE,
CASE
WHEN Discontinued=1 then 'Discontinued'
 WHEN Discontinued=0 AND list_price > 100 THEN'Active - Premium'
WHEN  Discontinued=0 AND list_price > 20 THEN 'Active - Standard'
WHEN  Discontinued=0 AND list_price <= 20 then 'Active - Budget'
ELSE 'UNKNOWN'
 END AS product_flag
FROM products;

-- Q16. From orders table, create a column order_classification:
-- employee_id IS NULL → 'Unassigned'
-- assigned AND shipping_fee = 0 → 'Assigned - Free Ship'
-- assigned AND shipping_fee < 100 → 'Assigned - Low Fee'
-- assigned AND shipping_fee >= 100 → 'Assigned - High Fee'

SELECT employee_id,shipping_fee,
CASE
WHEN employee_id IS  NULL THEN 'Unassigned'
 WHEN employee_id IS NOT NULL AND shipping_fee = 0 THEN 'Assigned - Free Ship'
WHEN employee_id IS NOT NULL AND shipping_fee < 100 THEN 'Assigned - Low Fee'
WHEN employee_id IS NOT NULL AND shipping_fee >= 100 THEN 'Assigned - High Fee'
ELSE 'UNKNOWN'
 END AS order_classification
FROM orders;
-- Q17. From products table, create a column profit_flag:
-- discontinued = 1 → 'Discontinued'
-- active AND list_price > standard_cost * 2 →'High Profit'
-- active AND list_price > standard_cost → 'Normal Profit'
-- active AND list_price <= standard_cost → 'Loss!'
-- standard_cost IS NULL → 'No Cost Info'
SELECT list_price,discontinued,
CASE
WHEN discontinued = 1 AND list_price > standard_cost * 2 THEN 'High Profit'
WHEN discontinued = 0  AND list_price > standard_cost THEN 'Normal Profit'
WHEN discontinued = 0  AND list_price <= standard_cost  THEN 'Loss!'
WHEN standard_cost IS NULL THEN  'No Cost Info'
ELSE 'UNKNOWN'
 END AS order_classification
FROM products;

-- Q18. From purchase_orders table, create a column po_classification:
-- supplier_id IS NULL → 'No Supplier'
-- supplier assigned AND payment_amount > 1000 → 'Large Order'
-- supplier assigned AND payment_amount > 500 → 'Medium Order'
-- supplier assigned AND payment_amount <= 500 → 'Small Order'
-- payment_amount IS NULL → 'Payment Not Set'
SELECT list_price,discontinued,
CASE
WHEN supplier_id IS NULL → 'No Supplier'
WHEN supplier assigned AND payment_amount > 1000 THEN 'Large Order'
WHEN supplier assigned AND payment_amount > 500  'Medium Order'
WHEN supplier assigned AND payment_amount <= 500 → 'Small Order'
WHEN payment_amount IS NULL → 'Payment Not Set'
ELSE 'UNKNOWN'
 END AS order_classification
FROM products;


-- Q19. From orders table, create a column tax_shipping_flag:
-- taxes > 0 AND shipping_fee > 0 → 'Taxed + Paid Shipping'
-- taxes > 0 AND shipping_fee = 0 → 'Taxed + Free Shipping'
-- taxes = 0 AND shipping_fee > 0 → 'No Tax + Paid Shipping'
select shipping_fee ,taxes,
case
  when taxes > 0 AND shipping_fee > 0 then 'Taxed + Paid Shipping'
  when taxes > 0 AND shipping_fee = 0 then 'Taxed + Free Shipping'
  when taxes = 0 AND shipping_fee > 0 then 'No Tax + Paid Shipping'
  when taxes = 0 AND shipping_fee = 0 then 'No Tax + Free Shipping'
 end as shipping_flag
from  orders;

-- Q20. From customers table, create a column customer_region_flag:
-- country_region IS NULL → 'No Country Data'
-- country is USA AND state_province IS NOT NULL → 'USA - State Known'
-- country is USA AND state_province IS NULL → 'USA - State Unknown'
-- any other country → 'International'
select country_region,state_province ,
case
  when country_region IS NULL then 'Taxed + Paid Shipping'
  when country_region='USA' AND state_province IS NOT NULL then 'Taxed + Free Shipping'
  when country_region='USA' AND state_province IS NULL then 'No Tax + Paid Shipping'
  else 'International'
 end as shipping_flag
from  customers;

-- Q21. From order_details table, create a column line_value_status:
-- quantity IS NULL → 'No Quantity'
-- quantity > 0 AND discount > 0.2 → 'High Qty - Heavy Discount'
-- quantity > 0 AND discount > 0 → 'High Qty - Some Discount'
-- quantity > 0 AND discount = 0 → 'High Qty - Full Price'
-- else → 'Check Record'

select quantity,discount,
case
  when quantity IS NULL then 'No Quantity'
  when quantity > 0 AND discount > 0.2 then 'High Qty - Heavy Discount'
  when quantity > 0 AND discount > 0 then 'High Qty - Some Discount'
  when quantity > 0 AND discount = 0 then 'High Qty - Full Price'
	else  'Check Record'
 end as line_value_status
from   order_details;

SELECT 
PRODUCT_NAME,
REORDER_LEVEL,
IF(REORDER_LEVEL=10,'REORDER REQUIRED','NO REORDER')AS REORDER_STATUS
FROM PRODUCTS;



-- Q22. From products, use IF() to show a column status:
-- discontinued = 1 → 'Discontinued'
-- else → 'Active'
select 
discontinued,
if(discontinued = 1,  'Active','Discontinued')
from products;
-- Q23. From orders, use IF() to show a column payment_done:
-- paid_date IS NOT NULL → 'Paid'
-- else → 'Pending'
select paid_date,
IF( paid_date IS NOT NULL, 'Paid','Pending')
From orders;

-- Q24. From customers, use IFNULL() to show the city — if NULL show 'City Not Provided'.
select city, 
IFNULL(city,'City Not Provided')
From customers;
-- Q25. From customers, use nested IFNULL() to show a column best_contact:
-- check mobile_phone first
-- then home_phone
-- then business_phone
-- if all NULL → 'No Contact'
select mobile_phone,home_phone,business_phone,
IFNULL(mobile_phone,IFNULL(home_phone,ifnull(business_phone, 'No Contact'))) as best_contact
From customers;
-- Q26. From order_details, use NULLIF() to avoid divide-by-zero:
-- calculate unit_price / quantity
-- if quantity = 0, result should be NULL not an error
select unit_price, quantity,(unit_price / nullif(quantity,null)) as up
From order_details;
-- Q27. From orders, use IF() inside COUNT() to show in one row:
-- count of paid orders
-- count of unpaid orders
select count(if())
select *
from order_details
-- Q28. From order_details, use IF() inside SUM() to show in one row:
-- total revenue from discounted items
-- total revenue from full price items
select sum(if(discount=1,unit_price*quantity-discount,unit_price*quantity,0))as s from order_details
SELECT 
    SUM(IF(discount > 0, unit_price * quantity * (1 - discount), 0)) AS discounted_total,
    SUM(IF(discount = 0, unit_price * quantity, 0)) AS non_discounted_total
FROM order_details;
-- Q29. From products, use IF() with nested IFNULL() to show a column price_display:
-- if standard_cost IS NULL → 'Cost Unknown'
-- if list_price > standard_cost → 'Profit: ' + list_price - standard_cost (use CONCAT)
-- else → 'No Profit'

-- Q30. From orders joined with order_details and products, show customer_id, total amount spent and a column customer_tier using CASE:
-- spent > 5000 → 'Platinum'
-- spent > 2000 → 'Gold'
-- spent > 500 → 'Silver'
-- else → 'Bronze'

