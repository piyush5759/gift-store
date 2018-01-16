<%-- 
    Document   : placeorder_step1
    Created on : Jun 21, 2013, 6:03:36 PM
    Author     : rachit
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="home.css">
        <script>
            function defaultcheckbox() {
                document.getElementById("checkbox").checked = true;
            }
            function togglestatus() {
                if ((document.getElementById("billingAddress").style.display) == "block")
                    document.getElementById("billingAddress").style.display = "none";
                else
                    document.getElementById("billingAddress").style.display = "block";
            }
        </script>
    </head>
    <body>
        <div id="container">
            <div id="header" >
                <%@include file="header.jsp" %>
            </div>

            <form action="placeorder_step1.jsp?status=1" method="post">
                <%
                    int ship_id = 1, bill_id = 1;
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");
                    Statement st2 = con.createStatement();
                    ResultSet rs1 = st2.executeQuery("select max(id) from SHIPPING_DETAILS");
                    con.setAutoCommit(false);
                    while (rs1.next()) {
                        ship_id = rs1.getInt(1);
                    }
                    ResultSet rs2 = st2.executeQuery("select max(id) from BILLING_DETAILS");
                    con.setAutoCommit(false);
                    while (rs2.next()) {
                        bill_id = rs2.getInt(1);
                    }
                    try {
                        if (session.getAttribute("username") == null) {
                            out.println("You are not loggedIn to our website .So plz logIn first then continue by filling the above form.");
                        } else {
                            if (request.getParameter("shipping_phone") == null) {
                %>

                
                    <table>
                        <tr><td colspan="2">
                                <h2>Shipping Address:</h2>
                            </td></tr>
                        <tr><td> 
                                Your Name:</td><td>
                                <input type="text"  name="shipping_name">
                            </td></tr>
                        <tr><td> 
                                Address:</td><td>
                                <textarea rows="4" cols="20" name="shipping_address"></textarea>
                            </td></tr>
                        <tr><td> 
                                City:</td><td>
                                <input type="text" name="shipping_city">
                            </td></tr>
                        <tr><td> 
                                State:</td><td>
                                <input type="text" name="shipping_state">
                            </td></tr>
                        <tr><td> 
                                Country:</td><td>
                                <input type="text" name="shipping_country">
                            </td></tr>
                        <tr><td> 
                                Pincode:</td><td>
                                <input type="text" name="shipping_pincode">
                            </td></tr>
                        <tr><td> 
                                Phone:</td><td>
                                <input type="text" name="shipping_phone">
                            </td></tr>
                    </table>
                
        <div id="checkbox" onclick="togglestatus()">
            <input type="checkbox" id="checkbox" checked="checked"  name="checkbox" value="y"  > 
        </div>Use my Shipping Address as Billing Address.<br>
        <div id="billingAddress" style="float: right;margin-top: -303px;width: 600px;height: 260px ;display:none;">
            <table> 
                <tr><td colspan="2"> 
                        <h2>Billing Address:</h2>
                    </td></tr>
                            <tr><td> 
                                    Your Name:</td><td>
                                    <input type="text" name="billing_name">
                                </td></tr>
                            <tr><td> 
                                    Address:</td><td>
                                    <textarea rows="4" cols="20" name="billing_address"></textarea>
                                </td></tr>
                            <tr><td> 
                                    City:</td><td>
                                    <input type="text" name="billing_city">
                                </td></tr>
                            <tr><td> 
                                    State:</td><td>
                                    <input type="text" name="billing_state">
                                </td></tr>
                            <tr><td> 
                                    Country:</td><td>
                                    <input type="text" name="billing_country">
                                </td></tr>
                            <tr><td> 
                                    Pincode:</td><td>
                                    <input type="text" name="billing_pincode">
                                </td></tr>
                            <tr><td> 
                                    Phone:</td><td>
                                    <input type="text" name="billing_phone">
                                </td></tr>
                        </table></div> <div><input type="submit" value="Continue"></div>
                        </form>
                        <%} else {
                            ship_id++;
                        %>
                        <c:set var="shipping_name" value="${param.shipping_name}" />
                        <c:set var="shipping_id" value="<%=(session.getAttribute("username") + "_" + ship_id)%>" />
                        <c:set var="shipping_address" value="${param.shipping_address}" />
                        <c:set var="shipping_city" value="${param.shipping_city}"/>
                        <c:set var="shipping_state" value="${param.shipping_state}"/>
                        <c:set var="shipping_country" value="${param.shipping_country}"/>
                        <c:set var="user_id" value="<%=session.getAttribute("user_id")%>"/>  
                        <c:set var="shipping_pincode" value="${param.shipping_pincode}"/>
                        <c:set var="shipping_phone" value="${param.shipping_phone}"/>
                        <c:if test="${(shipping_name!=null)&&(shipping_id!=null) && (shipping_address!=null) && (shipping_city!=null)&& (shipping_state!=null)
                                      && (shipping_country!=null) && (shipping_pincode!=null)}">

                              <sql:update var="result" dataSource="jdbc/myDatasource">
                                  INSERT INTO shipping_details(shipping_name,shipping_id,user_id, shipping_address,  shipping_city,  shipping_state, 
                                  shipping_country,  shipping_pincode, shipping_phone)
                                  VALUES (?,?,?,?,?,?,?,?,?)
                                  <sql:param value="${shipping_name}"/>
                                  <sql:param value="${shipping_id}"/>
                                  <sql:param value="${user_id}"/>
                                  <sql:param value="${shipping_address}"/>
                                  <sql:param value="${shipping_city}"/>
                                  <sql:param value="${shipping_state}"/>
                                  <sql:param value="${shipping_country}"/>
                                  <sql:param value="${shipping_pincode}"/>
                                  <sql:param value="${shipping_phone}"/>
                              </sql:update>
                        </c:if>

                        <%
                            if (request.getParameter("checkbox").equalsIgnoreCase("y")) {
                                bill_id++;
                                out.println(bill_id + "2sraa");
                        %>
                        <c:set var="shipping_id" value="<%=(session.getAttribute("username") + "_" + ship_id)%>" />
                        <sql:update var="result2" dataSource="jdbc/myDatasource">
                            INSERT INTO billing_details (billing_name,billing_id, user_id, billing_address,  billing_city,  billing_state, 
                            billing_country,  billing_pincode, billing_phone)
                            SELECT shipping_name, shipping_id, user_id, shipping_address,  shipping_city,  shipping_state, 
                            shipping_country, shipping_pincode, shipping_phone FROM shipping_details where shipping_id=?
                            <sql:param value="${shipping_id}"/>
                        </sql:update> 
                        <% }
                                    response.sendRedirect("placeorder_step2.jsp?status=1");
                                }
                            }
                        } catch (NullPointerException n) {
                            bill_id++;
                            out.println(bill_id);
                        %>
                        <c:set var="billing_name" value="${param.billing_name}" />
                        <c:set var="billing_id" value="<%=(session.getAttribute("username") + "_" + ship_id)%>" />
                        <c:set var="billing_address" value="${param.billing_address}" />
                        <c:set var="billing_city" value="${param.billing_city}"/>
                        <c:set var="billing_state" value="${param.billing_state}"/>
                        <c:set var="billing_country" value="${param.billing_country}"/>
                        <c:set var="user_id" value="<%=session.getAttribute("user_id")%>"/>  
                        <c:set var="billing_pincode" value="${param.billing_pincode}"/>
                        <c:set var="billing_phone" value="${param.billing_phone}"/>
                        <c:if test="${(billing_name!=null)&&(billing_id!=null) && (billing_address!=null) && (billing_city!=null)&& (billing_state!=null)
                                      && (billing_country!=null) && (billing_pincode!=null)}">

                              <sql:update var="result" dataSource="jdbc/myDatasource">
                                  INSERT INTO billing_details(billing_name,billing_id,user_id, billing_address,  billing_city,  billing_state, 
                                  billing_country,  billing_pincode, billing_phone)
                                  VALUES (?,?,?,?,?,?,?,?,?)
                                  <sql:param value="${billing_name}"/>
                                  <sql:param value="${billing_id}"/>
                                  <sql:param value="${user_id}"/>
                                  <sql:param value="${billing_address}"/>
                                  <sql:param value="${billing_city}"/>
                                  <sql:param value="${billing_state}"/>
                                  <sql:param value="${billing_country}"/>
                                  <sql:param value="${billing_pincode}"/>
                                  <sql:param value="${billing_phone}"/>
                              </sql:update>
                        </c:if>

                        <%
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                        </div>
                        </body>
                        </html>
