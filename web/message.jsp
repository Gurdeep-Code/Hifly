<%
    String msg = (String) session.getAttribute("message");

    if (msg == "T") {
        //out.println("Product Successfully Added");

%>

<div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong> Successfully Added.
</div>

<%    session.removeAttribute("message");

} 
else if (msg == "F") {
    //out.println("Product Not Added");

%>

<div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Alert!</strong> Not Added.
</div>

<%
session.removeAttribute("message");
}

%>
