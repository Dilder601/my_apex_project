create or replace FUNCTION GET_CLOSING_REPORT (pD1 VARCHAR2, pD2 VARCHAR2)
RETURN CLOB
IS
    vDATASET    CLOB;
    vHEADERS    VARCHAR2(4000);
    vSLNO       NUMBER :=1;
    vQRY                VARCHAR2(4000);
    vDatesPart          VARCHAR2(4000);
    vTrTdsPart          VARCHAR2(4000);
    vTrTdsPartSumm      VARCHAR2(4000);
    vBLANK_TD           VARCHAR2(2000);
    TYPE qry_cur IS REF CURSOR;
    qry_cursor          qry_cur;
--    P19_START_DATE      DATE := TO_DATE(pD1,'DDMMRRRR');
--    P19_END_DATE        DATE := TO_DATE(pD2,'DDMMRRRR');
    -- P19_START_DATE      DATE := pD1;
    -- P19_END_DATE        DATE := pD2;
    vNO_OF_DAYS         NUMBER;
    vCOUNTER            NUMBER := 1;
    vTR_REC             VARCHAR2(4000);
BEGIN

    vDATASET := vDATASET||' <input id="b_print" type="button" class="t-Button01_526" style="float:right;"  onclick="printdiv(''div_print'');" value=" Print " onload="openWindow.print()">';
    vDATASET := vDATASET||' <input id="b_print" type="button" class="t-Button02_526" style="float:right;"  onClick="tableToExcel(''div_print'');" value=" Excel ">'; 
    --vDATA_OUTPUT := vDATA_OUTPUT||'<input id="b_exit" type="button" class="t-Button01_526" style="float:right;"  onClick="onClick="window.location.href=''f?p=&APP_ID.:9:&APP_SESSION.''" value="Create New Invoice">';
    vDATASET := vDATASET||'<div id="div_print">';  

    vNO_OF_DAYS := (TO_DATE(pD2,'DDMMRRRR') - TO_DATE(pD1,'DDMMRRRR')) + 1;

    
    FOR I IN 1..vNO_OF_DAYS LOOP
    
        vDatesPart := CASE WHEN vCOUNTER = 1 THEN 'SUM (DECODE (DID.SRL_NO,'||vCOUNTER||',NVL(COLLECTION_AMOUT,0))) D'||vCOUNTER||','
                           WHEN vCOUNTER > 1 THEN vDatesPart||'SUM (DECODE (DID.SRL_NO,'||vCOUNTER||',NVL(COLLECTION_AMOUT,0))) D'||vCOUNTER||',' END;
    
        vTrTdsPart := CASE WHEN vCOUNTER = 1 THEN '||''<td>''||D'||vCOUNTER ELSE vTrTdsPart||'||''</td><td>''||D'||vCOUNTER end ;
        
        vTrTdsPartSumm := CASE WHEN vCOUNTER = 1 THEN '||''<td>''||SUM (D'||vCOUNTER||')' else vTrTdsPartSumm||'||''</td><td>''||SUM (D'||vCOUNTER||')' end ;
        
        vBLANK_TD       := CASE WHEN vCOUNTER = 1 THEN '<td></td>' else vBLANK_TD||'<td></td>' end ;
        
        vCOUNTER := vCOUNTER + 1;

    END LOOP;


    vDATASET := vDATASET||'
        <div class="header-info">
                <h1 class="m-0">Bhai Bhai Shramjibi Cooperative Society Ltd.</h1> 
                <h4 class="m-0">Address: 24/2 Maniknagar,Mugda, Wari, Dhaka-1203</h4>
                <h3 class="m-0">Closing Report</h3>
        </div>


        <div class="coll-info">
            <p>Member Name:  </p>
            <p>Block: A</p>
            <p>Date:'||TO_CHAR(SYSDATE,'DD MON RRRR HH12:MI:SS')||'</p>
        </div>
    ';

vDATASET := vDATASET||'
<table>

    <thead>
        <tr>
            <th>SL#</th>
            <th>Member Name</th>
            <th>Account No.</th>
            <th>Joining Date</th>
            <th>Weekly Remain</th>';

            FOR I IN (SELECT * FROM (GET_DAYS_LIST (TO_DATE(pD1,'DDMMRRRR'),TO_DATE(pD2,'DDMMRRRR'),'DD-MON-RR')) ORDER BY SRL_NO) LOOP

                --vHEADERS := CASE WHEN vHEADERS IS NULL THEN I.DAY_DISP ELSE vHEADERS||' , '||I.DAY_DISP END;
                vDATASET := vDATASET||'<th>'||I.DAY_DISP||'</th>';

            END LOOP;

