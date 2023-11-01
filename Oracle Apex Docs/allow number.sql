
01. ON PAGE NODE: EXECUTE WHEN PAGE LOAD 

--Allow Only Numbers and Decimal


$(".allow-decimal").keypress(function (e) {
    if(e.which == 46){
        if($(this).val().indexOf('.') != -1) {
            return false;
        }
    }

    if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
        return false;
    }
});




02.  GO TO ITEM PROPERTY TO ADVANCE -> CSS CLASSES

PASTE THIS CLASS: 

 allow-decimal