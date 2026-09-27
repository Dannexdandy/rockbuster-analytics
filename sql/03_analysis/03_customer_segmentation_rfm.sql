WITH scored AS (
    SELECT
        customer_id,
        full_name,
        recency_day,
        num_payments,
        total_spent,
        5 - NTILE(4) OVER (ORDER BY recency_day) AS r_score,
        NTILE(4) OVER (ORDER BY num_payments) AS f_score,
        NTILE(4) OVER (ORDER BY total_spent) AS m_score
    FROM mart_customer_value
)
SELECT 
    customer_id,
    full_name,
    recency_day,
    num_payments,
    total_spent,
    r_score,
    f_score,
    m_score,
    CASE 
        WHEN r_score >= 3 AND f_score >= 3 AND m_score >= 3 THEN  'Champions'
        WHEN m_score >= 3 THEN 'Big Spenders'
        WHEN r_score <= 2 AND f_score >= 2 THEN 'At Risk'
        ELSE  'Regular'
    END AS segment
FROM scored
ORDER BY (r_score + f_score + m_score) DESC, total_spent DESC;