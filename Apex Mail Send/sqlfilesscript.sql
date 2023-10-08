
DECLARE

    l_id        NUMBER;
    vMAIL_ID    NUMBER;
    vMAIL_FROM  VARCHAR2(1000);
    vMAIL_TO    VARCHAR2(1000);
    vMAIL_CC    VARCHAR2(1000);
    vMAIL_SUB   VARCHAR2(1000);
    vMAIL_BODY  VARCHAR2(1000);
    vMAIL_FILE  BLOB;
    vFILE_NAME  VARCHAR2(1000);
    vFILE_SIZE  VARCHAR2(1000);
    vFILE_TYPE  VARCHAR2(1000);

BEGIN

    for i in (SELECT MAIL_ID, MAIL_FROM, MAIL_TO, MAIL_CC, MAIL_SUB, MAIL_BODY, MAIL_FILE, FILE_NAME, FILE_SIZE, FILE_TYPE 
                FROM APXEMAIL WHERE MAIL_ID = (SELECT MAX(MAIL_ID) FROM APXEMAIL)) loop

        l_id := APEX_MAIL.SEND(
        p_to        => I.MAIL_TO,
        p_from      => I.MAIL_FROM,
        p_subj      => I.MAIL_SUB,
        p_body      => I.MAIL_BODY,
        p_body_html => '<b>Please</b> review the attachment');

       dbms_output.put_line ('output'||l_id);

    FOR c1 IN (
                SELECT 
                    MAIL_ID,
                    MAIL_FILE, 
                	FILE_NAME, 
                	FILE_SIZE, 
                	FILE_TYPE 
                FROM APXEMAIL
                WHERE MAIL_ID = I.MAIL_ID
        ) LOOP

        APEX_MAIL.ADD_ATTACHMENT(
            p_mail_id    => l_id,
            p_attachment => c1.MAIL_FILE,
            p_filename   => c1.FILE_NAME,
            p_mime_type  => c1.FILE_TYPE);

    END LOOP;

    COMMIT;

    end loop;

    

        
    
END;






BEGIN
    SELECT APEX_MAIL_SEQ.NEXTVAL INTO :P3_MAIL_ID FROM DUAL;
END;



  CREATE TABLE "APXEMAIL" 
   (	"MAIL_ID" NUMBER, 
	"MAIL_FROM" VARCHAR2(1000), 
	"MAIL_TO" VARCHAR2(1000), 
	"MAIL_CC" VARCHAR2(1000), 
	"MAIL_SUB" VARCHAR2(1000), 
	"MAIL_BODY" VARCHAR2(1000), 
	"MAIL_FILE" BLOB, 
	"FILE_NAME" VARCHAR2(1000), 
	"FILE_SIZE" VARCHAR2(1000), 
	"FILE_TYPE" VARCHAR2(1000)
   ) ;


CREATE SEQUENCE APXEMAIL_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE OR REPLACE FUNCTION GET_FINANCIAL_YEAR (pINPUT_DATE DATE, pSTART_MONTH NUMBER DEFAULT 7)
RETURN NUMBER
IS
    vRETURN NUMBER;
    vMONTH_ID   NUMBER := EXTRACT (MONTH FROM pINPUT_DATE);
BEGIN

    IF (pINPUT_DATE < '1-JUL-23' OR pSTART_MONTH = 1) THEN
        vRETURN := EXTRACT (YEAR FROM pINPUT_DATE);
    ELSIF pSTART_MONTH = 7 THEN

        IF vMONTH_ID BETWEEN 1 AND 6 THEN
            vRETURN := EXTRACT (YEAR FROM pINPUT_DATE);
            vRETURN := vRETURN ;
        ELSIF vMONTH_ID BETWEEN 7 AND 12 THEN
            vRETURN := EXTRACT (YEAR FROM pINPUT_DATE) + 1;
        END IF;        
        
    END IF;
    
    RETURN vRETURN;

END GET_FINANCIAL_YEAR;


--CALLING
--


SELECT GET_FINANCIAL_YEAR (TO_DATE ('02072024','DDMMRRRR')) YR FROM DUAL




var fp = $("#P3_MAIL_FILE");
var lg = fp[0].files.length; // get length
var items = fp[0].files;
if (lg > 0) {
        for (var i = 0; i < lg; i++) {
            var fileName = items[i].name; // get file name
            var fileSize = items[i].size; // get file size 
            var fileType = items[i].type; // get file type
            apex.item( "P3_FILE_NAME" ).setValue( fileName, null, true );
            apex.item( "P3_FILE_SIZE" ).setValue( fileSize, null, true );
            apex.item( "P3_FILE_TYPE" ).setValue( fileType, null, true );
 }

}