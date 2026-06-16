-- =====================================================
-- Topic 01: Basics — SELECT, FROM, ORDER BY, LIMIT
-- =====================================================
-- Run 00-setup files first before attempting these.
-- Try to write each query yourself before checking answers.
-- =====================================================

-- Q1. List all restaurants (show all columns).

-- Q2. Show only the name, city, and cuisine of all restaurants.

-- Q3. List all customers sorted alphabetically by name.

-- Q4. Show the top 5 most recent orders (by order_date).

-- Q5. List all delivery agents sorted by total_deliveries in descending order.

-- Q6. Show only the first 3 restaurants that opened (oldest first).

-- Q7. List all order details — show order_id, order_date, total_amount, status.
--     Sort by total_amount from highest to lowest.

-- Q8. Show all unique cities that restaurants are in.
--     Hint: use DISTINCT

-- Q9. List all restaurants and add a column that shows their rating
--     multiplied by 2 (call it double_rating).

-- Q10. Show restaurant name and how many years ago they opened.
--      Hint: use EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM opened_date)
--      Call the column years_open.
