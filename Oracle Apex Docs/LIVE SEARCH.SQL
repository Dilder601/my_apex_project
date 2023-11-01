01. EXECUTE WHEN PAGE LOAD:

$(document).ready(function(){
//change with your page item name
    $('#P401_MYINPUT').keyup(function(){
    var search = $(this).val();
    $('.SEARCH_RECORD tbody tr').hide();
    var len = $('.SEARCH_RECORD tbody tr td:contains("'+search+'")').length;
    if(len > 0){
      $('.SEARCH_RECORD tbody tr td:contains("'+search+'")').each(function(){
        $(this).closest('tr').show();
      });
    }
     });
});

$.expr[":"].contains = $.expr.createPseudo(function(arg) {
   return function( elem ) {
     return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
   };
});

P401_MYINPUT --> PAGE ITEM FOR SEARCH

--> go to report attribute css classes : SEARCH_RECORD

