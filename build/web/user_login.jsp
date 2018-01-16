<%-- 
    Document   : user_login
    Created on : Jun 17, 2013, 3:07:14 PM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="cookie.jsp" method="post">
            <table>

                <tr>
                    <td> Enter Your Name : </td>
                    <td><input type="text" id="txtName"></td>
                </tr>
                <tr>
                    <td> Enter Your Password : </td>
                    <td>
                        <input type="password" id="txtPass">
                    </td>
                </tr>
                <tr><td> <input type="submit" value="Login" onclick=""> </td></tr>

            </table>
        </form>
    </body>
</html>
