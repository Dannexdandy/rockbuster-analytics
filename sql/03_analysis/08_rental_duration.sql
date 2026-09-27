SELECT
    CASE 
        WHEN days_out IS NULL THEN '0. Not yet returned'
        WHEN days_out < 3 THEN '1. Under 3 days'
        WHEN days_out < 5 THEN '2. 3-5 days'
        WHEN days_out < 7 THEN '3. 5-7 days' 
        ELSE  '4. 7+ days'
    END AS duration_band,
    COUNT(*) AS num_rentals,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_rentals
FROM stg_rental
GROUP BY 1
ORDER BY 1;