--                FOR J IN (
--                            SELECT   REGEXP_SUBSTR(vHEADERS, '[^,]+', 1, LEVEL) as coll_date
--                              FROM dual
--                            CONNECT BY REGEXP_SUBSTR(vHEADERS, '[^,]+', 1, LEVEL) IS NOT NULL
--                ) LOOP
--
--                    vDATASET := vDATASET||'<th>'||J.coll_date||'</th>';
--
--                END LOOP;
                


vDATASET := vDATASET||'            
            <th>Total Collection</th>
            <th>Total Withdraw</th>
            <th>Balance</th>
        </tr>
    </thead>
    
    <tbody> 
     ';

    vQRY    := 
    'SELECT ''<tr><td>''||SL_NO||''</td><td>''||MEMBER_NAME||''</td><td>''||ACCOUNT_NO||''</td><td>''||TO_CHAR (JOINING_DATE,''DD-MON-RR'')||''</td>
    <td style="color:green; font-weight:bold; background: rgb(230, 230, 230);">''||WEEKLY_REMAINNG||''</td>'''||vTrTdsPart||'||''<td>''||COLLECTION_AMOUT||''</td><td>''||WITHDRAW||''</td><td style="color:green; font-weight:bold; background: rgb(230, 230, 230);">''||REMAINING||''</td></tr>'' TR
FROM (
SELECT A.*, ROWNUM SL_NO FROM (        
SELECT VM.MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE,  MAX(NVL(DRWITHDRAW_AMT.WITHDRAW_AMT,0)) WITHDRAW, (SUM(NVL(VDC.COLLECTION_AMOUT,0)) -  MAX(NVL(DRWITHDRAW_AMT.WITHDRAW_AMT,0))) + MAX(NVL(WEEK_REM.WEEKLY_REMAINING,0))  REMAINING, SUM(NVL(WEEK_REM.WEEKLY_REMAINING,0)) WEEKLY_REMAINNG,
'||vDatesPart||'
SUM(NVL(VDC.COLLECTION_AMOUT,0)) COLLECTION_AMOUT
FROM VV_DAILY_COLLECTION VDC
LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VDC.MEMBER_ID
LEFT JOIN VV_CLOSING_SCHEDULE VCS ON VCS.SCHEDULE_ID = VDC.SCHEDULE_ID
LEFT JOIN (SELECT * FROM (GET_DAYS_LIST (TO_DATE('''||pD1||''',''DDMMRRRR''),TO_DATE('''||pD2||''',''DDMMRRRR''),''DD-MON-RR''))) DID ON DID.DT = VDC.COLLECTION_DATE
LEFT JOIN (
SELECT VCW.MEMBER_ID,
--VCW.WITHDRAW_DATE,   
SUM(VCW.WITHDRAW_AMT) WITHDRAW_AMT
FROM VV_COLL_WITHDRAW VCW
LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VCW.MEMBER_ID
LEFT JOIN VV_CLOSING_SCHEDULE VCS ON VCS.SCHEDULE_ID = VCW.SCHEDULE_ID
WHERE  VCW.WITHDRAW_DATE BETWEEN TO_DATE('''||pD1||''',''DDMMRRRR'') AND TO_DATE('''||pD2||''',''DDMMRRRR'')
GROUP BY VCW.MEMBER_ID--, VCW.WITHDRAW_DATE
) DRWITHDRAW_AMT ON DRWITHDRAW_AMT.MEMBER_ID = VDC.MEMBER_ID
LEFT JOIN (
SELECT VDC.MEMBER_ID,  SUM(NVL(COLLECTION_AMOUT,0)) -  MAX(NVL(WITHDRAW_AMT.WITHDRAW_AMT,0))  WEEKLY_REMAINING
FROM VV_DAILY_COLLECTION VDC
LEFT JOIN (
SELECT VCW.MEMBER_ID,
VCW.WITHDRAW_DATE,   
SUM(VCW.WITHDRAW_AMT) WITHDRAW_AMT
FROM VV_COLL_WITHDRAW VCW
LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VCW.MEMBER_ID
LEFT JOIN VV_CLOSING_SCHEDULE VCS ON VCS.SCHEDULE_ID = VCW.SCHEDULE_ID
WHERE  VCW.WITHDRAW_DATE < TO_DATE('''||pD1||''',''DDMMRRRR'') 
GROUP BY VCW.MEMBER_ID, VCW.WITHDRAW_DATE
) WITHDRAW_AMT ON WITHDRAW_AMT.MEMBER_ID = VDC.MEMBER_ID
WHERE VDC.COLLECTION_DATE < TO_DATE('''||pD1||''',''DDMMRRRR'')  AND VDC.IS_POST = ''Y''
GROUP BY  VDC.MEMBER_ID
) WEEK_REM ON WEEK_REM.MEMBER_ID = VDC.MEMBER_ID
WHERE VDC.COLLECTION_DATE BETWEEN TO_DATE('''||pD1||''',''DDMMRRRR'') AND TO_DATE('''||pD2||''',''DDMMRRRR'') AND VDC.IS_POST = ''Y''
GROUP BY VM.MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE
ORDER BY VM.MEMBER_NAME
) A)';

    --- DATA ROWS   vDATASET := vDATASET||'<tbody> 
    --DBMS_OUTPUT.PUT_LINE (vQRY);
   OPEN qry_cursor FOR vQRY;
   
   LOOP
   
       FETCH qry_cursor INTO vTR_REC;
       EXIT WHEN qry_cursor%notfound;
       
       vDATASET := vDATASET||vTR_REC;
       
       
   
   END LOOP;
   
    vQRY    := 
    'SELECT ''<tr><td colspan="4" style="color:red; font-weight:bold; background: rgb(230, 230, 230);">Total</td>
    <td style="color:red; font-weight:bold; background: rgb(230, 230, 230);">''||SUM (WEEKLY_REMAINNG)||''</td>'''||vTrTdsPartSumm||'||''<td style="color:red; font-weight:bold; background: rgb(230, 230, 230);">''||SUM (COLLECTION_AMOUT)||''</td>
    <td style="color:red; font-weight:bold; background: rgb(230, 230, 230);">''||SUM (NVL(WITHDRAW,0))||''</td><td style="color:red; font-weight:bold; background: rgb(230, 230, 230);">''||SUM (NVL(REMAINING,0))||''</td></tr>'' TR
