01. CREATE BUTTON FOR ADD MEMBER.
EXAMPLE: (+) ADD BUTTON

    i. CREATE A DYNAMIC ACTION ON CLICK EVENT.
    ii.  ADD TRUE ACTION:
        CREATE VALIDATION BEFORE ADD MEMBER ON COLLECTION 
        EXECUTE JAVASCRIPT CODE: 

        if($v('P2_FIRST_NAME') == "") {
        apex.message.showErrors([
            {
                type:       "error",
                location:   [ "page", "c_inline_in_notification" ],
                pageItem:   "P2_FIRST_NAME ",
                message:    "Please input name",
                unsafe:     false
            }
        ]); 
        apex.da.cancelEvent.call(this);
        }  

        if($v('P2_LAST_NAME') == "") {
        apex.message.showErrors([
            {
                type:       "error",
                location:   [ "page", "c_inline_in_notification" ],
                pageItem:   "P2_LAST_NAME ",
                message:    "Please input name",
                unsafe:     false
            }
        ]); 
        apex.da.cancelEvent.call(this);
        }  

        if($v('P2_SALARY') == "") {
        apex.message.showErrors([
            {
                type:       "error",
                location:   [ "page", "c_inline_in_notification" ],
                pageItem:   "P2_SALARY ",
                message:    "Please input name",
                unsafe:     false
            }
        ]); 
        apex.da.cancelEvent.call(this);
        }  

    iii. ADD TRUE ACTION:
        EXECUTE SERVER-SIDE CODE:

        BEGIN
            IF NOT APEX_COLLECTION.COLLECTION_EXISTS('DEPT_EMP') THEN
                APEX_COLLECTION.CREATE_COLLECTION('DEPT_EMP');
            END IF;

            APEX_COLLECTION.ADD_MEMBER(
                    p_collection_name => 'DEPT_EMP',
                    p_C001 => :P2_FIRST_NAME,
                    p_C002 => :P2_LAST_NAME,
                    p_C003 => :P2_EMAIL,
                    p_C004 => :P2_PHONE_NUMBER,
                    p_C005 => :P2_HIRE_DATE,
                    p_C006 => :P2_JOB_ID,
                    p_n001 => :P2_SALARY,
                    p_n002 => :P2_COMMISSION_PCT ,
                    p_n003 => :P2_MNG_ID
                    );       
        END;

        - ITEM TO SUBMIT:
            P2_FIRST_NAME,P2_LAST_NAME,P2_EMAIL,P2_PHONE_NUMBER,P2_HIRE_DATE,P2_JOB_ID,P2_SALARY,P2_COMMISSION_PCT,P2_MNG_ID

        OFF FIRE ON INITIALIZATION

    iv. ADD TRUE ACTION:
        CLEAR
        AFFECTED ELEMENTS (ITEMS)
        P2_FIRST_NAME,P2_LAST_NAME,P2_EMAIL,P2_PHONE_NUMBER,P2_HIRE_DATE,P2_JOB_ID,P2_SALARY,P2_COMMISSION_PCT,P2_MNG_ID
    v. ADD TRUE ACTION:
        REFRESH REGION (COLLECTIONS TABLE)



