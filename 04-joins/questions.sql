-- =====================================================
-- Topic 04: JOINs — INNER, LEFT, RIGHT, FULL OUTER
-- =====================================================

-- Q1. Show each order with the customer's name and the restaurant's name.
--     (INNER JOIN orders + customers + restaurants)
SELECT
    ord.order_id,
    cus.name AS customer_name,
    res.name AS restaurant_name,
    ord.total_amount,
    ord.status
FROM orders ord
INNER JOIN customers cus
ON ord.customer_id = cus.customer_id
INNER JOIN restaurants res
ON ord.restaurant_id = res.restaurant_id;

-- Q2. Show all customers and their orders (if they have any).
--     Customers with no orders should still appear.
--     Hint: LEFT JOIN
SELECT *
FROM customers cus
LEFT JOIN orders ord
ON cus.customer_id = ord.customer_id;

-- Q3. Show all restaurants and how many orders they've received.
--     Include restaurants with 0 orders.
--     Hint: LEFT JOIN + COUNT
SELECT
    res.restaurant_id,
    res.name,
    res.city,
    COUNT(ord.order_id) AS order_count
FROM restaurants res
LEFT JOIN orders ord
ON res.restaurant_id = ord.restaurant_id
GROUP BY res.restaurant_id, res.name, res.city
ORDER BY order_count DESC;

-- Q4. Show each order with the delivery agent's name and rating.
SELECT
    ord.order_id,
    ord.total_amount,
    del.name AS agent_name,
    del.rating AS agent_rating
FROM orders ord
INNER JOIN delivery_agents del
ON ord.agent_id = del.agent_id;

-- Q5. Show customer name, restaurant name, order amount, and order status
--     for all orders above ₹500.
SELECT
    cus.name AS customer_name,
    res.name AS restaurant_name,
    ord.total_amount AS order_amount,
    ord.status AS order_status
FROM orders ord
INNER JOIN customers cus
ON cus.customer_id = ord.customer_id
INNER JOIN restaurants res
ON res.restaurant_id = ord.restaurant_id;

-- Q6. Show all reviews with the customer name and restaurant name.
SELECT *
FROM reviews rev
INNER JOIN customers cus
ON rev.customer_id = cus.customer_id
INNER JOIN restaurants res
ON rev.restaurant_id = res.restaurant_id;

-- Q7. Which delivery agents have never delivered an order?
--     Hint: LEFT JOIN agents to orders, look for NULL on order side

-- Q8. Show each order_item with the restaurant name it came from.
--     (order_items -> orders -> restaurants)

-- Q9. Show customer name, total number of orders they placed,
--     and total amount they spent. Include customers with 0 orders.

-- Q10. Show restaurant name, cuisine, city, and the average
--      rating from the reviews table (not the restaurants table).
--      Only include restaurants that have at least one review.