FROM (
SELECT A.*, ROWNUM SL_NO FROM (        
SELECT VM.MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE,  SUM(NVL(DRWITHDRAW_AMT.WITHDRAW_AMT,0)) WITHDRAW, (SUM(NVL(VDC.COLLECTION_AMOUT,0)) -  SUM(NVL(DRWITHDRAW_AMT.WITHDRAW_AMT,0))) + SUM(NVL(WEEK_REM.WEEKLY_REMAINING,0))  REMAINING, SUM(NVL(WEEK_REM.WEEKLY_REMAINING,0)) WEEKLY_REMAINNG,
'||vDatesPart||'
SUM(NVL(VDC.COLLECTION_AMOUT,0)) COLLECTION_AMOUT
FROM VV_DAILY_COLLECTION VDC
LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VDC.MEMBER_ID
LEFT JOIN VV_CLOSING_SCHEDULE VCS ON VCS.SCHEDULE_ID = VDC.SCHEDULE_ID
LEFT JOIN (SELECT * FROM (GET_DAYS_LIST (TO_DATE('''||pD1||''',''DDMMRRRR''),TO_DATE('''||pD2||''',''DDMMRRRR''),''DD-MON-RR''))) DID ON DID.DT = VDC.COLLECTION_DATE
LEFT JOIN (
SELECT VCW.MEMBER_ID,
--VCW.WITHDRAW_DATE,   
SUM(VCW.WITHDRAW_AMT) WITHDRAW_AMT
FROM VV_COLL_WITHDRAW VCW
LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VCW.MEMBER_ID
LEFT JOIN VV_CLOSING_SCHEDULE VCS ON VCS.SCHEDULE_ID = VCW.SCHEDULE_ID
WHERE  VCW.WITHDRAW_DATE BETWEEN TO_DATE('''||pD1||''',''DDMMRRRR'') AND TO_DATE('''||pD2||''',''DDMMRRRR'')
GROUP BY VCW.MEMBER_ID--, VCW.WITHDRAW_DATE
) DRWITHDRAW_AMT ON DRWITHDRAW_AMT.MEMBER_ID = VDC.MEMBER_ID
LEFT JOIN (
SELECT VDC.MEMBER_ID,  SUM(NVL(COLLECTION_AMOUT,0)) -  MAX(NVL(WITHDRAW_AMT.WITHDRAW_AMT,0))  WEEKLY_REMAINING
FROM VV_DAILY_COLLECTION VDC
LEFT JOIN (
SELECT VCW.MEMBER_ID,
--VCW.WITHDRAW_DATE,   
SUM(VCW.WITHDRAW_AMT) WITHDRAW_AMT
FROM VV_COLL_WITHDRAW VCW
LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VCW.MEMBER_ID
LEFT JOIN VV_CLOSING_SCHEDULE VCS ON VCS.SCHEDULE_ID = VCW.SCHEDULE_ID
WHERE  VCW.WITHDRAW_DATE < TO_DATE('''||pD1||''',''DDMMRRRR'') 
GROUP BY VCW.MEMBER_ID--, VCW.WITHDRAW_DATE
) WITHDRAW_AMT ON WITHDRAW_AMT.MEMBER_ID = VDC.MEMBER_ID
WHERE VDC.COLLECTION_DATE < TO_DATE('''||pD1||''',''DDMMRRRR'')  AND VDC.IS_POST = ''Y''
GROUP BY  VDC.MEMBER_ID
) WEEK_REM ON WEEK_REM.MEMBER_ID = VDC.MEMBER_ID
WHERE VDC.COLLECTION_DATE BETWEEN TO_DATE('''||pD1||''',''DDMMRRRR'') AND TO_DATE('''||pD2||''',''DDMMRRRR'') AND VDC.IS_POST = ''Y''
GROUP BY VM.MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE
ORDER BY VM.MEMBER_NAME
) A)';

    --- DATA ROWS   vDATASET := vDATASET||'<tbody> 
    --DBMS_OUTPUT.PUT_LINE (vQRY);
   OPEN qry_cursor FOR vQRY;
   
   LOOP
   
       FETCH qry_cursor INTO vTR_REC;
       EXIT WHEN qry_cursor%notfound;
       
       vDATASET := vDATASET||vTR_REC;
       
       
   
   END LOOP;



