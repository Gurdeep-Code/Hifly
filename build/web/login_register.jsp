<%-- 
    Document   : login_register
    Created on : 5 Oct, 2020, 4:43:07 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>H I F L Y</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="Logo/favicon.png">
    <link rel="stylesheet" href="CSS/Font.css">
    <link rel="stylesheet" href="CSS/login_register.css">
    <link rel="stylesheet" href="CSS/AboutUs.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  </head>
    
    <body>
        <div class="formcont">  
    <button onclick="window.location.href='Home.jsp';"  class="btn-primary back-to-home-btn"><i class="fa fa-home" aria-hidden="true"></i></button>


    <div class="login_register_container">
        <div class="sign_in_form">
          <!--------------- LOGIN FORM START ---------->
          <form id="loginForm" class="Login-form" onsubmit="return loginVALID()">
            <h2>LOG IN</h2>
            <div class="form-group">
              <input class="form-control" placeholder="Email" id="LEmail" name="LEmail">
            </div>
            
            <div class="form-group">
              <input type="password" class="form-control" placeholder="Password" id="LPwd" name="LPwd">
            </div>
            <button class="btn-primary">LOG IN</button>
          </form>
          

          <!--------------- LOGIN FORM END ---------->
 
          <!--------------- REGISTER FORM START ---------->

            <form id="registerForm"   class="register-form" onsubmit="return registerVALID()">
              <h2>REGISTER</h2>
              <div class="form-group">
                <input class="form-control" placeholder="Name" id="Name" name="Name"  onfocus="nameNOTE()">
                <input class="form-control" placeholder="Email" id="Email" name="Email"   onfocus="emailNOTE()"> 
                <input class="form-control" placeholder="Phone No." id="Phone" name="Phone"  onfocus="phoneNOTE()"> 
                <input type="password" class="form-control" placeholder="Password" id="pwd" name="pwd" onfocus="passNOTE()">
                <button class="btn-primary" type="submit">SUBMIT</button>
              </div>
            </form>

          <!--------------- REGISTER FORM END ---------->

        </div>
            

        <div class="slider_area_form">

          <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- The slideshow -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img   src="login_form_slider/2.jpg">
                <div class="black_overlay"></div>
              </div>
              <div class="carousel-item">
                <img   src="login_form_slider/1.jpg">
                <div class="black_overlay"></div>
              </div>
              <div class="carousel-item">
                <img   src="login_form_slider/3.jpg">
                <div class="black_overlay"></div>
              </div>
              <div class="carousel-item">
                <img   src="login_form_slider/4.jpg">
                <div class="black_overlay"></div>
              </div>

              <div class="carousel-caption">
                <h1 id="register-label">Register</h1>
                <h1 id="login-label">login</h1>
                <button id="register-switch"  onclick="clearmsg()">REGISTER</button>
                <button id="login-switch"  onclick="clearmsg()">LOG IN</button>
              </div>

              <ul class="carousel-indicators rad">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
                <li data-target="#demo" data-slide-to="3"></li>
              </ul>
            </div>
      
          </div>
    
        </div>
    </div>
    <p id="invalidMSG">${error}</p>
    <p id="invalidMSG1">${error1}</p>
    
        </div>
    
    <div class="footer-main pt-2">
            <ul>
                <li><a href="#" target="blank"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                <li><a href="#" target="blank"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                <li><a href="#" target="blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                <li><a href="#" target="blank"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
            </ul>

            <ul class="footer-nav">
                <li  style="font-size:17px; margin:0px 15px 10px 15px;"><a class="face" href="#" target="blank">HOME</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="#" target="blank">SHOP</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="#" target="blank">CONTACT</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="#" target="blank">ABOUT US</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="#" target="blank">LOGIN</a></li>
            </ul>

            <ul class="footer-nav ">
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="tel:+91 9560513039" target="blank"><i class="fa fa-phone-square" aria-hidden="true"></i> &nbsp; +91 9560513039</a></li>
                <li style="font-size:13px; margin:0px 15px 10px 15px;"><a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=info.hifly@gmail.com" target="blank"><i class="fa fa-envelope" aria-hidden="true"></i> &nbsp; info.hifly@gmail.com</a></li>
            </ul>
            <div class="w-100 py-2" style="font-size:14px; font-family: Neutraface_2_Text_Light;" style="background: #000000;">Copyright &COPY; HIFLY</div>
        </div>
          
          

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="jquery/login_register.js"></script>
    <script src="jquery/FormValidations.js"></script>
  </body>
</html>