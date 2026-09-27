SELECT
    co.country,
    COUNT(DISTINCT c.customer_id) AS num_customers,
    ROUND(SUM(p.amount), 2) AS revenue
FROM stg_payment p
LEFT JOIN customer c ON p.customer_id = c.customer_id
LEFT JOIN address a ON c.address_id = a.address_id
LEFT JOIN city ci ON a.city_id = ci.city_id
LEFT JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY revenue DESC;