<%
    String Dmsg = (String) session.getAttribute("Dmsg");

    if (Dmsg == "T") {
        //out.println("Product Successfully Added");

%>

<div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong> Successfully Deleted.
</div>

<%    session.removeAttribute("Dmsg");

} 
else if (Dmsg == "F") {
    //out.println("Product Not Added");

%>

<div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Alert!</strong> Please Enter Correct Product ID.
</div>

<%
session.removeAttribute("Dmsg");
}

%>
