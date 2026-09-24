CREATE INDEX IF NOT EXISTS idx_payment_customer ON payment(customer_id);
CREATE INDEX IF NOT EXISTS idx_payment_date ON payment(payment_date);
CREATE INDEX IF NOT EXISTS idx_rental_customer ON rental(customer_id);
CREATE INDEX IF NOT EXISTS idx_rental_inventory ON rental(inventory_id);
CREATE INDEX IF NOT EXISTS idx_rental_date ON rental(rental_date);
CREATE INDEX IF NOT EXISTS idx_inventory_film ON inventory(film_id);
CREATE INDEX IF NOT EXISTS idx_film_category_cat ON film_category(category_id);