02. CREATE AJAX CALLBACK (DONT REFRESH PAGE WHILE SAVE);

    i. NAME OF AJAX CALLBACK : SAVE_DEPTEMP
    ii. TYPE : EXECUTE CODE
        IF NOT APEX_COLLECTION.COLLECTION_EXISTS('DEPT_EMP') THEN
                APEX_COLLECTION.CREATE_COLLECTION('DEPT_EMP');
        END IF;


        DECLARE 
            vSTATUS             CLOB;
            vDEPT_ID            NUMBER := :P2_DEPARTMENT_ID;
            vDEPTEMP            CLOB;                      
        BEGIN
            SELECT '{ "dept-data":[
                                                            { "department_name": "'|| :P2_DEPARTMENT_NAME||'" ,
                                                                "manager_id":       '||NVL(TO_CHAR(:P2_MANAGER_ID),'null')||',
                                                                "location_id":      '||NVL(TO_CHAR(:P2_LOCATION),'null')||',
                                                                "empdtl-data":[
                                                                            {"first_name":    "'||C001||'",
                                                                            "last_name":     "'||C002||'",
                                                                            "email":         "'||C003||'",
                                                                            "phone_number":  "'||C004||'",
                                                                            "hire_date":     "'||C005||'",
                                                                            "job_id":        "'||C006||'",
                                                                            "salary":        '||NVL(TO_CHAR(N001),'null')||',
                                                                            "commission_pct": '||NVL(TO_CHAR(N002),'null')||',
                                                                            "manager_id":    '||NVL(TO_CHAR(N003),'null')||' 
                                                                            }
                                                                            ]
                                                            }
                                                            ]
                                            }' INTO vDEPTEMP
            FROM APEX_COLLECTIONS;

            PD_DEPT_EMP( 
                        pDEPT_ID => vDEPT_ID,
                        pDEPTEMP => vDEPTEMP,
                        pSTATUS  => vSTATUS
                        );
            DBMS_OUTPUT.PUT_LINE('Output : '||VSTATUS);
        EXCEPTION WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);    
        END;




        COMMIT;

        APEX_COLLECTION.TRUNCATE_COLLECTION(P_COLLECTION_NAME => 'DEPT_EMP');


03. SAVE COLLECTION TO DB:
    EXAMPLE NEW BUTTON : SUBMIT
    i. CREATE NEW DYNAMIC ACTION
    ii. NAME OF DYNAMIC ACTION  Validate And Save Data  ON CLICK EVENT
    iii. TRUE ACTION 
        ECXECUTE JAVASCRIPT CODE : CHECK DEPTNAME

        if($v('P2_DEPARTMENT_NAME') == "") {
        apex.message.showErrors([
            {
                type:       "error",
                location:   [ "page", "c_inline_in_notification" ],
                pageItem:   "P2_DEPARTMENT_NAME ",
                message:    "Department Cant null",
                unsafe:     false
            }
        ]); 
        apex.da.cancelEvent.call(this);
        }  

    iv. TRUE ACTION 

        EXECUTE JAVASCRIPT CODE:  CALL AJAX CALLBACK

        apex.server.process(
            'SAVE_DEPTEMP', {
                            pageItems:"#P2_DEPARTMENT_NAME,#P2_MANAGER_ID,#P2_LOCATION,#P2_FIRST_NAME,#P2_LAST_NAME,#P2_EMAIL,#P2_PHONE_NUMBER,#P2_HIRE_DATE,#P2_JOB_ID,#P2_SALARY,#P2_COMMISSION_PCT,#P2_MNG_ID"
                            },
                    {
                    dataType: 'text',
                    success: function(data) {
                    if (data == 'S') {
                                        // do something here
                                    } 
                    }
                }
            );


                    OR


        EXECUTE SERVER-SIDE CODE :

        IF NOT APEX_COLLECTION.COLLECTION_EXISTS('DEPT_EMP') THEN
                APEX_COLLECTION.CREATE_COLLECTION('DEPT_EMP');
        END IF;


        DECLARE 
            vSTATUS             CLOB;
            vDEPT_ID            NUMBER := :P2_DEPARTMENT_ID;
            vDEPTEMP            CLOB;                      
        BEGIN
            SELECT '{ "dept-data":[
                                    { "department_name": "'|| :P2_DEPARTMENT_NAME||'" ,
                                        "manager_id":       '||NVL(TO_CHAR(:P2_MANAGER_ID),'null')||',
                                        "location_id":      '||NVL(TO_CHAR(:P2_LOCATION),'null')||',
                                        "empdtl-data":[
                                                    {"first_name":    "'||C001||'",
                                                    "last_name":     "'||C002||'",
                                                    "email":         "'||C003||'",
                                                    "phone_number":  "'||C004||'",
                                                    "hire_date":     "'||C005||'",
                                                    "job_id":        "'||C006||'",
                                                    "salary":        '||NVL(TO_CHAR(N001),'null')||',
                                                    "commission_pct": '||NVL(TO_CHAR(N002),'null')||',
                                                    "manager_id":    '||NVL(TO_CHAR(N003),'null')||' 
                                        }
                                    ]
                                    }
                                    ]
                                            }' INTO vDEPTEMP
            FROM APEX_COLLECTIONS;

            PD_DEPT_EMP( 
                        pDEPT_ID => vDEPT_ID,
                        pDEPTEMP => vDEPTEMP,
                        pSTATUS  => vSTATUS
                        );
            DBMS_OUTPUT.PUT_LINE('Output : '||VSTATUS);
        EXCEPTION WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);    
        END;




        COMMIT;

        APEX_COLLECTION.TRUNCATE_COLLECTION(P_COLLECTION_NAME => 'DEPT_EMP');

    -ITEMS TO SUBMIT:
    P2_FIRST_NAME,P2_LAST_NAME,P2_EMAIL,P2_PHONE_NUMBER,P2_HIRE_DATE,P2_JOB_ID,P2_SALARY,P2_COMMISSION_PCT,P2_MNG_ID

    v. EXECUTE JAVASCRIPT CODE: SAVE MESSAGE 

          apex.message.showPageSuccess( "Dept Employees Saved." );

    vi. EXECUTE JAVASCRIPT CODE: MESSGE TIMER

        $( document ).ready(function() {
            $( "#t_Alert_Success" ).fadeIn( 5000 ).delay( 2500 ).fadeOut( 800 );
        });

    vii. CLEAR
        AFFECTED ELEMENTS :
        P2_DEPARTMENT_ID,P2_DEPARTMENT_NAME,P2_MANAGER_ID,P2_LOCATION,P2_FIRST_NAME,P2_LAST_NAME,P2_EMAIL,P2_PHONE_NUMBER,P2_HIRE_DATE,P2_JOB_ID,P2_SALARY,P2_COMMISSION_PCT,P2_MNG_ID

    viii. EXECUTE SERVER-SIDE CODE:  RECHECK AND DELETE COLLECTIONS


        IF  apex_collection.collection_exists('DEPT_EMP') THEN
            BEGIN
            apex_collection.delete_collection(p_collection_name =>'DEPT_EMP');
            END;
        END IF;

    ix. REFRESH
     REFRESH REGION  : COLLECTION REGIONS

    x. REFRESH
        REFRESH ITEMS : 
        P2_FIRST_NAME,P2_LAST_NAME,P2_EMAIL,P2_PHONE_NUMBER,P2_HIRE_DATE,P2_JOB_ID,P2_SALARY,P2_COMMISSION_PCT,P2_MNG_ID



