<%-- 
    Document   : Home
    Created on : 26 Dec, 2020, 6:37:18 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>H I F L Y</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="CSS/Home.css">
        <link rel="icon" href="Logo/favicon.png">
        <link rel="stylesheet" href="CSS/Font.css">
        <link rel="stylesheet" href="CSS/search-bar.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="96">

        <!-- NAVBAR START -->

        <nav class="navbar navbar-expand-sm fixed-top pt-3 px-5">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="#">
                <img src="Logo/logo-main.png" alt="logo">
            </a>

            <!-- Links -->
            <ul class="navbar-nav mx-5">
                <li class="nav-item ml-3 mr-2">
                    <a class="nav-link" href="#">HOME</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="Shop.jsp">SHOP</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="contact.jsp">CONTACT</a>
                </li>
                <li class="nav-item ml-3">
                    <a class="nav-link" href="AboutUs.jsp">ABOUT US</a>
                </li>
            </ul>
            

            <%
                if (session.getAttribute("CurrentUser") != null && session.getAttribute("UserType") == null) {
            %>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-user" aria-hidden="true"></i> &nbsp; <%=session.getAttribute("CurrentUser")%></a>
                </li>
                <li class="nav-item ml-4 mr-2">
                    <button onclick="window.location.href = 'Logout';"  class="btn-primary logout-btn">LOGOUT</button>
                </li>
            </ul>
            <%

            } else {
            %>
            <div class="search-area ml-auto">
                <div class="search-bar">
                    <input type="text" id="input-bar" placeholder="Search">
                    <img class="search-bar-close" src="icons/close.png">
                </div> 
            </div>

            <ul class="navbar-nav ml-3">
                <li class="nav-item">
                    <button class="btn-primary search-btn"><i class="fa fa-search" aria-hidden="true"></i></button>
                </li>

                <li class="nav-item ml-4">
                    <button onclick="window.location.href = 'login_register.jsp';"  class="btn-primary login-btn">LOGIN</button>
                </li>
            </ul>
            <%
                }
            %>

        </nav>

        <!-- NAVBAR end -->



        <!-- SLIDER START -->

        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
                <li data-target="#demo" data-slide-to="3"></li>
                <li data-target="#demo" data-slide-to="4"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="Slider_Image/1.jpg" alt="Los Angeles">
                </div>
                <div class="carousel-item">
                    <img src="Slider_Image/2.png" alt="Chicago">
                </div>
                <div class="carousel-item">
                    <img src="Slider_Image/3.png" alt="New York">
                </div>
                <div class="carousel-item">
                    <img src="Slider_Image/4.jpg" alt="New York">
                </div>
                <div class="carousel-item">
                    <img src="Slider_Image/5.png" alt="New York">
                </div>
                <div class="carousel-item">
                    <img src="Slider_Image/6.png" alt="New York">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>

        <!-- SLIDER END -->





        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="jquery/search-bar.js"></script>
    </body>
</html>