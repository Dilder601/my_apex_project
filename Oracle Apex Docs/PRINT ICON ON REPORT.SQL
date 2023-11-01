01. EXAMPLE:

select SALE_ID,
       SALE_NO,
       SELLING_AMT,
       SORT_ORDER,
       STATUS,
       DECODE(NVL( STATUS, 1), '1', 'fa fa-check-circle', 'fa fa-times-circle') STATUS_ICON,
       DECODE(NVL( STATUS, 0), '1', 'green', 'red') STATUS_ICON_FLAG,
       '-' print ---THIS IS A VIRTUAL COLUMN
  from BL_SALE_MST
  ORDER BY SALE_ID DESC

  02.
  COLUMN TYPE: LINK

  03. 
  ON LINK -> TARGET: YOUR DESIRED PAGE

  LINK TEXT: 

  <span aria-label="Print Invoice"><span class="fa fa-print" aria-hidden="true" title="Print Invoice"></span></span>

  LINK ATTRIBUTE:

  target='_blank'
