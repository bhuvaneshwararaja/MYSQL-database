-- To Switch DB
USE sql_store;


-- To SORT  based on firstname ASEC
SELECT * FROM sql_store.customers order by first_name;

-- To SORT  based on lastname DESC

SELECT * FROM sql_store.customers order by last_name desc;

-- WHERE clause

SELECT phone from sql_store.customers WHERE customer_id = 6;

-- Get distinct city name

SELECT DISTINCT(city)from sql_store.customers order by city;

-- Arithmetic operators in SELECT clause

SELECT first_name, last_name, points, (points + 100) AS incrementTo100 from sql_store.customers;

-- return all; products, name, unit_price, new price

SELECT name, unit_price, (unit_price *1.1 ) AS 'new price' from sql_store.products; 

-- get all orders that placed this year

SELECT * from sql_store.orders WHERE order_date >= '2019-01-01';

-- FROM order_item get item where order id is #6 and total price >= 30

SELECT * FROM sql_store.order_items WHERE order_id = 6 AND quantity * unit_price >= 30;

-- Get customers located in VA or FL or GA

SELECT * from sql_store.customers WHERE state IN  ('VA', 'FL', 'GA');

-- return product where quntity in stock 49, 38, 72

SELECT * FROM sql_store.products where quantity_in_stock IN (49, 38, 72);

-- get customer details where points more than 1000 and less tahn 3000

SELECT * FROM sql_store.customers where points BETWEEN 1000 AND 3000;

-- return customers born between 1/1/1990 and 1/1/2000

SELECT * FROM sql_store.customers where birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- return customer where firstname starts with E

SELECT * FROM sql_store.customers where first_name LIKE 'e%';

-- return customer where firstname ends with A

SELECT * FROM sql_store.customers where first_name LIKE '%a';

-- return customer where firstname contains A in middle

SELECT * FROM sql_store.customers where first_name LIKE '%a%';

-- return customer where firstname  second letter contains A followed by any chacters

SELECT * FROM sql_store.customers where first_name LIKE '_a%';

-- return customer where address contains TRAIL or AVENUE 

SELECT * FROM sql_store.customers where address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';

-- return customer where phone number ends with 9 

SELECT * FROM sql_store.customers where phone LIKE '%9';

-- return customer where phone number not ends with 9 

SELECT * FROM sql_store.customers where phone NOT LIKE '%9';

-- return customer where address contains TRAIL or AVENUE 

SELECT * FROM sql_store.customers where address regexp 'TRAIL$|AVENUE$';

-- return customer where last_name starts with Brush

SELECT * FROM sql_store.customers where  last_name regexp '^BRUSH';

-- return customer where last_name starts with BO

SELECT * FROM sql_store.customers where  last_name regexp '^[b]o';

-- ^ beginning
-- $ end
-- | logical or
-- [abc] list of char
-- [a-d] range of char

-- get the customer where first_name starts with ELKA or AMBUR

SELECT * FROM sql_store.customers where  first_name regexp '^ELKA|^AMBUR';

-- get the customer where last_name ends with EY or ON

SELECT * FROM sql_store.customers where  last_name regexp 'EY$|ON$';

-- get the customer where last_name starts with MY or contains SE

SELECT * FROM sql_store.customers where  last_name regexp '^MY|SE';

-- get the customer where last_name contains B followed by U or R

SELECT * FROM sql_store.customers where  last_name regexp 'B[UR]';

-- get the Orders that are not shipped

SELECT * from sql_store.orders WHERE shipped_id IS NULL;

-- get the Orders where order id is 2 and sort by total price desc

SELECT *, (quantity * unit_price) AS total_price FROM sql_store.order_items WHERE order_id = 2 ORDER BY total_price DESC;

-- get top three loyal customers

SELECT * FROM sql_store.customers ORDER BY points DESC LIMIT 3;
