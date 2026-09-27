WITH customer_totals AS (
    SELECT
        customer_id,
        full_name,
        total_spent
    FROM mart_customer_value
),
avg_total AS (
    SELECT
        ROUND(AVG(total_spent), 2) AS avg_customer_total
    FROM customer_totals
)
SELECT
    customer_id,
    full_name,
    total_spent,
    (SELECT avg_customer_total FROM avg_total) AS company_average
FROM customer_totals
WHERE total_spent > (SELECT avg_customer_total FROM avg_total)
ORDER BY total_spent DESC;