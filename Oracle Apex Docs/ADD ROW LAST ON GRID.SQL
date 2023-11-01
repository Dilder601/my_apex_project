01. CREATE BUTTON

02.SET DYNAMIC ACTION  ON CLICK EVENT

03. EXECUTE JAVA SCRIPT CODE; 

var row$;
var region = apex.region("DPT_SD");
var view = region.call("getCurrentView");


if (view.internalIdentifier === "grid") {
    row$ = region.widget().find(".a-GV-row").last();
    view.view$.grid("setSelection", row$);
    region.call("getActions").invoke("selection-add-row");
}



DPT_SD --> REGION STATIC ID
