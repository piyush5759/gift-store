<%-- 
    Document   : product
    Created on : Jun 5, 2013, 12:08:42 PM
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
        
        
        <div id="container"  >

            <%-- header division --%>  
            <div style="margin: 30px;" id="header" >
                <%@include file="header.jsp" %>
                
            </div>
            
            
            
        
        
        <%
            int catid = -1;
            String cid = request.getParameter("catid");
            if (cid != null) {
                catid = Integer.parseInt(cid);
            } else {
                catid = Integer.parseInt(request.getParameter("product_id"));
            }

        %> 
        
        
        
        
        
        <div style="margin: 15px">
            <%
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");
                PreparedStatement pst = con.prepareStatement("SELECT category_name, category_desc FROM category WHERE category_id=?");
                pst.setInt(1, catid);
                rs = pst.executeQuery();
                con.setAutoCommit(false);

                while (rs.next()) {
                    out.println("<h2>" + rs.getString(1) + ":</h2><br>" + rs.getString(2) + "<br><br><br>");
                }

            %>
            </div>
        
            <div id="productlist">
                <ul>
                    <%
                    
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");
            String selectSQL = "SELECT product_name, product_price, product_imgsrc,product_id FROM product WHERE product_id in (SELECT product_id "
                    + "FROM CATEGORY_PRODUCT_RELATION WHERE CATEGORY_ID=?)";
            pst = con.prepareStatement(selectSQL);
            pst.setInt(1, catid);
            rs = pst.executeQuery();
            con.setAutoCommit(false);

                        String prodname;
                        String prodprice;
                        String imgsrc;
                        int prodid;
                        while (rs.next()) {
                            prodname = rs.getString(1);
                            prodprice = rs.getString(2);
                            imgsrc = rs.getString(3);
                            prodid = rs.getInt(4);
                            out.println("<li><div>"
                                    + "<div id='imgdisp'><a href='item.jsp?prodid=" + prodid + "'><img src='img/" + imgsrc + "'height='250px' width='250px' style='float:left; margin-right:20px' /></a><br></div>"
                                    + "<br><div style='float:left;' id='prodinfo'><h2><a href='item.jsp?prodid=" + prodid + "'>" + prodname + "</a><h2><br>"
                                    + "<h3>PRODUCT PRICE :</h3> Rs." + prodprice + "<BR><BR></div>"
                                    + "</div></li>");
                        }
                    %>
                </ul>
            </div>
        </div>
    </body>
</html>
