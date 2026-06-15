-- =====================================================
-- PostgreSQL Practice Dataset: Food Delivery App
-- Tables: restaurants, customers, orders, order_items,
--         delivery_agents, reviews
-- =====================================================

DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS delivery_agents CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS restaurants CASCADE;

CREATE TABLE restaurants (
    restaurant_id   SERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    city            TEXT NOT NULL,
    cuisine         TEXT NOT NULL,
    rating          NUMERIC(2,1),
    price_range     TEXT CHECK (price_range IN ('budget', 'mid', 'premium')),
    is_open         BOOLEAN DEFAULT TRUE,
    opened_date     DATE
);

CREATE TABLE customers (
    customer_id     SERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    city            TEXT NOT NULL,
    email           TEXT UNIQUE,
    joined_date     DATE,
    is_premium      BOOLEAN DEFAULT FALSE
);

CREATE TABLE delivery_agents (
    agent_id        SERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    city            TEXT NOT NULL,
    rating          NUMERIC(2,1),
    total_deliveries INT DEFAULT 0,
    joined_date     DATE
);

CREATE TABLE orders (
    order_id        SERIAL PRIMARY KEY,
    customer_id     INT REFERENCES customers(customer_id),
    restaurant_id   INT REFERENCES restaurants(restaurant_id),
    agent_id        INT REFERENCES delivery_agents(agent_id),
    order_date      TIMESTAMP,
    delivery_time   INT,
    total_amount    NUMERIC(8,2),
    status          TEXT CHECK (status IN ('delivered', 'cancelled', 'pending')),
    payment_method  TEXT CHECK (payment_method IN ('cash', 'card', 'upi'))
);

CREATE TABLE order_items (
    item_id         SERIAL PRIMARY KEY,
    order_id        INT REFERENCES orders(order_id),
    item_name       TEXT NOT NULL,
    category        TEXT,
    quantity        INT,
    price           NUMERIC(6,2)
);

CREATE TABLE reviews (
    review_id       SERIAL PRIMARY KEY,
    order_id        INT REFERENCES orders(order_id),
    customer_id     INT REFERENCES customers(customer_id),
    restaurant_id   INT REFERENCES restaurants(restaurant_id),
    rating          INT CHECK (rating BETWEEN 1 AND 5),
    comment         TEXT,
    review_date     DATE
);
