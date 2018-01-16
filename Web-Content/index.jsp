<%-- 
    Document   : index
    Created on : May 9, 2013, 10:37:58 AM
    Author     : rachit
--%>

<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="home.css">
        <title>JSP Page</title>


    </head>
    <body>
 <%-- main division --%>
        <div id="container"  >
            
        <%! Statement st1 = null;%>
        <%! ResultSet rs1, rs2 = null;%> 
        <%

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");

        %>
       
            <%-- header division   --%>
            <div id="header" >
                <%@include file="header.jsp" %>
            </div>
            <%-- categorylist division --%>
            <div id="categorylist" class="div" style="width:1200px" >
                <%
                    try {
                        st = con.createStatement();

                        rs = st.executeQuery("SELECT  category_id, category_name FROM Category where category_level=0");

                        con.setAutoCommit(false);

                        String parname = "", prodname = "", imgsrc = "";
                        int parid = 0, prodid = 0, prodprice = 0;
                        int i = 0, count = 0;
                        String[] catname = new String[500];
                        int catid[] = new int[500];

                        while (rs.next()) {
                            parid = rs.getInt(1);
                            parname = rs.getString(2);
                            out.println("<a href='category.jsp?catid=" + parid + "'>" + parname + "</a>&nbsp;&nbsp;&nbsp;");

                        }
                        out.println("<br><br>");
                        st1 = con.createStatement();
                        rs1 = st.executeQuery("SELECT DISTINCT CatC.CATEGORY_ID, catp.category_name || ' ' || CatC.category_name "
                                + "FROM Category catP  "
                                + "inner join Category CatC on CatP.Category_id=CatC.CATEGORY_PARENTID "
                                + "where CatP.category_Level = 0");
                        con.setAutoCommit(false);
                        while (rs1.next()) {
                            catid[count] = rs1.getInt(1);
                            catname[count] = rs1.getString(2);
                            count++;
                        }
                        PreparedStatement pst1 = con.prepareStatement("SELECT  product_id, product_imgsrc, product_name, product_price FROM Product where product_id in"
                                + "(select product_id from CATEGORY_PRODUCT_RELATION where category_id=?)");
                        out.println("<ul>");

                        while (i < count) {
                            pst1.setInt(1, catid[i]);
                            rs2 = pst1.executeQuery();
                %><li id="subcat"><div id="category" style="vertical-align: middle">
                    <% out.println("<a href='subcategory.jsp?catid=" + catid[i] + "'>" + catname[i] + "</a>");
                                       %></div></li><br><div id="indeximages" style="width:1150px;height:250px;float: left; margin-left: 20px; margin-up: -10px;color: #660000;">
                    <%
                        while (rs2.next()) {
                            imgsrc = rs2.getString(2);
                            prodid = rs2.getInt(1);
                            prodname = rs2.getString(3);
                            prodprice = rs2.getInt(4);
                            if (prodname.length() > 20) {
                                prodname = prodname.substring(0, Math.min(prodname.length(), 21));
                                out.println("<li><a href='item.jsp?prodid=" + prodid + "'>" + prodname + "...</a>");
                                out.println("<br/><a href='item.jsp?prodid=" + prodid + "'>"
                                        + "<img src='img/" + imgsrc + "' height='200' width='200'></a><br>Rs. " + prodprice + "</li>");
                            } else {
                                out.println("<li><a href='item.jsp?prodid=" + prodid + "'>" + prodname + "</a>");
                                out.println("<br/><a href='item.jsp?prodid=" + prodid + "'>"
                                        + "<img src='img/" + imgsrc + "' height='200' width='200'></a><br>Rs. " + prodprice + "</li>");
                            }

                        }%></div><%
                                    out.println("</ul>");
                                    i++;
                                }

                            } catch (Exception e) {
                                out.println(e);
                            }

                    %>
            </div>

            <%-- productlist division --%>  
            <div id="productlist"  class="div" >


            </div>

            <%-- footer division --%>            
            <div id="footer" class="div" >



            </div> 

        </div>
    </body>
</html>
