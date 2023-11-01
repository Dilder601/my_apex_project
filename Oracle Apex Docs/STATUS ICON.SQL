 01. ON REPORT QUERY 
 EXAMPLE:

 DECODE(NVL( BP.STATUS, 1), '1', 'fa fa-check-circle', 'fa fa-times-circle') STATUS_ICON,
 DECODE(NVL( BP.STATUS, 0), '1', 'green', 'red') STATUS_ICON_FLAG

 02. HIDDEN FROM TYPE: 
        STATUS_ICON, STATUS_ICON_FLAG

03. ON STATUS COLUMN: (INTERACTIVE GRID)

    TYPE: HTML EXPRESSION
    SETTING -> HTML Expression:

    <span class="fa fa-check-circle" style="color: green"></span>

03. ON STATUS COLUMN: (INTERACTIVE REPORT AND OTHERS)

TYPE: PLAIN TEXT
SETTING -> HTML Expression:
<span class="#STATUS_ICON#" style="color: #STATUS_ICON_FLAG#"></span>
