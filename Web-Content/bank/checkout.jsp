<%-- 
    Document   : checkout
    Created on : Jun 21, 2013, 10:06:02 AM
    Author     : PIYUSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="home.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div name="checkout" id="checkout">
            <div id="header" >
                <%@include file="header.jsp" %>
            </div>
            <div id="cartheader">
                <h3>Shopping Cart :</h3>
            </div>
            <%request.getSession();
                int count = 0;
                if ((Integer) session.getAttribute("product_count") != null) {
                    count = (Integer) session.getAttribute("product_count");
                } else {
                    count = 1;

                }
                for (int i = 1; i <= count; i++) {
            %>
            <div id="cartdetails" width="1000px" height="250px">
                <ul>
                <div id="product_details"  style="float: left;margin-left: 30px;margin-top: 30px;width:1200px; height:170px">
                    <%
                            if(session.getAttribute("product_id" + i)==null){
                        out.println("<h3>Sorry! Your cart is still empty.Plz add products to your cart to continue.</h3?");
                    }else{
            %>
                    <li><img src="img/<%out.println(session.getAttribute("product_imgsrc" + i));%>" height="150px" width="150px"></li>

                    <li><div style="float: left">
                        <div id="prod_name">Product Name:<a href="item.jsp?prodid=<%session.getAttribute("product_id" + i);%>">
                                <%out.println(session.getAttribute("product_name" + i));%></a></div><br>
                        <div id="product_id">Product Id  :<% out.println(session.getAttribute("product_id" + i));%></div><br>
                        <div id="product_price">Product Price: Rs.<%out.println(session.getAttribute("prod_price" + i));%>.00 </div><br>
                        <div id="product_quantity">Product Quantity:<input type="text" value="<%out.println(session.getAttribute("product_qty" + i));%>">
                           
                        </div>
                    </div></li>
                </div></ul>
            </div><%} }
            %>
        </div>
<form action="placeorder_step1.jsp" method="post">
            <div id="buynow" style="float: right; margin-right: 40px;margin-top: 40px; ">
                <input type="image" src="img/placeorder.jpg" width="150" height="50" border-image="1">
            </div>
            </form>

    </body>
</html>
