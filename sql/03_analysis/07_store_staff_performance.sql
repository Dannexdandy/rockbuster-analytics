SELECT
    s.staff_id,
    s.first_name || ' ' || s.last_name AS staff_name,
    s.store_id,
    COUNT(p.payment_id) AS payment_handled,
    ROUND(SUM(p.amount), 2) AS revenue,
    ROUND(100 * SUM(p.amount) / SUM(SUM(p.amount)) OVER (), 2) AS pct_of_total
FROM staff s
LEFT JOIN stg_payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name, s.store_id
ORDER BY revenue DESC;
