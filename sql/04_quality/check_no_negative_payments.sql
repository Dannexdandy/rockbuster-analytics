DO
$$
DECLARE bad_count INT;
BEGIN
    SELECT COUNT(*) INTO bad_count FROM payment WHERE amount < 0;
    IF bad_count > 0 THEN
        RAISE EXCEPTION 'FAIL: % payments have a negative amount', bad_count;
    END IF;
    RAISE NOTICE 'PASS: No negative payments';
END
$$;
