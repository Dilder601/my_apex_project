CALCULATION VAT AND DISCOUNT ON PERCENTAGE TO TAKA AND TAKA TO PERCENTAGE 

01. DYNAMIC ACTION ON KEY RELEASE EVENT:

    TRUE ACTION (1): ON  (P68_VAT_PRCNT)

    ACTION SET VALUE.
    JAVASCRIPT EXPRESSION:
    parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_VAT_PRCNT') != '' ? $v('P68_VAT_PRCNT') : 0) / 100;

    AFFECTED ELEMENT (VAT AMT)

    TRUE ACTION (2):

    ACTION SET VALUE.
    JAVASCRIPT EXPRESSION:

    parseFloat($v('AMT') != '' ? $v('AMT') : 0) + 
    (parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_VAT_PRCNT') != '' ? $v('P68_VAT_PRCNT') : 0) / 100) -
    (parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_DISC_PRCNT') != '' ? $v('P68_DISC_PRCNT') : 0) / 100)

    AFFECTED ELEMENT (NET AMT)


01. DYNAMIC ACTION ON KEY RELEASE EVENT:
     TRUE ACTION (1): ON  (P68_DISC_PRCNT)

     ACTION SET VALUE.
    JAVASCRIPT EXPRESSION:

    parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_DISC_PRCNT') != '' ? $v('P68_DISC_PRCNT') : 0) / 100;

     AFFECTED ELEMENT (DISC_AMT)

    TRUE ACTION (2):

    ACTION SET VALUE.
    JAVASCRIPT EXPRESSION:

    parseFloat($v('AMT') != '' ? $v('AMT') : 0) + 
    (parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_VAT_PRCNT') != '' ? $v('P68_VAT_PRCNT') : 0) / 100) -
    (parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_DISC_PRCNT') != '' ? $v('P68_DISC_PRCNT') : 0) / 100)
