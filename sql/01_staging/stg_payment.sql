CREATE OR REPLACE VIEW stg_payment AS
SELECT 
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date::date AS payment_day
FROM payment;