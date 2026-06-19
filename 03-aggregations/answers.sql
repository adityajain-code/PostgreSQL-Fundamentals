-- =====================================================
-- Topic 03: Aggregations — ANSWERS
-- =====================================================

-- Q1. Total restaurants.
SELECT COUNT(*) AS total_restaurants FROM restaurants;

-- Q2. Restaurants per city.
SELECT city, COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY city
ORDER BY restaurant_count DESC;

-- Q3. Average rating.
SELECT ROUND(AVG(rating), 2) AS avg_rating FROM restaurants;

-- Q4. Total revenue from delivered orders.
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'delivered';

-- Q5. Average delivery time per city (via join).
SELECT r.city, ROUND(AVG(o.delivery_time), 1) AS avg_delivery_time
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.status = 'delivered'
GROUP BY r.city
ORDER BY avg_delivery_time;

-- Q6. Orders per payment method.
SELECT payment_method, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method
ORDER BY order_count DESC;

-- Q7. Max and min order amount.
SELECT MAX(total_amount) AS max_order,
       MIN(total_amount) AS min_order
FROM orders;

-- Q8. Cuisines with more than 1 restaurant.
SELECT cuisine, COUNT(*) AS count
FROM restaurants
GROUP BY cuisine
HAVING COUNT(*) > 1;

-- Q9. Restaurant with highest average order value.
SELECT restaurant_id, ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders
WHERE status = 'delivered'
GROUP BY restaurant_id
ORDER BY avg_order_value DESC
LIMIT 1;

-- Q10. Premium vs non-premium customer count.
SELECT is_premium, COUNT(*) AS customer_count
FROM customers
GROUP BY is_premium;

-- Q11. Total items per category.
SELECT category, SUM(quantity) AS total_ordered
FROM order_items
GROUP BY category
ORDER BY total_ordered DESC;

-- Q12. Restaurants with avg review rating above 4.
SELECT restaurant_id, ROUND(AVG(rating), 2) AS avg_review_rating
FROM reviews
GROUP BY restaurant_id
HAVING AVG(rating) > 4
ORDER BY avg_review_rating DESC;
