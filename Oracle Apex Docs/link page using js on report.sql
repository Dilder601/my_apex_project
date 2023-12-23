<a href="javascript:window.open('f?p=&APP_ID.:31:&SESSION.::&DEBUG.:::#P31_MEMBER_ID:&#MEMBER_ID#.')"><button class="t-Button t-Button--noLabel t-Button--icon t-Button--tiny" type="button" style="padding: 18px;" title="Show coll" aria-label="member coll"><span class="t-Icon fa fa-eye" aria-hidden="true"></span></button></a>

PASS VALUE:
-----------
<a href="javascript:window.open('f?p=&APP_ID.:31:&SESSION.::&DEBUG.:::P31_MEMBER_ID:#MEMBER_ID#')"><button class="t-Button t-Button--noLabel t-Button--icon t-Button--tiny" type="button" style="padding: 18px;" title="Show coll" aria-label="member coll"><span class="t-Icon fa fa-eye" aria-hidden="true"></span></button></a>

'<a href="f?p=&APP_ID.:31:&APP_SESSION.::NO:31:P31_MEMBER_ID:'||VM.MEMBER_ID||'"><u>Collection</u></a>' COL,

<a href="javascript:window.open('f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::P29_NEW_CUS_CODE:&P30_MSQ_CUS_CODE.')">
<button class="t-Button t-Button--noLabel t-Button--icon t-Button--tiny" type="button" style="padding: 18px;" title="Show Ageing" aria-label="Customer Ageing">
<span class="t-Icon fa fa-eye" aria-hidden="true"></span></button></a>


select VM.MEMBER_ID ,
       VM.MEMBER_NAME,
       VM.ACCOUNT_NO,
       VM.JOINING_DATE,
       VM.MEMBER_ADDRESS,
       VM.INST_ID,
       DECODE(NVL( VM.STATUS, 1), '1', 'fa fa-check-circle', 'fa fa-times-circle') STATUS_ICON,
       DECODE(NVL( VM.STATUS, 0), '1', 'green', 'red') STATUS_ICON_FLAG,
       VM.STATUS,
       VM.CREATED_BY,
       EU.EMP_NAME,
       VM.CREATED_AT,
       VM.UPDATED_BY,
       VM.UPDATED_AT,
       VM.BLOCK_CODE BLOCK,
       (CASE WHEN VPL.STATUS = 1 THEN 'YES' ELSE 'NO' END) APPLY_LOAN_STATUS,
       --(CASE WHEN VPL.STATUS = 1 THEN 'YES' ELSE 'NO' END) LOAN_TAKEN,
       CASE WHEN (CASE WHEN VPL.STATUS = '1' THEN 'YES' ELSE 'NO' END)= 'YES' THEN 'green' ELSE 'red' END THE_COLOR,
       ' ' APPLY_LOAN,
       CASE WHEN VPL.loan_id IS NULL THEN 'N/A' 
       ELSE nvl(to_char('ID: '||VPL.loan_id||' AMT: '||vpl.loan_amt||' TK.'),'N/A') END loan_no,
       ' ' DEL,
       ' ' COL_DTL,
       '<a href="f?p=&APP_ID.:31:&APP_SESSION.::NO:31:P31_MEMBER_ID:'||VM.MEMBER_ID||'"><u>Collection</u></a>' col,
       ' ' LOAN_DTL
  from VV_MEMBER VM
  LEFT JOIN EMP_USERS EU ON EU.EMP_ID = VM.CREATED_BY
  LEFT JOIN VV_APPLY_LOAN VPL ON VPL.MEMBER_ID = VM.MEMBER_ID AND VPL.STATUS = 1



  