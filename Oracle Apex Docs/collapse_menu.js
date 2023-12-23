(function($) {
    
$(window).on('theme42ready', function() {
    /* Make sure that the navigation menu is collapsed on page load */
    if ($('.t-PageBody').hasClass('js-navExpanded')) {
        $('#t_Button_navControl').click();
    }

    /* Expand on mouse over, collapse on mouse out */
    $('.apex-side-nav .t-Body-nav').hover(
        function(){
            //only expand if the side menu is collapsed
            $('.t-PageBody:not(.js-navExpanded) #t_Button_navControl').click();
        },
        function() {
            $('#t_Button_navControl').click();
        }
    );
});

})(apex.jQuery);