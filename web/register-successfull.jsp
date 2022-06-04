<%-- 
    Document   : register-successfull
    Created on : 4 Oct, 2020, 8:33:55 PM
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
    <link rel="stylesheet" href="CSS/register-successfull.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   </head>
   
    <body>
        <div class="container1">
          <div class="success-img">
              <img src="icons/tick.gif">
              <p>Congratulations, <span><%=request.getAttribute("success")%></span></p>
          </div>
          <div class="success-msg">
          <p>Your account has been<br>successfully created.</p>
          <button class="btn btn-success" onclick="window.location.href='login_register.jsp';">LOG IN</button>
        </div>
      </div>


      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>
