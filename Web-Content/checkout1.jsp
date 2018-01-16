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
        <script type="text/javascript">
        </script>
    </head>
    <body>
        <div id="checkout">
            <b>
                <div id="header" >
                    <%@include file="header.jsp" %>
                </div>
                <div id="cartheader">
                    <h3>Shopping Cart :</h3>
                </div>
                <%try {
                        int count = 0;
                        double sum = 0;
                        String cartcheck = null;
                        if (session.getAttribute("product_count") == null || Integer.parseInt(session.getAttribute("product_count").toString()) == 0) {
                            out.println("Sorry! Your cart is still empty.Plz add products to your cart to continue...");
                        } else {
                            count = Integer.parseInt(session.getAttribute("product_count").toString());
                            out.print(count);
                            for (int i = 1; i <= count; i++) {
                                if (session.getAttribute("product_id" + i) != null) {
                %>          <div id="str"><input type="hidden" name="str"></div>
                <div id="cartdetails">
                    <ul>
                        <div id="product_details" style="float: left;margin-left: 30px;margin-top: 30px;width:1150px; height:170px">
                            <li><img src="img/<%out.println(session.getAttribute("product_imgsrc" + i));%>" height="150px" width="150px"></li>
                            <li><div style="float: left">
                                    <div id="prod_name">Product Name:<a href="item.jsp?prodid=<%out.print(session.getAttribute("product_id" + i).toString());%>">
                                            <%out.println(session.getAttribute("product_name" + i));%></a></div><br>
                                    <div id="product_id">Product Id  :<% out.println(session.getAttribute("product_id" + i));%></div><br>
                                    <div id="product_price" value="<%=session.getAttribute("prod_price" + i)%>">Product Price: Rs.<%out.println(session.getAttribute("prod_price" + i));%>.00 </div><br>
                                    <div id="product_quantity">Product Quantity:
                                        <%  String amnt = "", qty = "";
                                            double total[] = new double[100];
                                            total[0] = 0;
                                            if ((String) session.getAttribute("prod_price" + i) != null) {
                                                amnt = session.getAttribute("prod_price" + i).toString();
                                                qty = session.getAttribute("product_qty" + i).toString();
                                            }
                                            double amount = Double.parseDouble(amnt);
                                            int quantity = Integer.parseInt(qty);
                                            total[i] = amount * quantity;
                                            sum = sum + total[i];
                                        %>
                                        <div id="removecart" style="float: right; margin-top: -1px"> 
                                            <form action="updatecart.jsp?status=1" method="post">
                                                <div id="quantity" style="margin-left:10px">
                                                    <input type="hidden" name="i" value="<%=i%>">
                                                    <input type="text" id="quantity<%=i%>" size="1px" name="quantity<%=i%>" value="<%out.println(session.getAttribute("product_qty" + i));%>">
                                                    <div id="productTotal" style="margin-top:-13px;margin-right:  20px; float: right ">
                                                        <div style="float: left;margin-top:15px; background:#F2F2F2">&nbsp;<%out.println("*" + session.getAttribute("prod_price" + i) + "= Rs. " + total[i] + "0");%>
                                                        </div>
                                                        <div><input type="image" src="img/updatecart.jpg" style="alignment-adjust: auto;height: 35px;width: 100px;border:2px solid #a1a1a1;margin-left:550px">
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                        </li>
                                        <li> 
                                        </li>
                                    </div>
                                    </ul></div>
                                    <%   }
                                        }
                                    %>

                                <div style="float: right;margin-top: 20px;margin-right:80px;font-size: 20px;"><b> Total: Rs. <%out.println(+sum + "0");%></b></div>
                                <form action="placeorder_step1.jsp?status=1" method="post">
                                    <div id="buynow" style="float: left; margin-left: 40px;margin-top: 40px;width:10px;  ">
                                        <input type="image" src="img/placeorder.jpg" width="150" height="50">
                                    </div>
                                </form>
                                <%}
                                    } catch (Exception e) {
                                        out.println(e);
                                    }%>
                            </b></div>
                        </body>
                        </html>
