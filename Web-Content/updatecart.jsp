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
            int counter = 0;
            int count = Integer.parseInt(session.getAttribute("product_count").toString());
            counter = count;
            if (Integer.parseInt(request.getParameter("quantity" + i).toString()) == 0) {
                for (int j = i; j <= counter; j++) {
                    if (j == count) {
                        session.removeAttribute("product_id" + j);
                        session.removeAttribute("product_name" + j);
                        session.removeAttribute("product_imgsrc" + j);
                        session.removeAttribute("prod_price" + j);
                        session.removeAttribute("product_qty" + j);
            } else {
                        session.setAttribute("product_id" + j, session.getAttribute("product_id" + (j + 1)));
                        session.setAttribute("product_name" + j, session.getAttribute("product_name" + (j + 1)));
                        session.setAttribute("product_imgsrc" + j, session.getAttribute("product_imgsrc" + (j + 1)));
                        session.setAttribute("product_qty" + j, session.getAttribute("product_qty" + (j + 1)));
                    }
                }
                count = count - 1;
                session.setAttribute("product_count", count);
               response.sendRedirect("checkout.jsp?status=1");
            } else if (Integer.parseInt(request.getParameter("quantity" + i).toString()) > 0) {
                session.setAttribute("product_qty" + i, Integer.parseInt(request.getParameter("quantity" + i).toString()));
                response.sendRedirect("checkout.jsp?status=1");
            }%>
    </body>
</html>