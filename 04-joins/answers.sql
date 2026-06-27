-- =====================================================
-- Topic 04: JOINs — ANSWERS
-- =====================================================

-- Q1. Orders with customer name and restaurant name.
SELECT o.order_id, c.name AS customer_name, r.name AS restaurant_name,
       o.total_amount, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

-- Q2. All customers with their orders (LEFT JOIN).
SELECT c.name, o.order_id, o.total_amount, o.status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Q3. All restaurants with order count (including 0).
SELECT r.name, r.city, COUNT(o.order_id) AS total_orders
FROM restaurants r
LEFT JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.name, r.city
ORDER BY total_orders DESC;

-- Q4. Orders with delivery agent name and rating.
SELECT o.order_id, o.total_amount, d.name AS agent_name, d.rating AS agent_rating
FROM orders o
JOIN delivery_agents d ON o.agent_id = d.agent_id;

-- Q5. Orders above 500 with customer and restaurant names.
SELECT c.name AS customer, r.name AS restaurant,
       o.total_amount, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.total_amount > 500;

-- Q6. Reviews with customer and restaurant names.
SELECT rev.review_id, c.name AS customer, r.name AS restaurant,
       rev.rating, rev.comment
FROM reviews rev
JOIN customers c ON rev.customer_id = c.customer_id
JOIN restaurants r ON rev.restaurant_id = r.restaurant_id;

-- Q7. Delivery agents with no orders.
SELECT d.name, d.city
FROM delivery_agents d
LEFT JOIN orders o ON d.agent_id = o.agent_id
WHERE o.order_id IS NULL;

-- Q8. Order items with restaurant name.
SELECT oi.item_name, oi.category, oi.quantity, oi.price, r.name AS restaurant
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

-- Q9. Customer name, order count, total spent.
SELECT c.name, COUNT(o.order_id) AS order_count,
       COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- Q10. Restaurant name with avg review rating (only reviewed ones).
SELECT r.name, r.cuisine, r.city,
       ROUND(AVG(rev.rating), 2) AS avg_review_rating
FROM restaurants r
JOIN reviews rev ON r.restaurant_id = rev.restaurant_id
GROUP BY r.restaurant_id, r.name, r.cuisine, r.city
ORDER BY avg_review_rating DESC;
