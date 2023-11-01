DECLARE
    S VARCHAR2(10) := 'tenet';
    L VARCHAR2(20);
    T VARCHAR2(10);
BEGIN
    FOR I IN REVERSE 1..LENGTH(S) LOOP
        L := SUBSTR(S, I, 1);
        T := T||''||L;
    END LOOP;
    
    IF T = S THEN
        DBMS_OUTPUT.PUT_LINE(T||''||' is palindrome');
    ELSE
        DBMS_OUTPUT.PUT_LINE(T||''||' is not palindrome');
    END IF;
    
END;