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
        <%try {%>
        <div name="checkout" id="checkout">
            <b>
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
                double sum = 0;
                for (int i = 1; i <= count; i++) {
                    String str = session.getAttribute("product_id" + i).toString();
            %>
            <div id="cartdetails" style="width:1330px; height:250px">
                <ul>
                    <div id="product_details"  style="float: left;margin-left: 30px;margin-top: 30px;width:1200px; height:180px">
                        <li><img src="img/<%out.println(session.getAttribute("product_imgsrc" + i));%>" height="150px" width="150px"></li>

                        <li><div style="float: left">
                                <div id="prod_name">Product Name:<a href="item.jsp?prodid=<%out.print(str);%>">
                                        <%out.println(session.getAttribute("product_name" + i));%></a></div><br>
                                <div id="product_id">Product Id  :<% out.println(session.getAttribute("product_id" + i));%></div><br>
                                <div id="product_price" value="<%=session.getAttribute("prod_price" + i)%>">Product Price: Rs.<%out.println(session.getAttribute("prod_price" + i));%>.00 </div><br>
                                <div id="product_quantity">Product Quantity:
                                    <form action="updqty.jsp" method="post">
                                        <input type="text" id="quantity" name="quantity" value="<%out.print(session.getAttribute("product_qty" + i));%>">  
                                        <input type="hidden" id="update" name="update" value="<%out.print(i);%>">  
                                        <input type="submit" value="Update Cart" >
                                    </form>
                                    <%
                                        String amnt = "";
                                        String update = request.getParameter("update") == null ? "0" : request.getParameter("update");
                                        String qty = "";
                                        double total[] = new double[100];
                                        total[0] = 0;
                                        if (update.equals(Integer.toString(i))) {
                                            amnt = session.getAttribute("prod_price" + i).toString();
                                            qty = request.getParameter("quantity");
                                        } else {
                                            amnt = session.getAttribute("prod_price" + i).toString();
                                            qty = session.getAttribute("product_qty" + i).toString();
                                        }

                                        double amount = Double.parseDouble(amnt);
                                        int quantity = Integer.parseInt(qty);
                                        total[i] = amount * quantity;
                                        out.println("Rs. " + amount * quantity + "0");
                                        sum = sum + total[i];
                                    %>

                                </div></div></li>
                        <div>
                            <form action="removeproduct.jsp" method="post">
                                <input type="hidden" name="count" value="<%=count%>" >
                                <input type="hidden" name="loopi" value="<%=i%>" >
                                <input style="float:right;" onclick="document.getElementById('product_details').style.display='none';" type="submit" name="remove" value="remove">
                            </form>
                        </div>
                    </div></ul>
                    <%
                        }%>


                <div style="float: right;margin-top: 20px;margin-right:40px;"> Total: Rs. <%out.println(+sum + "0");%></div></div>

            <form action="placeorder_step1.jsp?status=1" method="post">
                <div id="buynow" style="float: left; margin-left: 40px;margin-top: 40px;width:10px;  ">
                    <input type="image" src="img/placeorder.jpg" width="150" height="50" border-image="1">
                </div>
            </form>
                </b>
        </div>
        <%} catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