vDATASET := vDATASET||'   

        <tr>
            <td colspan="4">Subervisar Sign</td>
            <td></td>
            '||vBLANK_TD||'
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="4">Accountant Sign</td>
            <td></td>
            '||vBLANK_TD||'
            <td></td>
            <td></td>
            <td></td>
        </tr>
        
    </tbody>

</table>
 ';

 RETURN vDATASET;

    
END;
/



==================================== *** ==================================



create or replace FUNCTION GET_LOAN_COLL_REPORT (pD1 VARCHAR2, pD2 VARCHAR2)
RETURN CLOB
IS
    vDATASET            CLOB;
    vHEADERS            VARCHAR2(4000);
    vSLNO               NUMBER:=1;
    vQRY                VARCHAR2(4000);
    vDatesPart          VARCHAR2(4000);
    vTrTdsPart          VARCHAR2(4000);
    vTrTdsPartSumm      VARCHAR2(4000);
    vBLANK_TD           VARCHAR2(2000);
    TYPE qry_cur IS REF CURSOR;
    qry_cursor          qry_cur;
    
    vNO_OF_DAYS         NUMBER;
    vCOUNTER            NUMBER := 1;
    vTR_REC             VARCHAR2(4000);
BEGIN

    vDATASET := vDATASET||' <input id="b_print" type="button" class="t-Button01_526" style="float:right;"  onclick="printdiv(''div_print'');" value=" Print " onload="openWindow.print()">';
    vDATASET := vDATASET||' <input id="b_print" type="button" class="t-Button02_526" style="float:right;"  onClick="tableToExcel(''div_print'');" value=" Excel ">'; 
    --vDATA_OUTPUT := vDATA_OUTPUT||'<input id="b_exit" type="button" class="t-Button01_526" style="float:right;"  onClick="onClick="window.location.href=''f?p=&APP_ID.:9:&APP_SESSION.''" value="Create New Invoice">';
    vDATASET := vDATASET||'<div id="div_print">';    

    vNO_OF_DAYS := (TO_DATE(pD2,'DDMMRRRR') - TO_DATE(pD1,'DDMMRRRR')) + 1;
    
        FOR I IN 1..vNO_OF_DAYS LOOP
    
        vDatesPart := CASE WHEN vCOUNTER = 1 THEN 'SUM (DECODE (DID.SRL_NO,'||vCOUNTER||',NVL(LOAN_AMOUT,0))) D'||vCOUNTER||','
                           WHEN vCOUNTER > 1 THEN vDatesPart||'SUM (DECODE (DID.SRL_NO,'||vCOUNTER||',NVL(LOAN_AMOUT,0))) D'||vCOUNTER||',' END;
    
        vTrTdsPart := CASE WHEN vCOUNTER = 1 THEN '||''<td>''||D'||vCOUNTER ELSE vTrTdsPart||'||''</td><td>''||D'||vCOUNTER end ;
        
        vTrTdsPartSumm := CASE WHEN vCOUNTER = 1 THEN '||''<td>''||SUM (D'||vCOUNTER||')' else vTrTdsPartSumm||'||''</td><td>''||SUM (D'||vCOUNTER||')' end ;
        
        vBLANK_TD       := CASE WHEN vCOUNTER = 1 THEN '<td></td>' else vBLANK_TD||'<td></td>' end ;
        
        vCOUNTER := vCOUNTER + 1;

    END LOOP;

    vDATASET := vDATASET||'
        <div class="header-info">
                <!-- Vai Vai Cooperative  Society Limited. -->
                <h1 class="m-0">Bhai Bhai Shramjibi Cooperative Society Ltd. </h1> 
                <h4 class="m-0">Address: 24/2 Maniknagar,Mugda, Wari, Dhaka-1203</h4>
                <h3 class="m-0">Loan Report</h3>
        </div>


        <div class="coll-info">
            <p>Member Name: </p>
            <p>Block: A</p>
            <p>Date:'||TO_CHAR(SYSDATE,'DD MON RRRR HH24:MI:SS')||'</p>
        </div>
    ';


