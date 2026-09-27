CREATE OR REPLACE VIEW mart_monthly_revenue AS
    SELECT
        DATE_TRUNC('month',payment_day)::date AS month,
        COUNT(*) AS num_payments,
        ROUND(SUM(amount), 2) AS revenue
    FROM stg_payment
    GROUP BY DATE_TRUNC('month', payment_day)
    ORDER BY month;