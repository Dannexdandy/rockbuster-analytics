CREATE OR REPLACE VIEW stg_rental AS 
    SELECT
        rental_id,
        rental_date,
        return_date,
        inventory_id,
        customer_id,
        staff_id,
        (return_date IS NOT NULL) AS was_returned,
        ROUND(EXTRACT(EPOCH FROM (return_date - rental_date)) / 86400.0, 1) AS days_out
    FROM rental;