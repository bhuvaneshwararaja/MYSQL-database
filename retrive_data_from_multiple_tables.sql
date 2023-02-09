use sql_store;

-- Join order_items with prodcuts table for each order id get the product id and product name

SELECT order_id, p.product_id, name, quantity, OI.unit_price from order_items OI JOIN products p where OI.product_id = p.product_id;

-- Join order_items with prodcuts table from sql_inventory db for each order id get the product id and product name

SELECT order_id, p.product_id, name, quantity, OI.unit_price from order_items OI JOIN sql_inventory.products p where OI.product_id = p.product_id;

-- self join get the manager details of each employee

use sql_hr;

SELECT e.first_name, e.employee_id, m.first_name as reporting_manager FROM employees e
JOIN employees m
WHERE e.reports_to = m.employee_id;


-- joining multiple tables
-- join order customer and status table and display the status of each order for each customer

use sql_store;

SELECT o.order_id, o.order_date, c.first_name  ,c.last_name,o.status, os.name from orders o
JOIN customers c
ON 
( o.customer_id = c.customer_id )
JOIN order_statuses os
ON
(o.status = os.order_status_id);


-- join clients, payemnt, payment_methods table ad display the payment_methoda and name of client and paid_at_date

use sql_invoicing;

SELECT p.payment_id,p.amount as amount_paid, c.name, pm.name as payment_method, p.date as paid_date FROM payments p
JOIN clients c
ON p.client_id = c.client_id
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id;


-- Join order_items table with products table to display how many times each product ordered

SELECT p.product_id, p.name, oi.quantity from sql_store.products p
LEFT JOIN sql_store.order_items oi
ON p.product_id = oi.product_id
ORDER BY p.product_id;

-- join customers, orders, shipper, status table to display status of order
-- display order_date, order_id, first_name of customer, shipper_name and order_status
SELECT o.order_date, o.order_id,c.first_name, sh.name AS shipper_name,os.name AS order_status FROM sql_store.orders o
LEFT JOIN sql_store.customers c
ON o.customer_id = c.customer_id
LEFT JOIN sql_store.shippers sh
ON o.shipper_id = sh.shipper_id
LEFT JOIN sql_store.order_statuses os
ON o.status = os.order_status_id
ORDER BY os.name;

-- self outer join get the manager details of each employee, even if there is no manager for an employee

use sql_hr;

SELECT e.first_name, e.employee_id, m.first_name as reporting_manager FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;

-- display the payment by client using which payment method us USING clause

use sql_invoicing;

SELECT p.date, c.name, p.amount, pm.name FROM payments p
LEFT JOIN clients c
USING (client_id)
LEFT JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id;

-- natural joins will look into database engine while joining two tables using NATURAL JOIN it will look for common column names and join accordingly
-- somtimes it produce unexpected results

-- do a cross join between shipper and products table, do cross join using implicit and explicit syntax

use sql_store;

SELECT * FROM shippers s 
CROSS JOIN products p;

SELECT * FROM shippers s , products p;

-- display type based on points earned by cuctomers, if points < 2000 bronze, points between 2000 to 3000 sliver, points > 3000 gold

SELECT customer_id, first_name, points, 'Bronze' AS type FROM customers
WHERE points < 2000
UNION 
SELECT customer_id, first_name, points, 'Silver' AS type FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id, first_name, points, 'Gold' AS type FROM customers
WHERE points > 3000
ORDER BY first_name;




