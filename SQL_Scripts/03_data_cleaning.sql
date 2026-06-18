----check null values---
	
	select count(*)as total_rows,
	count(customer_id) as customer_id_filled,
	count(first_name) as first_name_filled,
	count(last_name) as last_name_filled,
	count(email) as email_filled,
	count(city) as city_filled,
	count(state) as state_filled,
	count(registration_date) as registration_date_filled,
	count(customer_segment) as customer_segment_filled,
	count(account_status) as account_status_filled
	from COUSTOMERDATA_raw;
	
	--fill null values 
	
	UPDATE COUSTOMERDATA_raw
	SET first_name = COALESCE(first_name, 'Unknown'),
		last_name = COALESCE(last_name, 'Unknown'),
		email = COALESCE(email, 'unknown@email.com'),
		city = COALESCE(city, 'Mumbai'),
		state = COALESCE(state, 'Maharashtra'),
		customer_segment = COALESCE(customer_segment, 'Regular'),
		account_status = COALESCE(account_status, 'Active');
	
	
	update COUSTOMERDATA_raw
	set registration_date = current_date
	where registration_date is null;
	
	
		
	--duplicate check
	
	select customer_id,
	count(*)
	from COUSTOMERDATA_raw
	group by customer_id
	having count(*)>1;

	-- Remove Extra Spaces

	UPDATE COUSTOMERDATA_raw
	SET first_name = TRIM(first_name),
	last_name = TRIM(last_name),
	city = TRIM(city),
	state = TRIM(state);

	-- Standardize Text


    UPDATE COUSTOMERDATA_raw
    SET account_status = INITCAP(account_status);

    UPDATE COUSTOMERDATA_raw
    SET customer_segment = INITCAP(customer_segment);


--check null vales ---
	
	select count(*) as total_rows,
	count(order_id) as order_id_filled,
	count(customer_id) as customer_id_filled,
	count(order_date) as order_date_filled,
	count(product_category) as product_category_filled,
	count(order_amount) as order_amount_filled,
	count(payment_method) as payment_method_filled,
	count(order_status) as order_status_filled,
	count(delivery_city) as delivery_city_filled
	from orderdata_raw;
	
	---fill null values 
	
	UPDATE orderdata_raw
	SET customer_id = COALESCE(customer_id, 'unknown'),
		order_date = COALESCE(order_date, CURRENT_DATE),	
		product_category = COALESCE(product_category, 'unknown'),
		order_amount = COALESCE(order_amount, 0),
		payment_method = COALESCE(payment_method, 'unknown'),
		order_status = COALESCE(order_status, 'pending'),
		delivery_city = COALESCE(delivery_city, 'unknown');
	
	
	---duplicate check
	
	select order_id,
	count(*)
	from orderdata_raw
	group by order_id 
	having count(*) > 1;

	-- Remove Extra Spaces

	UPDATE orderdata_raw
    SET product_category = TRIM(product_category),
    payment_method = TRIM(payment_method),
    order_status = TRIM(order_status),
    delivery_city = TRIM(delivery_city);