=============  REMOVE A COLLECTION IDS  ================

1. CREATE A NEW PAGE ITEM WHERE KEPT A VALUE OF ITEMS
    SUPPOSE:  P14_BNS_ID (HIDDEN) 
 
    CREATE DYNAMIC ACTION ON PAGE ITEMS: CLIENT SIDE CONDITION ITEM IS NOT NULL P14_BNS_ID
        i. TRUE ACTION
            ACTION: CONFIRM
            MESSAGE: 
            Are you sure ?
            You want to remove this.

        ii. TRUE ACTION
            ACTION: EXECUTE SERVER-SIDE CODE

            BEGIN

                APEX_COLLECTION.DELETE_MEMBER(P_COLLECTION_NAME =>'BONUS',P_SEQ => :P14_BNS_ID);
                APEX_COLLECTION.RESEQUENCE_COLLECTION (P_COLLECTION_NAME => 'BONUS');
                
            END;

            ITEMS TO SUBMIT: P14_BNS_ID

        iii. TRUE ACTION
            ACTION: REFRESH REGION  COLLECTION REGION

        iv. TRUE ACTION
            ACTION: SET VALUE 
             AFFECTED ELEMENTS : P14_BNS_ID

            ON DEL ICON 
            TYPE LINK
            TARGET : URL
            javascript:$s("P14_BNS_ID","#SL#");

            TEXT LINK: <span  class="fa fa-remove delete-irrow" title="Click to Remove" alt="Click to Remove" style="font-size:25px;color:red"></span>
            LINK ATTRIBUTES: data-id=#ID#

