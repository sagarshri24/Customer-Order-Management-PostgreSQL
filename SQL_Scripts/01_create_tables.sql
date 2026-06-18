CREATE TABLE customerdata_raw (
    customer_id VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE,
    customer_segment VARCHAR(20),
    account_status VARCHAR(20)
);

CREATE TABLE orderdata_raw (
    order_id VARCHAR(20),
    customer_id VARCHAR(20),
    order_date DATE,
    product_category VARCHAR(50),
    order_amount NUMERIC(10,2),
    payment_method VARCHAR(30),
    order_status VARCHAR(20),
    delivery_city VARCHAR(50)
);