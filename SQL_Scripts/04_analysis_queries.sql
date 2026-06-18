	---city wise customer segment and status---
	
	select customer_id,city,customer_segment,account_status
	from COUSTOMERDATA_raw
	group by customer_id,city,customer_segment,account_status
	order by customer_id desc;
	
	---active vs inactive---
	
	SELECT account_status,
	COUNT(*) AS customer_count
	FROM COUSTOMERDATA_raw
	GROUP BY account_status;
	
	-- state wise total customer 
	
	select state,
	count(*) as total_customer
	from COUSTOMERDATA_raw
	group by state
	order by total_customer desc;
	
	--state wise active customer 
	
	select state, count(*) as customer_status
	from COUSTOMERDATA_raw
	where account_status  = 'Active'
	group by state
	order by customer_status desc;
	
	
	-- newest registration_date--
	select *
	from COUSTOMERDATA_raw
	order by registration_date desc
	limit 10;
	
	
	---oldest registration_date
	
	select *
	from COUSTOMERDATA_raw
	order by registration_date asc
	limit 10;
	
	
	--- city wise segment--
	
	select city,
	count (*) as count_segment 
	from COUSTOMERDATA_raw
	where customer_segment = 'Basic'
	group by city
	order by count_segment desc;
	
	
	---union and union all---
	select * from COUSTOMERDATA_raw
	where customer_segment = 'Enterprise'
	
	union 
	
	select * from COUSTOMERDATA_raw
	where account_status = 'Closed';
	
	
	SELECT 'Mumbai' AS category,
	COUNT(*) AS total_number
	FROM COUSTOMERDATA_raw
	WHERE city = 'Mumbai'
	
	UNION
	
	SELECT 'Closed Customers' AS category,
	COUNT(*) AS total_number
	FROM COUSTOMERDATA_raw
	WHERE account_status = 'Closed';
	 
	
	---Total Revenue---
	
	SELECT SUM(order_amount) AS total_revenue
	FROM orderdata_raw;
	
	
	---Average Order Value---
	
	SELECT avg(order_amount) AS avg_order
	FROM orderdata_raw;
	
	
	---oder by status---
	
	select order_status,
	count(*) as total_counts
	from orderdata_raw
	group by order_status
	order by total_counts desc;
	
	
	---payment method--
	
	SELECT payment_method,
	COUNT(*) AS total_orders
	FROM orderdata_raw
	GROUP BY payment_method
	order by total_orders desc;
	
	---top product category-----
	
	SELECT product_category,
	COUNT(*) AS total_orders
	FROM orderdata_raw
	GROUP BY product_category
	order by total_orders desc
	limit 10;
	
	
	---joins--
	
	SELECT a.customer_id,
		   a.city,
		   b.order_status,
		   b.order_amount
	FROM COUSTOMERDATA_raw a
	INNER JOIN orderdata_raw b
	ON a.customer_id = b.customer_id;
	
	----left join----
	
	SELECT *
	FROM COUSTOMERDATA_raw a
	left join orderdata_raw b
	ON a.customer_id = b.customer_id;
	
	----right join----

	SELECT *
	FROM COUSTOMERDATA_raw a
	right join orderdata_raw b
	ON a.customer_id = b.customer_id;
	
	
	
	
	-----wimdow function----
	
	select customer_id,product_category,order_amount,
	rank()over(partition by product_category order by order_amount desc) as product_category_rank
	from orderdata_raw;
	
	
		
	SELECT customer_id, product_category, order_amount,
	ROW_NUMBER() OVER (PARTITION BY product_category ORDER BY order_amount DESC) AS ROW_NUM
	FROM orderdata_raw;
	
	
	SELECT customer_id, product_category, order_amount,
	dense_rank() OVER (PARTITION BY product_category ORDER BY order_amount DESC) AS dense_rank
	FROM orderdata_raw;
	
	
	select * from orderdata_raw;
	
	
	
	-----VIEW-----
	
	
		CREATE VIEW vw_orderdata_raw AS
		SELECT
			order_id,
			customer_id,
			order_date,
			product_category,
			order_amount,
			payment_method,
			order_status,
			delivery_city
		FROM orderdata_raw;
	
	SELECT * FROM vw_orderdata_raw;
	
	
		CREATE OR REPLACE VIEW vw_orderdata_raw AS
		SELECT
			order_id,
			customer_id,
			order_date,
			product_category,
			order_amount,
			payment_method
		FROM orderdata_raw;	
	
	
	   DROP VIEW vw_orderdata_raw;
	
	
	   CREATE OR REPLACE VIEW vw_orderdata_raw AS
		SELECT
			order_id,
			customer_id,
			order_date,
			product_category
		FROM orderdata_raw;	