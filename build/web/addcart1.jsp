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
        <%try {int prodid=-1;
                int count;
                request.getSession();
                String product_name[]=new String[100];
                String imgsrc_name[]=new String[100];
                String quantity[]=new String[100];
                String prod_price[]=new String[100];
                String pid[]=new String[100];
                //String counter = (String) session.getAttribute("product_count");
                if(session.getAttribute("product_count")!=null)
                { count=(Integer)session.getAttribute("product_count");
                }else{
                    count=0;
                }
                count++;
                for (int i = count; i < count + 1; i++) {
                    prod_price[i]=request.getParameter("prodprice");
                    product_name[i] = request.getParameter("prodname");
                    pid[i] = request.getParameter("productid");
                    imgsrc_name[i]= request.getParameter("imgsrc");
                    quantity[i] = request.getParameter("qty");
                    if (pid[i] != null) {
                     prodid = Integer.parseInt(pid[i]);
                    } else {
                        count=count;
                    }
                    session.setAttribute("product_id"+i, prodid);
                    session.setAttribute("prod_price"+i, prod_price[i]);
                    session.setAttribute("product_qty"+i, quantity[i]);
                    session.setAttribute("product_imgsrc"+i, imgsrc_name[i]);
                    session.setAttribute("product_name"+i, product_name[i]);
                    session.setAttribute("product_count", count);
                    session.setMaxInactiveInterval(50*60);
                  
                }
                
                response.sendRedirect("item.jsp?prodid="+prodid+"&status=1");
             
            } catch (Exception e) {
                out.println(e);

            }
        %>
    </body>
</html>
