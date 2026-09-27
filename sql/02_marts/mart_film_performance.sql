CREATE OR REPLACE VIEW mart_film_performance AS
SELECT
    f.film_id,
    f.title,
    f.rating,
    cat.name AS category,
    COUNT(DISTINCT r.rental_id) AS times_rented,
    ROUND(COALESCE(SUM(p.amount), 0), 2) AS revenue
FROM stg_film f
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category cat ON fc.category_id = cat.category_id
LEFT JOIN inventory inv ON f.film_id = inv.film_id
LEFT JOIN rental r ON inv.inventory_id = r.inventory_id
LEFT JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id, f.title, f.rating, cat.name;