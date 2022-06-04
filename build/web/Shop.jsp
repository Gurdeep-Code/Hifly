<%@page import="Cart.Cart"%>
<%@page import="newpackage.Users"%>
<%@page import="java.util.List"%>
<%@page import="AdminPanel.AddProducts"%>
<%@page import="newpackage.ConnectionDao"%>
<%
    ConnectionDao cDao = new ConnectionDao();
String CartID = "c"+session.getAttribute("UserPhone");

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
        <link rel="stylesheet" href="CSS/shop.css">
        <link rel="stylesheet" href="CSS/search-bar.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="96">

        <!-- NAVBAR START -->

        <nav class="navbar navbar-expand-sm  px-5 bg-dark sticky-top">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="#">
                <img src="Logo/logo-main.png" alt="logo">
            </a>

            <!-- Links -->
            <ul class="navbar-nav mx-5">
                <li class="nav-item ml-3 mr-2">
                    <a class="nav-link" href="Home.jsp">HOME</a>
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
                    <button style="position:relative;"  class="btn btn-primary" data-target="#cart" data-toggle="modal"><i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp;<% Cart cart1 = cDao.Total(CartID); int TotalQuan = cart1.getTotalQuan(); if( TotalQuan != 0){%> <span style="font-size: 16px; padding:3px 6px 3px 6px; border-radius:50%; position:absolute; top:-11px; right:-10px;   " class="badge badge-light"><% out.print(TotalQuan); %></span><% }else{%> <span style="font-size: 16px; padding:3px 6px 3px 6px; border-radius:50%; position:absolute; top:-11px; right:-10px;   " class="badge badge-light">0</span><%} %></button>
                </li>
                <li class="nav-item ml-4 mr-2">
                    <button onclick="window.location.href = 'Logout';"  class="btn-primary logout-btn">LOGOUT</button>
                </li>
            </ul>
            <%

            } else {
            %>


            <ul class="navbar-nav ml-auto">
                <li class="nav-item ml-4">
                    <button onclick="window.location.href = 'login_register.jsp';"  class="btn-primary logout-btn">LOGIN</button>
                </li>
            </ul>
            <%
                }
            %>

        </nav>

        <%@include file="message.jsp" %>

        <!-- NAVBAR end -->

        <!-- Product views -->

        <div class="product-container py-4">
            <div class="product-main" >

                <div class="card-columns">
                    <% List< AddProducts> Products = cDao.selectAllProducts();

                        for (AddProducts p : Products) {
                    %>
                    <div class="card shadow-sm mb-4" style="width:330px">
                        <img class="card-img-top" src="image/Products/<%= p.getPimage()%>">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getPname()%></h5>
                            <p class="card-text"><%= p.getPdesc()%></p>
                            <h4 class="card-text font-weight-bolder">&#8377; <%= p.getPprice()%></h4>
                        </div>
                        <div class="card-footer">
                            <%
                                if (p.getPquantity() == 0) {
                            %>
                            <button class="btn-block btn btn-danger" disabled><i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; OUT OF STOCK</button>
                            <%
                            } else {
                                if (session.getAttribute("CurrentUser") != null && session.getAttribute("UserType") == null) {

                            %>
                            <!-- Product view Start -->
                            <form action="AddToCart" id="<%= p.getPid()%>" method="post" >
                                <input type="hidden" id="fname" name="pid" value="<%= p.getPid()%>">
                                <input type="hidden" id="lname" name="CartID" value="c<%= session.getAttribute("UserPhone")%>">
                            </form
                            <!-- Product view end -->
                            <button type="submit" form="<%= p.getPid()%>" class="btn-block btn btn-info"><i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; ADD TO CART</button>
                            <%                            } else {%>
                            <button class="login-please btn-block btn btn-danger" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Please Login"><i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; ADD TO CART</button>
                            <%}
                                }
                            %>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <!-- Product view end -->



        <!-- Cart start-->
        <div class="modal fade" data-backdrop="static" id="cart">
            <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family: Neutraface_2_Display_Bold;">CART</h4>
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="font-size:16px;">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table class="table table-hover text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th>PRODUCTS IMAGE</th>
                                    <th>PRODUCTS NAME</th>
                                    <th>PRODUCTS  QUANTITY</th>
                                    <th>PRODUCTS PRICE</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    List<Cart> cart = cDao.ListCart(CartID);
                                    if (cart.size() > 0) {

                                        for (Cart c : cart) {
                                %>

                                <tr>
                                    <td><img src="image/Products/<%= c.getProductImage() %>" class="img-thumbnail" width="60" height="60"></td>
                                    <td><%= c.getProductName() %></td>
                                    <td><%= c.getProductQuan() %></td>
                                    <td><%= c.getProductPrice() %></td>
                                </tr>
                            <%
                                }
                            } else {%><tr><td colspan="4">No Product In Database</td></tr><%}
                            %>
                            <tr></tr><td colspan="4">Total = Rs <% Cart cart1 = cDao.Total(CartID); int TotalPrice = cart1.getTotalPrice(); out.print(TotalPrice); %></td></tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer py-4">

                    </div>

                </div>
            </div>
        </div>
        <!-- CART END -->


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
                <li style="font-size:17px; margin:0px 15px 10px 15px;"><a href="AboutUs.jsp" target="blank">ABOUT US</a></li>
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
        <script>
                        $(document).ready(function () {
                            $('[data-toggle="popover"]').popover();
                        });
        </script>
    </body>
</html>