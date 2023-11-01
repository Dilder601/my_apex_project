EXECUTE WHEN PAHGE LOAD

//-----Change The Item Background Color 

$('input').on('focus', function() {
$("#"+this.id).css("background-color", "yellow");
}).on('blur', function() {
$("#"+this.id).css("background-color", "white");
});