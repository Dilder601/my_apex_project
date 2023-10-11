--- its only on HR schema

CREATE OR REPLACE PROCEDURE HR.PD_DEPT_EMP (pDEPT_ID             IN OUT  NUMBER,
                                         pDEPTEMP             IN      CLOB,
                                         pSTATUS              OUT     CLOB)
IS

    vINPUT_OBJ  JSON_OBJECT_T := NEW JSON_OBJECT_T;
    vINPUT_ARR  JSON_ARRAY_T;
    vOUTPUT_OBJ JSON_OBJECT_T := NEW JSON_OBJECT_T;
    vMESSAGE    VARCHAR2(4000);

BEGIN

    IF NVL(pDEPT_ID,0) = 0 THEN

        vINPUT_OBJ := JSON_OBJECT_T.PARSE(pDEPTEMP);
        vINPUT_ARR := vINPUT_OBJ.GET_ARRAY('dept-data');

        FOR I IN 0..vINPUT_ARR.GET_SIZE-1 LOOP

            DECLARE 
                vDEPTEMP_OBJ            JSON_OBJECT_T;
                
                vDEPARTMENT_NAME     VARCHAR2(30);
                vMANAGER_ID          NUMBER(6);
                vLOCATION_ID         NUMBER(4);
                vEMPDATA             JSON_ARRAY_T;


            BEGIN
                vDEPTEMP_OBJ    := JSON_OBJECT_T(vINPUT_ARR.GET(I));
                
                vDEPARTMENT_NAME     := vDEPTEMP_OBJ.GET_STRING('department_name');
                vMANAGER_ID          := vDEPTEMP_OBJ.GET_NUMBER('manager_id');
                vLOCATION_ID         := vDEPTEMP_OBJ.GET_NUMBER('location_id');
                
                pDEPT_ID         := DEPARTMENT_SEQ.NEXTVAL;

                INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
                                 VALUES (pDEPT_ID, vDEPARTMENT_NAME, vMANAGER_ID, vLOCATION_ID);
                     
                        DBMS_OUTPUT.PUT_LINE(1);
                     
                     
                vEMPDATA := vDEPTEMP_OBJ.GET_ARRAY('empdtl-data');
                
                FOR J IN 0..vEMPDATA.GET_SIZE-1 LOOP
                    
                    DECLARE
                    
                         vEMPDTLDATA_OBJ     JSON_OBJECT_T;
                         vEMPLOYEE_ID       NUMBER;
                         vFIRST_NAME        VARCHAR2(20);   
                         vLAST_NAME         VARCHAR2(25);  
                         vEMAIL             VARCHAR2(25);
                         vPHONE_NUMBER      VARCHAR2(20);
                         vHIRE_DATE         DATE;
                         vJOB_ID            VARCHAR2(10);
                         vSALARY            NUMBER;
                         vCOMMISSION_PCT    NUMBER;
                         vMNG_ID            NUMBER;
                         
                    BEGIN
                        vEMPDTLDATA_OBJ      := JSON_OBJECT_T(vEMPDATA.GET(J));
                        vFIRST_NAME          := vEMPDTLDATA_OBJ.GET_STRING('first_name');
                        vLAST_NAME           := vEMPDTLDATA_OBJ.GET_STRING('last_name');
                        vEMAIL               := vEMPDTLDATA_OBJ.GET_STRING('email');
                        vPHONE_NUMBER        := vEMPDTLDATA_OBJ.GET_STRING('phone_number');
                        vHIRE_DATE           := TO_DATE(vEMPDTLDATA_OBJ.GET_STRING('hire_date'), 'dd-mm-rrrr');
                        vJOB_ID              := vEMPDTLDATA_OBJ.GET_STRING('job_id');
                        vSALARY              := vEMPDTLDATA_OBJ.GET_NUMBER('salary');
                        vCOMMISSION_PCT      := vEMPDTLDATA_OBJ.GET_NUMBER('commission_pct');
                        vMNG_ID              := vEMPDTLDATA_OBJ.GET_NUMBER('manager_id');
                        
                         DBMS_OUTPUT.PUT_LINE(1.1);
                        vEMPLOYEE_ID:= EMPLOYEE_SEQ.NEXTVAL;
                        
                        INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
                                       VALUES (vEMPLOYEE_ID, vFIRST_NAME, vLAST_NAME, vEMAIL, vPHONE_NUMBER, vHIRE_DATE , vJOB_ID, vSALARY, vCOMMISSION_PCT, vMNG_ID, pDEPT_ID);
                                       
                                        DBMS_OUTPUT.PUT_LINE(2);
                                           
                    END;

                END LOOP;
                    
                                   
            EXCEPTION WHEN OTHERS THEN
                vOUTPUT_OBJ.PUT('response_code',400);
                vMESSAGE := 'Error Code : '|| SQLCODE || ' Error Text : ' || SQLERRM;
                vOUTPUT_OBJ.PUT('message', vMESSAGE);
                pSTATUS := vOUTPUT_OBJ.TO_CLOB;
                ROLLBACK;
                RETURN;
            END;
            
        END LOOP;
        
        vMESSAGE := 'Deparment  '|| pDEPT_ID || ' saved successfully.';
        vOUTPUT_OBJ.PUT('id',pDEPT_ID); 
        vOUTPUT_OBJ.PUT('message', vMESSAGE);
        pSTATUS := vOUTPUT_OBJ.TO_CLOB;
        
        
    ELSE 
    
        vINPUT_OBJ := JSON_OBJECT_T.PARSE(pDEPTEMP);
        vINPUT_ARR := vINPUT_OBJ.GET_ARRAY('dept-data');

        FOR I IN 0..vINPUT_ARR.GET_SIZE-1 LOOP

            DECLARE 
            
                vDEPTEMP_OBJ            JSON_OBJECT_T;
                
                vDEPARTMENT_NAME     VARCHAR2(30);
                vMANAGER_ID          NUMBER(6);
                vLOCATION_ID         NUMBER(4);
                vEMPDATA             JSON_ARRAY_T;


            BEGIN
            
                vDEPTEMP_OBJ    := JSON_OBJECT_T(vINPUT_ARR.GET(I));
                
                vDEPARTMENT_NAME     := vDEPTEMP_OBJ.GET_STRING('department_name');
                vMANAGER_ID          := vDEPTEMP_OBJ.GET_NUMBER('manager_id');
                vLOCATION_ID         := vDEPTEMP_OBJ.GET_NUMBER('location_id');
                
                UPDATE DEPARTMENTS
                SET DEPARTMENT_NAME = vDEPARTMENT_NAME,
                    MANAGER_ID      = vMANAGER_ID,
                    LOCATION_ID     = vLOCATION_ID
                WHERE DEPARTMENT_ID = pDEPT_ID;

                
                     
                vEMPDATA := vDEPTEMP_OBJ.GET_ARRAY('empdtl-data');
                
                FOR J IN 0..vEMPDATA.GET_SIZE-1 LOOP
                    
                    DECLARE
                    
                         vEMPDTLDATA_OBJ     JSON_OBJECT_T;
                         vEMPLOYEE_ID       NUMBER;
                         vFIRST_NAME        VARCHAR2(20);   
                         vLAST_NAME         VARCHAR2(25);  
                         vEMAIL             VARCHAR2(25);
                         vPHONE_NUMBER      VARCHAR2(20);
                         vHIRE_DATE         DATE;
                         vJOB_ID            VARCHAR2(10);
                         vSALARY            NUMBER;
                         vCOMMISSION_PCT    NUMBER;
                         vMNG_ID            NUMBER;
                         
                    BEGIN
                    
                        vEMPDTLDATA_OBJ      := JSON_OBJECT_T(vEMPDATA.GET(J));
                        vEMPLOYEE_ID         := vEMPDTLDATA_OBJ.GET_NUMBER('employee_id');
                        vFIRST_NAME          := vEMPDTLDATA_OBJ.GET_STRING('first_name');
                        vLAST_NAME           := vEMPDTLDATA_OBJ.GET_STRING('last_name');
                        vEMAIL               := vEMPDTLDATA_OBJ.GET_STRING('email');
                        vPHONE_NUMBER        := vEMPDTLDATA_OBJ.GET_STRING('phone_number');
                        vHIRE_DATE           := TO_DATE(vEMPDTLDATA_OBJ.GET_STRING('hire_date'), 'dd-mm-rrrr');
                        vJOB_ID              := vEMPDTLDATA_OBJ.GET_STRING('job_id');
                        vSALARY              := vEMPDTLDATA_OBJ.GET_NUMBER('salary');
                        vCOMMISSION_PCT      := vEMPDTLDATA_OBJ.GET_NUMBER('commission_pct');
                        vMNG_ID              := vEMPDTLDATA_OBJ.GET_NUMBER('manager_id');
                        
                        IF vEMPLOYEE_ID IS NULL THEN 
                        
                            vEMPLOYEE_ID:= EMPLOYEE_SEQ.NEXTVAL;
                            
                            INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
                                           VALUES (vEMPLOYEE_ID, vFIRST_NAME, vLAST_NAME, vEMAIL, vPHONE_NUMBER, vHIRE_DATE, vJOB_ID, vSALARY, vCOMMISSION_PCT, vMNG_ID, pDEPT_ID);
                        ELSE 
                        
                            UPDATE EMPLOYEES
                            SET FIRST_NAME = vFIRST_NAME,
                                LAST_NAME  = vLAST_NAME,
                                EMAIL      = vEMAIL,
                                PHONE_NUMBER    = vPHONE_NUMBER,
                                HIRE_DATE       = vHIRE_DATE,
                                JOB_ID          = vJOB_ID,
                                SALARY          = vSALARY,
                                COMMISSION_PCT  = vCOMMISSION_PCT,
                                MANAGER_ID      = vMNG_ID,
                                DEPARTMENT_ID   = pDEPT_ID
                            WHERE EMPLOYEE_ID = vEMPLOYEE_ID;
                                
                        
                        END IF;
                                           
                    END;

                END LOOP;
                    
                                   
            EXCEPTION WHEN OTHERS THEN
                vOUTPUT_OBJ.PUT('response_code',400);
                vMESSAGE := 'Error Code : '|| SQLCODE || ' Error Text : ' || SQLERRM;
                vOUTPUT_OBJ.PUT('message', vMESSAGE);
                pSTATUS := vOUTPUT_OBJ.TO_CLOB;
                ROLLBACK;
                RETURN;
            END;
            
        END LOOP;
        
        vMESSAGE := 'Deparment  '|| pDEPT_ID || ' update successfully.';
        vOUTPUT_OBJ.PUT('id',pDEPT_ID); 
        vOUTPUT_OBJ.PUT('message', vMESSAGE);
        pSTATUS := vOUTPUT_OBJ.TO_CLOB;
        
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    vOUTPUT_OBJ.PUT('response_code',400);
    vMESSAGE := 'Error Code : '|| SQLCODE || ' Error Text : ' || SQLERRM;
    vOUTPUT_OBJ.PUT('message', vMESSAGE);
    pSTATUS := vOUTPUT_OBJ.TO_CLOB;
    ROLLBACK;

END PD_DEPT_EMP;
/
