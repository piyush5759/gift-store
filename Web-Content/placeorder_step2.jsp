<%-- 
    Document   : placeorder_step2
    Created on : Jun 23, 2013, 2:32:37 PM
    Author     : PIYUSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="home.css">
        <script type="text/javascript">
            function payment(num)
            {
                var num;
                if (num === 1) {
                    document.getElementById("debitcarddetails").style.display = 'block';
                    document.getElementById("creditcarddetails").style.display = 'none';
                    document.getElementById("netbankingdetails").style.display = 'none';
                    document.getElementById("cashondeliverydetails").style.display = 'none';
                }
                else if (num === 2)
                {
                    document.getElementById("debitcarddetails").style.display = 'none';
                    document.getElementById("creditcarddetails").style.display = 'block';
                    document.getElementById("netbankingdetails").style.display = 'none';
                    document.getElementById("cashondeliverydetails").style.display = 'none';
                }
                else if (num === 3) {
                    document.getElementById("debitcarddetails").style.display = 'none';
                    document.getElementById("creditcarddetails").style.display = 'none';
                    document.getElementById("netbankingdetails").style.display = 'block';
                    document.getElementById("cashondeliverydetails").style.display = 'none';
                }
                else if (num === 4) {
                    document.getElementById("debitcarddetails").style.display = 'none';
                    document.getElementById("creditcarddetails").style.display = 'none';
                    document.getElementById("netbankingdetails").style.display = 'none';
                    document.getElementById("cashondeliverydetails").style.display = 'block';
                }

            }
        </script>
    </head>
    <body>
        <div id="container">
            <div id="header" >
                <%@include file="header.jsp" %>
            </div>
            <div id="payment" style="float: left;">
                <div ><input type="button" id="debitcard"  onclick="payment(1);" class="button" name="debitcard" value="Debit Card"></div>
                <div ><input type="button" id="creditcard" onclick="payment(2);" class="button" name="creditcard" value="Credit Card"></div>
                <div ><input type="button" id="netbanking" onclick="payment(3);" class="button" name="netbanking" value="Net Banking" ></div>
                <div ><input type="button" id="CashOnDelivery"  onclick="payment(4);" class="button" name="CashOnDelivery" value="Cash on delivery" ></div>
            </div>
            <div id="paymentdetails" style="float: left; margin-left: 20px "  >
                <div id="debitcarddetails" style="display: block"><h2>Debit Card Details :</h2><br>
                    <table><tr><td><b>Select your Dedit : </b></td></tr>
                        <tr><td><select name="cardtype" id="cardtype">
                                    <option value="Master card">Master card
                                    <option value="Mastaero Card">Maestro Card
                                    <option value="visa card">visa card
                                    <option value="International card ">International card
                                </select></td></tr>
                        <tr><td><b>Your Debit card Number: </b></td><td>
                                <input type="text" name="Debitcardnumber" size="40"></td></tr>
                        <tr><td><b>Name on card :</b></td><td><input type="text" name="Debitcardname" size="40"></td></tr>
                        <tr><td><b>Card Issue date : </b></td><td></td></tr>
                        <tr><td><b>Security code : </b></td><td><input type="password" name="Debitcardname" size="10"></td></tr>
                    </table>
                </div>
                <div id="creditcarddetails" style="display: none"><h2>Credit Card Details :</h2><br>
                    <table><b>Select your Credit card type : 
                        </b><tr><td><select name="cardtype" id="cardtype">
                                    <option value="Master card">Master card
                                    <option value="Mastaero Card">Maestro Card
                                </select></td></tr>
                        <tr><td><b>Your Credit card Number: </b></td><td>
                                <input type="text" name="creditcardnumber" size="40" name="cardnumber"></td></tr>
                        <tr><td><b>Name on card :</b></td><td><input type="text" name="creditcardname" size="40"></td></tr>
                        <tr><td><b>Card Issue date : </b></td><td></td></tr>
                        <tr><td><b>Security code : </b></td><td><input type="password" name="creditcardname" size="10"></td></tr>
                    </table>
                </div>
                <div id="netbankingdetails" style="display: none"> <h2>Net Banking Details :</h2><br>
                    <table><b>Select your Bank name : </b>
                        <tr><td><b><select name="bankname" id="bankname">
                                    <option value="State Bank of India">State Bank of India
                                    <option value="PNB">PNB
                                    <option value="BOI">BOI
                                    <option value="AXIS BANK">AXIS BANK
                                </select></td></tr>
                        <tr><td>Your Credit card Number: </b></td><td>
                                <input type="text" name="creditcardnumber" size="40" name="cardnumber"></td></tr>
                        <tr><td><b>Name on card :</b></td><td><input type="text" name="creditcardname" size="40"></td></tr>
                        <tr><td><b>Card Issue date : </b></td><td></td></tr>
                        <tr><td><b>Security code : </b></td><td><input type="password" name="creditcardname" size="40"></td></tr>
                    </table>
                </div>
                <div id="cashondeliverydetails" style="display: none"><h2>Cash on delivery:</h2><br>
                    <table>
                        <tr><td><b>
                                This Product may also be available to you on cash on delivery.<br>You have to make sure that the required amount must be paid at the billing address.
                            </b></td></tr>
                    </table>
                </div>
            </div>
            <div id="addressdetails">
            </div>
        </div>
    </body>
</html>
