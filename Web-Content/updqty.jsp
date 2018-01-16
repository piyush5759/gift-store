<%-- 
    Document   : updqty
    Created on : Jun 26, 2013, 11:43:15 PM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><%
        int i = Integer.parseInt(request.getParameter("update"));
        session.setAttribute("product_qty" + i, request.getParameter("quantity"));

        response.sendRedirect("checkout.jsp?qty=" + (session.getAttribute("product_qty" + i)).toString());
        %>

    </body>
</html>
