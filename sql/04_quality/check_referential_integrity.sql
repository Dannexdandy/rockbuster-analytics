DO
$$
DECLARE orphan_count INT;
BEGIN
    SELECT COUNT(*) INTO orphan_count
    FROM payment p
    LEFT JOIN customer c ON p.customer_id = c.customer_id
    WHERE c.customer_id IS NULL;
    IF orphan_count > 0 THEN
        RAISE EXCEPTION 'FAIL: % payment(s) reference a missing customer', orphan_count;
    END IF;
    RAISE NOTICE 'PASS: all payments reference a valid customer';
END
$$;