<%-- 
    Document   : addcart
    Created on : Jun 21, 2013, 6:49:23 AM
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
        <%try {
                int prodid = -1;
                int count;
                request.getSession();
                String product_name;
                String imgsrc_name;
                String quantity;
                String prod_price;
                String pid;
                //String counter = (String) session.getAttribute("product_count");
                if (session.getAttribute("product_count") != null) {
                    count = (Integer) session.getAttribute("product_count");
                } else {
                    count = 0;
                }
                out.println(count);
                prod_price = request.getParameter("prodprice");
                product_name = request.getParameter("prodname");
                pid = request.getParameter("productid");
                imgsrc_name = request.getParameter("imgsrc");
                quantity = request.getParameter("qty");
                if (pid != null) {
                    prodid = Integer.parseInt(pid);
                }
                out.println(pid);
                out.println(prodid);
                out.println("quantity" + quantity);
                int counter = count + 1;
                if (count == 0) {
                    session.setAttribute("product_id" + counter, pid);
                    session.setAttribute("prod_price" + counter, prod_price);
                    session.setAttribute("product_qty" + counter, quantity);
                    session.setAttribute("product_imgsrc" + counter, imgsrc_name);
                    session.setAttribute("product_name" + counter, product_name);
                    session.setAttribute("product_count", counter);
                    out.println("first quantity is " + session.getAttribute("product_qty" + counter));
                    session.setMaxInactiveInterval(50 * 60);
                } else if (count > 0) {
                    int i = 1;
                    for (i = 1; i <= count + 1; i++) {
                        if(i <= count){
                            if (pid.equals(session.getAttribute("product_id" + i).toString())) {
                                int newquantity = Integer.parseInt(quantity) + (Integer.parseInt(session.getAttribute("product_qty" + i).toString()));
                                out.println("newquantity is " + newquantity);
                                session.setAttribute("product_qty" + i, newquantity);
                                out.println("2 the value of i is " + i + session.getAttribute("product_qty" + i) + "     ");
                                break;
                            } else 
                                continue;
                        }
                        else if (i == (count + 1)) {
                            session.setAttribute("product_id" + counter, pid);
                            session.setAttribute("prod_price" + counter, prod_price);
                            session.setAttribute("product_qty" + counter, quantity);
                            session.setAttribute("product_imgsrc" + counter, imgsrc_name);
                            session.setAttribute("product_name" + counter, product_name);
                            session.setAttribute("product_count", counter);
                            session.setMaxInactiveInterval(50 * 60);
                            out.println("5" + session.getAttribute("product_qty" + i));
                        }
                    }
                }response.sendRedirect("item.jsp?prodid=" + prodid + "&status=1");
            } 
            catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>