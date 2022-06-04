<%@page import="newpackage.ConnectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>H I F L Y</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="Logo/favicon.png">
        <link rel="stylesheet" href="CSS/Font.css">
        <link rel="stylesheet" href="CSS/Home.css">
        <link rel="stylesheet" href="CSS/AboutUs.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="96">

        <!-- NAVBAR START -->

        <nav class="navbar bg-dark navbar-expand-sm sticky-top pt-3 px-5">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="#">
                <img src="Logo/logo-main.png" alt="logo">
            </a>

            <!-- Links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item mx-3">
                    <a class="nav-link" href="Home.jsp">HOME</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="Shop.jsp">SHOP</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="contact.jsp">CONTACT</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="AboutUs.jsp">ABOUT US</a>
                </li>
            </ul>
        </nav>

        <!-- NAVBAR END -->




        <div class="about-section">

            <div class="container-width clearfix">
                <div class="img-section shadow-sm">
                    <img src="image/aboutimg.jpg">
                </div>
                <div class="text-section">
                    <h1>About  Us</h1>
                    <p>
                        <%
                            ConnectionDao cDao = new ConnectionDao();
                            String about = cDao.about();
                            out.println(about);
                        %>
                    </p>
                    <button class="btn btn-primary contactbtn">Contact</button>
                </div>
            </div>
        </div>

        <div class="footer-main pt-2">
            <ul>
                <li><a href="#" target="blank"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                <li><a href="#" target="blank"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                <li><a href="#" target="blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                <li><a href="#" target="blank"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
            </ul>

            <ul class="footer-nav">
                <li  style="font-size:17px; margin:0px 15px 10px 15px;"><a class="face" href="Home.jsp" target="blank">HOME</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="Shop.jsp" target="blank">SHOP</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="contact.jsp" target="blank">CONTACT</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="AboutUs.jsp" target="blank">ABOUT US</a></li>
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="login_register.jsp" target="blank">LOGIN</a></li>
            </ul>

            <ul class="footer-nav ">
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="tel:+91 9560513039" target="blank"><i class="fa fa-phone-square" aria-hidden="true"></i> &nbsp; +91 9560513039</a></li>
                <li style="font-size:13px; margin:0px 15px 10px 15px;"><a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=info.hifly@gmail.com" target="blank"><i class="fa fa-envelope" aria-hidden="true"></i> &nbsp; info.hifly@gmail.com</a></li>
            </ul>
            <div class="w-100 py-2" style="font-size:14px; font-family: Neutraface_2_Text_Light;" style="background: #000000;">Copyright &COPY; HIFLY</div>
        </div>
    </body>
</html>
