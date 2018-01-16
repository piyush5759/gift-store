<%-- 
    Document   : category
    Created on : Jun 5, 2013, 12:08:19 PM
    Author     : rachit
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="home.css">
    </head>
    <body>
        
        <%
            int parid = -1;
            String pid = request.getParameter("catid");
            if (pid != null) {
                parid = Integer.parseInt(pid);
            } else {
                parid = Integer.parseInt(request.getParameter("category_parentid"));
            }
        %>

        <%-- main division --%>
        <div id="container"  >

            <%-- header division --%>  
           <div style="margin: 30px;" id="header" >
                <%@include file="header.jsp" %>
                
            </div>
             <div style="margin: 15px">
            <%
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");
                PreparedStatement pst = con.prepareStatement("SELECT category_name, category_desc FROM category WHERE category_id=?");
                pst.setInt(1, parid);
                rs = pst.executeQuery();
                con.setAutoCommit(false);

                while (rs.next()) {
                    out.println("<h2>" + rs.getString(1) + ":</h2><br>" + rs.getString(2) + "<br><br><br>");
                }

            %>
            </div>

            <%
                pst = con.prepareStatement("SELECT category_id, category_name, category_desc FROM category WHERE category_parentid=?");
                pst.setInt(1, parid);
                rs = pst.executeQuery();
                con.setAutoCommit(false);

            %>        


            <%-- categorylist division --%>  
            <div id="categorylist" class="div"  >
                <%
                    String catname, catdesc;
                    int catid;
                    while (rs.next()) {
                        catid = rs.getInt(1);
                        catname = rs.getString(2);
                        catdesc = rs.getString(3);
                        out.println("<a href='subcategory.jsp?catid=" + catid + "&status=1'>" + catname + "<br>");
                        out.print("<br>");
                    }


                %>
            </div>

            <%-- productlist division --%>  
            <div id="productlist"  class="div" >
                <%
                    pst = con.prepareStatement("SELECT product_id, product_name, product_imgsrc from product where product_id in"
                            + " (select product_id from category_product_relation where category_id in "
                            + " (select category_id from category where category_parentid=?) ) ");
                    pst.setInt(1, parid);

                    String imgsrc = "";
                    int prodid = 0;
                    String prodname = "";
                    rs = pst.executeQuery();
                    out.println("<ul>");
                    while (rs.next()) {
                        imgsrc = rs.getString(3);
                        prodid = rs.getInt(1);
                        prodname = rs.getString(2);
                        if (prodname.length() > 20) {
                            prodname = prodname.substring(0, Math.min(prodname.length(), 21));
                            out.println("<li><a href='item.jsp?prodid=" + prodid + "&status=1'>" + prodname + "...</a>");
                            out.println("<br/><a href='item.jsp?prodid=" + prodid + "&status=1'>"
                                    + "<img src='img/" + imgsrc + "' height='150' width='150'></a></li>");
                        } else {
                            out.println("<li><a href='item.jsp?prodid=" + prodid + "&status=1'>" + prodname + "</a>");
                            out.println("<br/><a href='item.jsp?prodid=" + prodid + "&status=1'>"
                                    + "<img src='img/" + imgsrc + "' height='150' width='150'></a></li>");
                        }
                    }
                    out.println("<ul>");
                %>
            </div>

            <%-- footer division --%>            
            <div id="footer" class="div" >

            </div>

        </div>
    </body>
</html>
