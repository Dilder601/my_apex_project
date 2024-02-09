CREATE OR REPLACE TYPE GET_MONTHS AS OBJECT (SRL_NO NUMBER, MONTH_ID NUMBER, MONTH_NAME VARCHAR2(100), YEAR_ID NUMBER)
/

CREATE OR REPLACE TYPE GET_MONTH_TAB AS TABLE OF GET_MONTHS
/

CREATE OR REPLACE FUNCTION GET_MONTHS_LIST (PDATE_FROM DATE, PDATE_TO DATE, PFORMAT VARCHAR2)
    RETURN GET_MONTH_TAB
    PIPELINED
IS
BEGIN
    FOR I IN (
                 SELECT SRL_NO, MONTH_NAME, TO_NUMBER(TRIM(MONTH_ID)) MONTH_ID, TO_NUMBER(TRIM(YEAR_ID)) YEAR_ID
                  FROM
                  (
                        SELECT A.SRL_NO,A.MONTH_NAME, 
                       CASE 
                            WHEN TRIM(A.MONTH_NAME) ='JANUARY' THEN 55 
                            WHEN TRIM(A.MONTH_NAME) ='FEBRUARY' THEN 56 
                            WHEN TRIM(A.MONTH_NAME) ='MARCH' THEN 57 
                            WHEN TRIM(A.MONTH_NAME) ='APRIL' THEN 58 
                            WHEN TRIM(A.MONTH_NAME) ='MAY' THEN 59 
                            WHEN TRIM(A.MONTH_NAME) ='JUNE' THEN 60 
                            WHEN TRIM(A.MONTH_NAME) ='JULY' THEN 61 
                            WHEN TRIM(A.MONTH_NAME) ='AUGUST' THEN 62 
                            WHEN TRIM(A.MONTH_NAME) ='SEPTEMBER' THEN 63 
                            WHEN TRIM(A.MONTH_NAME) ='OCTOBER' THEN 64 
                            WHEN TRIM(A.MONTH_NAME) ='NOVEMBER' THEN 65 
                            WHEN TRIM(A.MONTH_NAME) ='DECEMBER' THEN 66 
                        ELSE 
                        NULL 
                        END MONTH_ID, A.YEAR_ID
                FROM 
                (
                WITH DATE_RANGE AS (
                  SELECT --TO_DATE(:PDATE_FROM,  :PFORMAT)
                  PDATE_FROM AS START_DATE,
                         --TO_DATE(:PDATE_TO,  :PFORMAT)
                         PDATE_TO AS END_DATE
                  FROM DUAL
                )
                SELECT  ROWNUM AS SRL_NO, TO_CHAR(ADD_MONTHS(START_DATE, LEVEL - 1), 'MONTH') AS MONTH_NAME, 
                        TO_NUMBER(TO_CHAR(ADD_MONTHS(START_DATE, LEVEL - 1), 'YYYY')) AS YEAR_ID
                FROM DATE_RANGE
                CONNECT BY LEVEL <= MONTHS_BETWEEN(END_DATE, START_DATE) + 1
                ) A
                ))
    LOOP
        PIPE ROW (GET_MONTHS (I.SRL_NO,I.MONTH_ID,I.MONTH_NAME,I.YEAR_ID));
    END LOOP;
END GET_MONTHS_LIST;

-- SELECT * FROM GET_MONTHS_LIST('01-jan-2024','31-MAR-2024','ddmmrr')

CREATE OR REPLACE FUNCTION GET_MONTHS_LIST1 (PDATE_FROM VARCHAR2, PDATE_TO VARCHAR2, PFORMAT VARCHAR2)
    RETURN GET_MONTH_TAB
    PIPELINED
IS
BEGIN
    FOR I IN (
                 SELECT SRL_NO, MONTH_NAME, TO_NUMBER(TRIM(MONTH_ID)) MONTH_ID, TO_NUMBER(TRIM(YEAR_ID)) YEAR_ID
                  FROM
                  (
                        SELECT A.SRL_NO,A.MONTH_NAME, 
                       CASE 
                            WHEN TRIM(A.MONTH_NAME) ='JANUARY' THEN 55 
                            WHEN TRIM(A.MONTH_NAME) ='FEBRUARY' THEN 56 
                            WHEN TRIM(A.MONTH_NAME) ='MARCH' THEN 57 
                            WHEN TRIM(A.MONTH_NAME) ='APRIL' THEN 58 
                            WHEN TRIM(A.MONTH_NAME) ='MAY' THEN 59 
                            WHEN TRIM(A.MONTH_NAME) ='JUNE' THEN 60 
                            WHEN TRIM(A.MONTH_NAME) ='JULY' THEN 61 
                            WHEN TRIM(A.MONTH_NAME) ='AUGUST' THEN 62 
                            WHEN TRIM(A.MONTH_NAME) ='SEPTEMBER' THEN 63 
                            WHEN TRIM(A.MONTH_NAME) ='OCTOBER' THEN 64 
                            WHEN TRIM(A.MONTH_NAME) ='NOVEMBER' THEN 65 
                            WHEN TRIM(A.MONTH_NAME) ='DECEMBER' THEN 66 
                        ELSE 
                        NULL 
                        END MONTH_ID, A.YEAR_ID
                FROM 
                (
                WITH DATE_RANGE AS (
                  SELECT TO_DATE(PDATE_FROM,  PFORMAT) AS START_DATE,
                         TO_DATE(PDATE_TO,  PFORMAT) AS END_DATE
                  FROM DUAL
                )
                SELECT  ROWNUM AS SRL_NO, TO_CHAR(ADD_MONTHS(START_DATE, LEVEL - 1), 'MONTH') AS MONTH_NAME, 
                        TO_NUMBER(TO_CHAR(ADD_MONTHS(START_DATE, LEVEL - 1), 'YYYY')) AS YEAR_ID
                FROM DATE_RANGE
                CONNECT BY LEVEL <= MONTHS_BETWEEN(END_DATE, START_DATE) + 1
                ) A
                ))
    LOOP
        PIPE ROW (GET_MONTHS (I.SRL_NO,I.MONTH_ID,I.MONTH_NAME,I.YEAR_ID));
    END LOOP;
END GET_MONTHS_LIST1;

--SELECT * FROM GET_MONTHS_LIST1('010124','310324','ddmmrr')