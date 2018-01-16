<%-- 
    Document   : deletesession
    Created on : Jun 26, 2013, 11:16:50 PM
    Author     : Piyush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><%int i;
    int counter = Integer.parseInt(session.getAttribute("product_count").toString());
                out.println(counter);
                counter = counter - 1;
                session.setAttribute("product_count", counter);
    out.print(request.getParameter("loopi"));
      session.setAttribute("product_qty" + request.getParameter("loopi"),"0");
      session.setAttribute("product_price" + request.getParameter("loopi"),"0");
      response.sendRedirect("checkout.jsp?status=1");
      %>
    </body>
</html>
