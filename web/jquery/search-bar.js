$(document).ready(function(){
    
    $('.search-btn').click(function(){
        $('.search-bar').animate({
           width:"100%"
        });
    });

    $('.search-bar-close').click(function(){
        $('.search-bar').animate({
           width:"0%"
        });
 
    });
    

});


