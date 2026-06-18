-- =====================================================
-- Topic 02: Filtering — ANSWERS
-- =====================================================

-- Q1. Restaurants in Bangalore.
SELECT * FROM restaurants WHERE city = 'Bangalore';

-- Q2. Closed restaurants.
SELECT * FROM restaurants WHERE is_open = FALSE;

-- Q3. Orders above 700.
SELECT * FROM orders WHERE total_amount > 700;

-- Q4. Hyderabad restaurants with rating above 4.3.
SELECT * FROM restaurants WHERE rating > 4.3 AND city = 'Hyderabad';

-- Q5. Cancelled or pending orders.
SELECT * FROM orders WHERE status IN ('cancelled', 'pending');

-- Q6. Customers who joined in 2021 or 2022.
SELECT * FROM customers WHERE joined_date BETWEEN '2021-01-01' AND '2022-12-31';

-- Q7. Restaurants starting with 'S'.
SELECT * FROM restaurants WHERE name LIKE 'S%';

-- Q8. UPI + delivered orders.
SELECT * FROM orders WHERE payment_method = 'upi' AND status = 'delivered';

-- Q9. Indian or Chinese restaurants.
SELECT * FROM restaurants WHERE cuisine IN ('Indian', 'Chinese');

-- Q10. Slow delivery but still delivered.
SELECT * FROM orders WHERE delivery_time > 45 AND status = 'delivered';

-- Q11. Customers with gmail (returns 0 rows — demonstrates LIKE working correctly).
SELECT * FROM customers WHERE email LIKE '%gmail%';

-- Q12. Restaurants with rating between 4.0 and 4.5.
SELECT * FROM restaurants WHERE rating BETWEEN 4.0 AND 4.5;
