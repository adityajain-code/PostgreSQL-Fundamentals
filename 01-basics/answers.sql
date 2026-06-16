-- =====================================================
-- Topic 01: Basics — ANSWERS
-- =====================================================

-- Q1. List all restaurants.
SELECT * FROM restaurants;

-- Q2. Show only name, city, cuisine.
SELECT name, city, cuisine FROM restaurants;

-- Q3. All customers sorted alphabetically.
SELECT * FROM customers ORDER BY name ASC;

-- Q4. Top 5 most recent orders.
SELECT * FROM orders ORDER BY order_date DESC LIMIT 5;

-- Q5. Delivery agents sorted by total_deliveries descending.
SELECT * FROM delivery_agents ORDER BY total_deliveries DESC;

-- Q6. First 3 restaurants by opened_date.
SELECT * FROM restaurants ORDER BY opened_date ASC LIMIT 3;

-- Q7. Orders with key columns sorted by total_amount desc.
SELECT order_id, order_date, total_amount, status
FROM orders
ORDER BY total_amount DESC;

-- Q8. Unique cities restaurants are in.
SELECT DISTINCT city FROM restaurants;

-- Q9. Rating multiplied by 2.
SELECT name, rating, rating * 2 AS double_rating FROM restaurants;

-- Q10. Years since opened.
SELECT name,
       opened_date,
       EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM opened_date) AS years_open
FROM restaurants
ORDER BY years_open DESC;
