-- send sms mobile



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
