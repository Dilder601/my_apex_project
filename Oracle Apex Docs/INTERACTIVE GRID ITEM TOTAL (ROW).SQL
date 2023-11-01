01. DYNAMIC ACTION :

EVENT CHANGE:

EXAMPLE : ON INV_QTY 

ACTION:
    SET VALUE

    JAVASCRIPT EXPRESSION:

    $v('INV_QTY') * $v('UNIT_TP')


    AFFECTED ELEMENTS :

    AMT


--- GET NET AMOUNT 
01. DYNAMIC ACTION :

EVENT CHANGE:

EXAMPLE : ON AMT

ACTION:
    SET VALUE (1)

    JAVASCRIPT EXPRESSION:

    parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_VAT_PRCNT') != '' ? $v('P68_VAT_PRCNT') : 0) / 100

      AFFECTED ELEMENTS :
        VAT_AMT

ACTION:
    SET VALUE (2)

     JAVASCRIPT EXPRESSION:

     parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_DISC_PRCNT') != '' ? $v('P68_DISC_PRCNT') : 0) / 100
      AFFECTED ELEMENTS :

      DISC_AMT


ACTION:
    SET VALUE (3)

     JAVASCRIPT EXPRESSION:

    parseFloat($v('AMT') != '' ? $v('AMT') : 0) + 
    (parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_VAT_PRCNT') != '' ? $v('P68_VAT_PRCNT') : 0) / 100) -
    (parseFloat($v('AMT') != '' ? $v('AMT') : 0) * parseFloat($v('P68_DISC_PRCNT') != '' ? $v('P68_DISC_PRCNT') : 0) / 100)

    AFFECTED ELEMENTS :

    NET_AMT