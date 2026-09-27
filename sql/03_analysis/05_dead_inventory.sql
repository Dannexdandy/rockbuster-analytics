SELECT 
    f.film_id,
    f.title,
    f.rating,
    f.rental_rate
FROM stg_film f
LEFT JOIN inventory inv ON f.film_id = inv.film_id
LEFT JOIN rental r ON inv.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL
ORDER BY f.title;