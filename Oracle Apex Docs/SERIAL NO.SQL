->STATIC ID OF REGION:  IG-INVOICE 
  ITEM ID; SL

01. : FUNCTION AND GLOBAL VARIABLE DECLARATION

//this function for serial no



function fnc_auto_serialD(){
var model = apex.region("IG-INVOICE").widget().interactiveGrid("getViews", "grid").model;
     
var slnO = 0;

model.forEach(function(rec) {
    slnO += 1;
    model.setValue(rec,"SL",''+slnO+'');    
});

};


02. DYNAMIC ACTION:
EVENT : ROW INITIALIZATION INTERACTIVE GRID

TRUE ACTION:  EXECUTE JAVASCRIPT CODE 

    CODE: CALL FUNCTION -> 

    fnc_auto_serialD();