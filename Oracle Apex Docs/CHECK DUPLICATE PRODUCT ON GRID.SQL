->STATIC ID OF REGION:  IG-INVOICE 
  ITEM ID; SL

01. : FUNCTION AND GLOBAL VARIABLE DECLARATION

// DUPLICATE PRODUCT CHECK



function chkDUP() {
   var record;
   var prodDUP=0;
//Identify the particular interactive grid
   var ig$ = apex.region("IG-INVOICE").widget();
   var grid = ig$.interactiveGrid("getViews","grid");
//Fetch the model for the interactive grid
    var model = grid.model;
//Select all rows
  ig$.interactiveGrid("getViews").grid.view$.grid("selectAll");
//Fetch selected records
   var selectedRecords = grid.view$.grid("getSelectedRecords");

   for (idx1=0; idx1 < selectedRecords.length; idx1++) {
      record = model.getRecord(selectedRecords[idx1][0]);
      prodcode1 = model.getValue(record,"PROD_ID");
      for (idx2=0; idx2 < selectedRecords.length; idx2++) {
         record = model.getRecord(selectedRecords[idx2][0]);
         prodcode2 = model.getValue(record,"PROD_ID");
          if (prodcode1 == prodcode2 && idx1 != idx2) {
             prodDUP=1;
             break;
         }
      } 
      if (prodDUP == 1) {
        break;
      }        
   }
   $s("P68_PRODUP",prodDUP);        
   if (prodDUP == 1) {
      alert("Duplication of product occurred - "+prodcode2);   
   }   
}


02. DYNAMIC ACTION: 
    EVENT :  BEFORE PAGE SUBMIT: 

03. TRUE ACTION:

    EXECUTE JAVASCRIPT CODE: 
    
    chkDUP();