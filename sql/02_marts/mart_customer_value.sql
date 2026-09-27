CREATE OR REPLACE VIEW mart_customer_value AS
WITH anchor AS (
    SELECT MAX(payment_day) AS as_of_date 
    FROM stg_payment
)
SELECT 
    c.customer_id,
    c.full_name,
    c.is_active,
    COUNT(p.payment_id) AS num_payments,
    ROUND(SUM(p.amount), 2) AS total_spent,
    ROUND(AVG(p.amount), 2) AS avg_spent,
    MAX(p.payment_day) AS last_payment_day,
    (SELECT as_of_date FROM anchor) - MAX(p.payment_day) AS recency_day
FROM stg_customer c
INNER JOIN stg_payment p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.full_name, c.is_active;