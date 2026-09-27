CREATE OR REPLACE VIEW stg_film AS
    SELECT
        film_id,
        title,
        release_year,
        rental_rate,
        rental_duration,
        length AS length_minutes,
        replacement_cost,
        rating
    FROM film;