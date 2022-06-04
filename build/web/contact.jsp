<%@page import="java.util.List"%>
<%@page import="newpackage.ConnectionDao"%>
<%
    ConnectionDao cDao = new ConnectionDao();
    List<String> ShowContact = cDao.ShowContact();
    
%>

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
        <link rel="stylesheet" href="CSS/contact.css">
        <link rel="stylesheet" href="CSS/AboutUs.css">
        <link rel="stylesheet" href="CSS/search-bar.css">
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
        <div class="contact-container">
            <div class="contact-wrap">
                <div class="contact-in">
                    <h1>Contact Info</h1>
                    <h2><i class="fa fa-phone" aria-hidden="true"></i> Phone</h2>
                    <a href="tel:+91 <% out.println(ShowContact.get(0)); %>" target="blank">+91 <% out.println(ShowContact.get(0)); %></a>
                    <h2 <h2 style="margin-top:10px"><i class="fa fa-envelope" aria-hidden="true"></i> Email</h2>
                    <a style="font-size: 16px;" href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=<% out.println(ShowContact.get(1)); %>" target="blank"><% out.println(ShowContact.get(1)); %></a>
                    <h2 style="margin-top:10px"><i class="fa fa-map-marker" aria-hidden="true"></i> Address</h2>
                    <p><% out.println(ShowContact.get(2)); %></p>
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                <div class="contact-in">
                    <h1>Send a Message</h1>
                    <form>
                        <input  type="text" placeholder="Full Name" class="contact-in-input">
                        <input type="text" placeholder="Email" class="contact-in-input">
                        <input type="text" placeholder="Subject" class="contact-in-input">
                        <textarea placeholder="Message" class="contact-in-textarea"></textarea>
                        <input type="submit" value="SUBMIT" class="btn btn-dark contact-in-btn">
                    </form>
                </div>
                <div class="contact-in">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224345.83923192776!2d77.06889754725782!3d28.52758200617607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfd5b347eb62d%3A0x52c2b7494e204dce!2sNew%20Delhi%2C%20Delhi!5e0!3m2!1sen!2sin!4v1601968196548!5m2!1sen!2sin" width="100%" height="auto" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
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
