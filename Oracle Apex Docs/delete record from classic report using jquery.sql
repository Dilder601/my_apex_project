ADD A NEW COLUMN IN REPORT : DEL

select VM.MEMBER_ID ID,
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
       (CASE WHEN VPL.STATUS = 1 THEN 'YES' ELSE 'NO' END) APPLY_LOAN_STATUS,
       --(CASE WHEN VPL.STATUS = 1 THEN 'YES' ELSE 'NO' END) LOAN_TAKEN,
       CASE WHEN (CASE WHEN VPL.STATUS = '1' THEN 'YES' ELSE 'NO' END)= 'YES' THEN 'green' ELSE 'red' END THE_COLOR,
       ' ' APPLY_LOAN,
       ' ' DEL
  from VV_MEMBER VM
  LEFT JOIN EMP_USERS EU ON EU.EMP_ID = VM.CREATED_BY
  LEFT JOIN VV_APPLY_LOAN VPL ON VPL.MEMBER_ID = VM.MEMBER_ID AND VPL.STATUS = 1;

  LINK DEL COLUMN:

  TARGET: URL ->    javascript:void(null);
  LINK TEXT:  <span aria-hidden="true" class="fa fa-trash-o delete-note"></span>
  LINK ATTRIBUTE: data-id=#ID#

  CREATE A NEW HIDDEN PAGE ITEM: P11_ID



CREATE DYNAMIC ACTION:
EVENT : CLICK
SELECTION TYPE: jQuery Selector
jQuery Selector : .delete-note     
N.B: [.delete-note     -> link from link text]


1. TRUE ACTION: CONFIRM
MESSAGE: Are you sure you want to delete this Member?

2. TRUE ACTION: SET VALUE 
   SET TYPE: JavaScript Expression
   CODE: 
        $(this.triggeringElement).parent().data('id')

3. TRUE ACTION: EXECUTE SERVER SIDE CODE
 CODE:
    
    BEGIN
        UPDATE VV_MEMBER
        SET STATUS = 0
        WHERE MEMBER_ID = :P11_ID;

    EXCEPTION WHEN OTHERS THEN
        NULL;
    END;

    ITEM TO SUBMIT: P11_ID

4. TRUE ACTION: REFRESH

    AFFECTED ELEMENT : REGION
    REGION : MEMBER
