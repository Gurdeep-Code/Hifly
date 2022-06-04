$(document).ready(function(){
    
    $('#register-switch').click(function(){
        $(".sign_in_form").addClass("sign_in_form-right");
        $(".slider_area_form").addClass("text_area_form-left");
        $("#register-switch").hide();
        $("#login-switch").show();
        $("#register-label").hide();
        $("#login-label").fadeIn("slow");
        $(".register-form").fadeIn("slow");
        $(".Login-form").hide();

    });

    $('#login-switch').click(function(){
        $(".sign_in_form").removeClass("sign_in_form-right");
        $(".slider_area_form").removeClass("text_area_form-left");
        $("#register-switch").show();
        $("#login-switch").hide();
        $("#register-label").fadeIn("slow");
        $("#login-label").hide();
        $(".register-form").hide();
        $(".Login-form").fadeIn("slow");

    });

});