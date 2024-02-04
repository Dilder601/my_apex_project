-- send sms mobile in oracle apex



CREATE OR REPLACE 
PROCEDURE P_SEND_MSG (IN_MSG VARCHAR2, IN_PHONE VARCHAR2)
AS
    v_url          VARCHAR2 (4000);
    VAR_API_KEY    VARCHAR2 (100) := 'WfETHqgdZbbdU6C1iI8s';
    VAR_SENDERID   VARCHAR2 (1000) := '8809617615235';
    v_body         CLOB;
    l_response     CLOB;
BEGIN

    --apex_web_service.g_request_headers.delete; 

    v_url :='http://bulksmsbd.net/api/smsapi?api_key='|| VAR_API_KEY|| '&type=text&number='|| UTL_URL.ESCAPE (IN_PHONE, TRUE)|| '&senderid='|| UTL_URL.ESCAPE (VAR_SENDERID, TRUE)|| '&message='|| UTL_URL.ESCAPE (IN_MSG, TRUE, 'UTF8');


    v_body := '{
    "chatId": "' || IN_PHONE || '@c.us",
    "message": "' || IN_MSG || '"}';

    apex_web_service.g_request_headers (1).name := 'Content-Type';
    apex_web_service.g_request_headers (1).VALUE := 'application/json';
    l_response :=
        apex_web_service.make_rest_request (p_url           => v_url,
                                            p_http_method   => 'POST',
                                            p_body          => v_body);

    DBMS_OUTPUT.put_line ('Response: ' || l_response);
END P_SEND_MSG;
/



BEGIN
P_SEND_MSG('TEST MSG', '01635000601');
END;

--- MULTIPLE MSG SEND ONE CLICK

BEGIN
    FOR I IN (
        SELECT 1 ID, 01635000601 CONTACT_NO
            FROM DUAL
            UNION ALL
            SELECT 2 ID, 01716724245 CONTACT_NO
            FROM DUAL
            UNION ALL
            SELECT 3 ID, 01796844288 CONTACT_NO
            FROM DUAL
    ) LOOP


    P_SEND_MSG('TEST MSG MULTIPLE NUMBER', I.CONTACT_NO);

    END LOOP;

END;


--- production server impliment / process

BEGIN
    FOR I IN (
        
            SELECT A.COLLECTION_AMOUT, A.MEMBER_NO, A.CONTACT_NO, A.MEMBER_ID, B.TOTAL_AMT, A.COLLECTION_MODE,
                     'Dear Investor, your A/C'|| A.MEMBER_NO||' '|| 'credited by '|| A.COLLECTION_MODE|| 'Tk '||A.COLLECTION_AMOUT|| ' on '||A.COLLECTION_DATE|| 'C/B Tk '|| B.TOTAL_AMT||'. Visit: https://apex.oracle.com/pls/apex/r/swapnotory/swapnotory' MSG
              FROM
              (
                  SELECT SUM(VDC.COLLECTION_AMOUT) COLLECTION_AMOUT, VM.ACCOUNT_NO  MEMBER_NO, TRIM(VM.CONTACT_NO) CONTACT_NO, 
                          VDC.MEMBER_ID, ACE.ELEMENT_NAME COLLECTION_MODE, TRUNC(VDC.CREATED_AT) COLLECTION_DATE 
                    FROM VV_DAILY_COLLECTION VDC
                    LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VDC.MEMBER_ID
                    LEFT JOIN ADM_CODE_ELEMENTS ACE ON ACE.ELEMENT_ID = VDC.COLLECTION_MODE
                    WHERE VDC.IS_POST = 'S'  
                    GROUP BY  VM.ACCOUNT_NO, VM.CONTACT_NO,  VDC.MEMBER_ID, ACE.ELEMENT_NAME, VDC.CREATED_AT 
              ) A
              LEFT JOIN (
                          SELECT SUM(COLLECTION_AMOUT) TOTAL_AMT, MEMBER_ID
                          FROM VV_DAILY_COLLECTION
                          GROUP BY MEMBER_ID
              ) B ON B.MEMBER_ID = A.MEMBER_ID

    ) LOOP


    P_SEND_MSG(I.MSG, I.CONTACT_NO);

    END LOOP;

END;