vDATASET := vDATASET||'
<table>

    <thead>
        <tr>
            <!-- <th colspan="4">Collection</th>
            <th colspan="4">Loan</th> -->
        </tr>
        <tr>
            <th>SL#</th>
            <th>Member Name</th>
            <th>Account No.</th>
            <th>Joining Date</th>
            <th>Opening Balance</th>';

            FOR I IN (SELECT * FROM (GET_DAYS_LIST (TO_DATE(pD1,'DDMMRRRR'),TO_DATE(pD2,'DDMMRRRR'),'DD-MON-RR')) ORDER BY SRL_NO) LOOP

                --vHEADERS := CASE WHEN vHEADERS IS NULL THEN I.DAY_DISP ELSE vHEADERS||' , '||I.DAY_DISP END;
                vDATASET := vDATASET||'<th>'||I.DAY_DISP||'</th>';

            END LOOP;

--                FOR J IN (
--                            SELECT   REGEXP_SUBSTR(vHEADERS, '[^,]+', 1, LEVEL) as coll_date
--                              FROM dual
--                            CONNECT BY REGEXP_SUBSTR(vHEADERS, '[^,]+', 1, LEVEL) IS NOT NULL
--                        ) LOOP
--
--                END LOOP;
                


vDATASET := vDATASET||'            
            <th>Total Collection</th>
            <th>Balance</th>
        </tr>
    </thead>
    <tbody>   
     ';

  vQRY    := 
 'SELECT ''<tr><td>''||SL_NO||''</td><td>''||MEMBER_NAME||''</td><td>''||ACCOUNT_NO||''</td><td>''||TO_CHAR (JOINING_DATE,''DD-MON-RR'')||''</td>
 <td style="color:green; font-weight:bold; background: rgb(230, 230, 230);">''||WEEKLY_REMAINNG||''</td>'''||vTrTdsPart||'||''<td>''||COLLECTION_AMOUT||''</td><td style="color:green; font-weight:bold; background: rgb(230, 230, 230);">''||REMAINING||''</td></tr>'' TR
FROM (
    SELECT A.*, ROWNUM SL_NO FROM (    
        SELECT VM.MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE, (MAX(NVL(REMAIN_LOAN_BALANCE,0)) +  SUM(NVL(LOAN_AMOUT,0))) WEEKLY_REMAINNG,    
               NVL(REMAIN_LOAN_BALANCE,0) REMAINING,
                '||vDatesPart||'
                SUM(NVL(LOAN_AMOUT,0)) COLLECTION_AMOUT
          FROM VV_DAILY_LOAN_COLL VDLC
          LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VDLC.MEMBER_ID
          LEFT JOIN VV_APPLY_LOAN VAL ON VAL.APPLY_ID =  VDLC.APPLY_ID AND VAL.MEMBER_ID = VDLC.MEMBER_ID
          LEFT JOIN (SELECT * FROM (GET_DAYS_LIST (TO_DATE('''||pD1||''',''DDMMRRRR''),TO_DATE('''||pD2||''',''DDMMRRRR''),''DD-MON-RR''))) DID ON DID.DT = VDLC.LOAN_DATE
         WHERE  VDLC.LOAN_DATE BETWEEN TO_DATE('''||pD1||''',''DDMMRRRR'') AND TO_DATE('''||pD2||''',''DDMMRRRR'') AND VDLC.IS_POST = ''Y''
        GROUP BY MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE, REMAIN_LOAN_BALANCE
        ORDER BY VM.MEMBER_NAME
        ) A)
    ';
       --- DATA ROWS   vDATASET := vDATASET||'<tbody> 
    --DBMS_OUTPUT.PUT_LINE (vQRY);
   OPEN qry_cursor FOR vQRY;
   
   LOOP
   
       FETCH qry_cursor INTO vTR_REC;
       EXIT WHEN qry_cursor%notfound;
       
       vDATASET := vDATASET||vTR_REC;
       
       
   
   END LOOP;
       
     
vQRY    := 
  'SELECT ''<tr><td colspan="4" style="color:red; font-weight:bold; background: rgb(230, 230, 230);">Total</td><td style="color:red; font-weight:bold; background: rgb(230, 230, 230);">''||SUM (WEEKLY_REMAINNG)||''</td>'''||vTrTdsPartSumm||'||''
  <td style="color:red; font-weight:bold; background: rgb(230, 230, 230);">''||SUM (COLLECTION_AMOUT)||''</td><td style="color:red; font-weight:bold; background: rgb(230, 230, 230);">''||SUM (NVL(REMAINING,0))||''</td></tr>'' TR
