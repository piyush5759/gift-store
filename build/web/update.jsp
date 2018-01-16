<%-- 
    Document   : updatecart
    Created on : Jun 27, 2013, 10:23:54 AM
    Author     : PIYUSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%int i = Integer.parseInt(request.getParameter("i"));
            if (Integer.parseInt(request.getParameter("quantity" + i).toString()) == 0) {
                session.removeAttribute("product_id" + i);
                session.removeAttribute("product_name" + i);
                session.removeAttribute("product_imgsrc" + i);
                session.removeAttribute("prod_price" + i);
                int counter = Integer.parseInt(session.getAttribute("product_count").toString());
                out.println(counter);
                counter = counter - 1;
                session.setAttribute("product_count", counter);
                out.println(session.getAttribute("product_count"));
                response.sendRedirect("checkout.jsp?status=1");
                out.println("15");
            } else if (Integer.parseInt(request.getParameter("quantity" + i).toString()) > 0) {
                session.setAttribute("product_qty" + i, Integer.parseInt(request.getParameter("quantity" + i).toString()));
                response.sendRedirect("checkout.jsp?status=1");
                out.println("16");
            }%>
    </body>
</html>
