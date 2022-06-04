<%@page import="newpackage.Users"%>
<%@page import="java.util.List"%>
<%@page import="AdminPanel.AddProducts"%>
<%@page import="newpackage.ConnectionDao"%>
<%ConnectionDao cDao = new ConnectionDao();%>
<%
    if (session.getAttribute("CurrentUser") == null) {
        response.sendRedirect("login_register.jsp");
        return;
    } else if (session.getAttribute("UserType") == null) {
        response.sendRedirect("login_register.jsp");
        return;
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>H I F L Y</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="CSS/AdminPage.css">
        <link rel="icon" href="Logo/favicon.png">
        <link rel="stylesheet" href="CSS/Font.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="96">

        <!-- NAVBAR START -->

        <nav class="navbar shadow-sm bg-dark navbar-expand-sm px-5 sticky-top">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="#">
                <img src="Logo/logo-main.png" alt="logo">
            </a>

            <!-- Links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item ml-3 mr-2">
                    <a class="nav-link" href="#"><i class="fa fa-user" aria-hidden="true"></i> &nbsp; <%=session.getAttribute("CurrentUser")%></a>
                </li>
                <li class="nav-item mx-3">
                    <button onclick="window.location.href = 'Logout';"  class="btn-light logout-btn">LOGOUT</button>
                </li>
            </ul>

        </nav>

        <!-- NAVBAR END -->    

        <!-- Button for Admin -->  
        <div class="container" style=" position: absolute;top: 50%;left:50%;transform: translate(-50%, -50%);">      
            <div class="row my-4" style="text-align:center;">
                <div class="col-md-4">
                    <!-- Button for adding product to database --> 
                    <button data-toggle="modal" data-target="#AddProductForm"  class="btn-primary AddPro shadow-sm">Add New Product  &nbsp;&nbsp;  <i class="fa fa-plus-circle" aria-hidden="true"></i></button> 
                </div>
                <div class="col-md-4">
                    <button data-toggle="modal" data-target="#EditContactForm"  class="btn-info AddPro shadow-sm">Edit Contact Info  &nbsp;&nbsp;  <i class="fa fa-pencil" aria-hidden="true"></i></button> 
                </div>
                <div class="col-md-4">
                    <button data-toggle="modal" data-target="#EditAboutUs"  class="btn-warning text-white AddPro shadow-sm">Edit About us  &nbsp;&nbsp;  <i class="fa fa-pencil" aria-hidden="true"></i></button> 
                </div>
            </div>

            <div class="row my-4" style="text-align:center;">
                <div class="col-md-4">
                    <button data-toggle="modal" data-target="#Viewproducts"  class="btn-info AddPro shadow-sm">View Products  &nbsp;&nbsp;  <i class="fa fa-eye" aria-hidden="true"></i></button> 
                </div>
                <div class="col-md-4">
                    <button data-toggle="modal" data-target="#Deleteproduct"  class="btn-secondary AddPro shadow-sm">Delete Products  &nbsp;&nbsp;  <i class="fa fa-trash" aria-hidden="true"></i></button> 
                </div>
                <div class="col-md-4">
                    <button data-toggle="modal" data-target="#Viewusers"  class="btn-danger AddPro shadow-sm">View Users  &nbsp;&nbsp;  <i class="fa fa-eye" aria-hidden="true"></i></button> 
                </div>
            </div>
        </div>

        <%@include file="message.jsp" %>
        <%@include file="delete-msg.jsp" %>


        <!-- Add Product form -->
        <div class="modal fade " data-backdrop="static" id="AddProductForm">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family: Neutraface_2_Display_Bold;">ADD PRODUCTS</h4>
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="font-size:16px;">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <form action="AddProductsServlet" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                            <div class="form-group">
                                <input  class="form-control" placeholder="Enter Product Name" id="pname" name="pname" required>
                            </div>
                            <div class="form-group">
                                <textarea  class="form-control" rows="3" placeholder="Enter Product Description" id="pdesc" name="pdesc" required></textarea>
                            </div>
                            <div class="form-group">
                                <input  class="form-control" placeholder="Enter Product Quantity" id="pquan" name="pquan" required>
                            </div>
                            <div class="form-group">
                                <input  class="form-control" placeholder="Enter Product Price" id="pprice" name="pprice" required>
                            </div>
                            <div class="form-group custom-file">
                                <input type="file" accept="image/*" class="custom-file-input" id="customFile" name="pimage" required>
                                <label class="custom-file-label" for="customFile">Choose file</label>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer mt-3">
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-success">SUBMIT</button>
                                </div>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!-- Add Product form END -->


        <!-- Add About Us form -->
        <div class="modal fade" data-backdrop="static" id="EditAboutUs">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family: Neutraface_2_Display_Bold;">EDIT ABOUT US</h4>
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="font-size:16px;">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <form action="EditAboutUs" method="post"  class="needs-validation" novalidate>

                            <div class="form-group">
                                <textarea  class="form-control" rows="3" placeholder="Enter About Us"  name="about1" required></textarea>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer mt-3">
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-success">SUBMIT</button>
                                </div>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!-- Add About Us form END -->


        <!-- Add Contact form -->
        <div class="modal fade" data-backdrop="static" id="EditContactForm">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family: Neutraface_2_Display_Bold;">EDIT CONTACT DETAIL</h4>
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="font-size:16px;">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">


                        <form action="EditContact" method="post"  class="needs-validation" novalidate>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <input type="text" pattern="[0-9]{10}" title="Ten Digit Number Only" class="form-control" placeholder="Enter Phone No."  name="Cphone" required>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-success">EDIT</button>
                                </div>
                            </div>
                        </form>

                        <form action="EditContact" method="post"  class="needs-validation" novalidate>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <input type="email" pattern="[a-z0-9._-]+@[a-z0-9]+\.[a-z]{3,}$" title="Email that must be in the following order: characters@characters.domain" class="form-control" placeholder="Enter Email"  name="Cemail" required>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-success">EDIT</button>
                                </div>
                            </div>
                        </form>


                        <form action="EditContact" method="post"  class="needs-validation" novalidate>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <input pattern="[^\x40]+" title="Address cannot contain @ characters" class="form-control" placeholder="Enter Address"  name="Caddress" required>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-success">EDIT</button>
                                </div>
                            </div>
                        </form>

                        <!-- Modal footer -->
                        <div class="modal-footer  py-3"></div>

                    </div>

                </div>
            </div>
        </div>
        <!-- Add Contact form END -->



        <!-- View products start-->
        <div class="modal fade" data-backdrop="static" id="Viewproducts">
            <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family: Neutraface_2_Display_Bold;">LIST OF PRODUCTS</h4>
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="font-size:16px;">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table table-hover text-center">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Product Quantity</th>
                                        <th>Product Price</th>
                                        <th>Product Desc.</th>
                                        <th>Product Image</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% List< AddProducts> Products = cDao.selectAllProducts();
                                        if (Products.size() > 0) {

                                            for (AddProducts p : Products) {
                                    %>
                                    <tr>
                                        <td><%= p.getPid()%></td>
                                        <td><%= p.getPname()%></td>
                                        <td><%= p.getPquantity()%></td>
                                        <td><%= p.getPprice()%></td>
                                        <td><div id="accordion">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <a class="collapsed card-link" data-toggle="collapse" href="#desc">
                                                            Description
                                                        </a>
                                                    </div>
                                                    <div id="desc" class="collapse" data-parent="#accordion">
                                                        <div class="card-body">
                                                            <%= p.getPdesc()%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><img src="image/Products/<%= p.getPimage()%>" class="img-thumbnail" width="50" height="50"></td>
                                    </tr>
                                    <%
                                        }
                                    } else {%><tr><td colspan="6">No Product In Database</td></tr><%}
                                    %>
                                </tbody>

                            </table>
                        </div>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer py-4">

                    </div>

                </div>
            </div>
        </div>
        <!-- View products END -->


        <!-- View users start-->
        <div class="modal fade" data-backdrop="static" id="Viewusers">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family: Neutraface_2_Display_Bold;">LIST OF USERS</h4>
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="font-size:16px;">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table class="table table-hover text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th>NAME</th>
                                    <th>PHONE</th>
                                    <th>EMAIL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Users> User = cDao.selectAllUsers();
                                    for (Users u : User) {
                                %>
                                <tr>
                                    <td><%= u.getName()%></td>
                                    <td><%= u.getPhone()%></td>
                                    <td><%= u.getEmail()%></td>
                                </tr>
                            </tbody>
                            <%
                                }
                            %>   
                        </table>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer py-4">

                    </div>

                </div>
            </div>
        </div>
        <!-- View users END -->


        <!-- Delete product -->
        <div class="modal fade" data-backdrop="static" id="Deleteproduct">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family: Neutraface_2_Display_Bold;">DELETE PRODUCT</h4>
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="font-size:16px;">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">


                        <form action="deleteProductServlet" method="post"  class="needs-validation" novalidate>
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <input type="text" pattern="[0-9]{1,}" title="Enter product ID and it must be in integer" class="form-control" placeholder="Enter Product ID"  name="Dproduct" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn btn-danger">DELETE</button>
                                </div>
                            </div>
                        </form>


                        <!-- Modal footer -->
                        <div class="modal-footer  py-3"></div>

                    </div>

                </div>
            </div>
        </div>
        <!--Delete product end -->





        <div class="footer-main pt-2 fixed-bottom">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="jquery/search-bar.js"></script> 
        <script>
                        // Add the following code if you want the name of the file appear on select
                        $(".custom-file-input").on("change", function () {
                            var fileName = $(this).val().split("\\").pop();
                            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                        });

                        // Disable form submissions if there are invalid fields
                        (function () {
                            'use strict';
                            window.addEventListener('load', function () {
                                // Get the forms we want to add validation styles to
                                var forms = document.getElementsByClassName('needs-validation');
                                // Loop over them and prevent submission
                                var validation = Array.prototype.filter.call(forms, function (form) {
                                    form.addEventListener('submit', function (event) {
                                        if (form.checkValidity() === false) {
                                            event.preventDefault();
                                            event.stopPropagation();
                                        }
                                        form.classList.add('was-validated');
                                    }, false);
                                });
                            }, false);
                        })();
        </script>
    </body>
</html>
