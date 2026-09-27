CREATE OR REPLACE VIEW stg_customer AS
    SELECT 
        customer_id,
        first_name,
        last_name,
        first_name || '' || last_name AS full_name,
        email,
        address_id,
        store_id,
        (active = 1) AS is_active
    FROM customer;