FROM (
    SELECT A.*, ROWNUM SL_NO FROM (    
        SELECT VM.MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE, (MAX(NVL(REMAIN_LOAN_BALANCE,0)) +  SUM(NVL(LOAN_AMOUT,0))) WEEKLY_REMAINNG,    
               NVL(REMAIN_LOAN_BALANCE,0) REMAINING,
                '||vDatesPart||'
                SUM(NVL(LOAN_AMOUT,0)) COLLECTION_AMOUT
          FROM VV_DAILY_LOAN_COLL VDLC
          LEFT JOIN VV_MEMBER VM ON VM.MEMBER_ID = VDLC.MEMBER_ID
          LEFT JOIN VV_APPLY_LOAN VAL ON VAL.APPLY_ID =  VDLC.APPLY_ID AND VAL.MEMBER_ID = VDLC.MEMBER_ID
          LEFT JOIN (SELECT * FROM (GET_DAYS_LIST (TO_DATE('''||pD1||''',''DDMMRRRR''),TO_DATE('''||pD2||''',''DDMMRRRR''),''DD-MON-RR''))) DID ON DID.DT = VDLC.LOAN_DATE
         WHERE  VDLC.LOAN_DATE BETWEEN TO_DATE('''||pD1||''',''DDMMRRRR'') AND TO_DATE('''||pD2||''',''DDMMRRRR'') AND VDLC.IS_POST = ''Y''
        GROUP BY MEMBER_NAME, VM.ACCOUNT_NO, VM.JOINING_DATE, REMAIN_LOAN_BALANCE
        ORDER BY VM.MEMBER_NAME
        ) A)
    ';
    
    --- DATA ROWS   vDATASET := vDATASET||'<tbody> 
    DBMS_OUTPUT.PUT_LINE (vQRY);
   OPEN qry_cursor FOR vQRY;
   
   LOOP
   
       FETCH qry_cursor INTO vTR_REC;
       EXIT WHEN qry_cursor%notfound;
       
       vDATASET := vDATASET||vTR_REC;
       
       
   
   END LOOP;

vDATASET := vDATASET||'   

        <tr>
            <td colspan="4">Subervisar Sign</td>
            <td></td>
            '||vBLANK_TD||'
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="4">Accountant Sign</td>
            <td></td>
            '||vBLANK_TD||'
            <td></td>
            <td></td>
        </tr>
        
    </tbody>

</table>
 ';

 RETURN vDATASET;
    
END;
/