/* kjohnson_assignment8.sql
   Kimberlee Johnson
   CS 150A, Spring 2020 */

/* Query 0 */
USE bookstore; 

/* Query 1 */
SELECT COUNT(*) as number_of_orders, SUM(tax_amount) AS sum_of_tax_amount
FROM orders; 

/* Query 2 */
SELECT product_id, COUNT(DISTINCT order_id) as NumOrders
FROM orderitems
GROUP BY product_id 
ORDER BY  NumOrders DESC; 

/* Query 3 */
SELECT c.category_name, COUNT(p.category_id) AS product_count, MAX(p.list_price) AS most_expensive_product 
FROM category c 
INNER JOIN product p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC; 

/* Query 4 */
SELECT c.email_address, SUM(oi.item_price * oi.quantity) AS item_price_total, SUM(oi.discount_amount * oi.quantity) AS discount_amount_total
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY item_price_total DESC; 

/* Query 5 */
SELECT c.email_address, COUNT(DISTINCT o.order_id) AS order_count, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total 
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY order_total DESC;

/* Query 6 */
SELECT c.email_address, COUNT(DISTINCT o.order_id) AS order_count, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total 
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderitems oi ON o.order_id = oi.order_id
WHERE oi.item_price > 400
GROUP BY c.email_address
ORDER BY order_total DESC;

/* Query 7 */
SELECT c.email_address, COUNT(DISTINCT oi.product_id) AS number_of_products
FROM customer c 
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING number_of_products > 1; 

/* Query 8 */
SELECT v.vendor_id, COUNT(*)
FROM vendor v
INNER JOIN product p on v.vendor_id = p.vendor_id 
WHERE p.list_price > 100
GROUP BY v.vendor_id; 

/* Query 9 */
SELECT p.vendor_id, p.category_id, COUNT(DISTINCT product_id) AS number_of_products, AVG(p.list_price) AS average_price
FROM product p
GROUP BY p.vendor_id, p.category_id
HAVING number_of_products > 1; 

/* Query 10 */
SELECT COUNT(DISTINCT product_id)
FROM product p 
JOIN category c on p.category_id = c.category_id 
WHERE c.category_name = 'printer';