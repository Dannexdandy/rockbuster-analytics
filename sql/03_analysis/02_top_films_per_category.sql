WITH ranked AS (
    SELECT 
        category,
        title,
        revenue,
        RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rank_in_category
    FROM mart_film_performance
    WHERE category IS NOT NULL
)
SELECT 
    category,
    rank_in_category,
    title,
    revenue
FROM ranked
WHERE rank_in_category <= 3
ORDER BY category, rank_in_category;