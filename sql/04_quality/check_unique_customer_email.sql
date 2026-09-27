DO 
$$
DECLARE dup_count INT;
BEGIN
    SELECT COUNT(*) INTO dup_count FROM (
        SELECT email FROM customer
        WHERE customer_id IS NOT NULL
        GROUP BY email
        HAVING COUNT(*) > 1
    ) dups;
    IF dup_count > 0 THEN
        RAISE EXCEPTION 'FAIL: % email(s) shared by multiple customers', dup_count;
    END IF;
    RAISE NOTICE 'PASS: all customer emails are unique';
END
$$;