<%-- 
    Document   : user_registration
    Created on : Jun 14, 2013, 1:49:32 PM
    Author     : Piyush
--%>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="javax.servlet.ServletException" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="home.css">
        <script type="text/javascript">
            function check(){
                var str="com";
                var details= new Array();
                details[0]=document.forms["regform"]["user_name"].value;
                details[1]=document.forms["regform"]["user_city"].value;
                details[2]=document.forms["regform"]["user_country"].value;
                details[3]=document.forms["regform"]["user_pincode"].value;
                details[4]=document.forms["regform"]["user_phone"].value;
                details[5]=document.forms["regform"]["user_emailid"].value;
                for(var i=0;i<2;i++){
                    for(var j=0;j<details[i].length;j++){
                        if(!((details[i].charCodeAt(j)>=97 && details[i].charCodeAt(j)<=122) || (details[i].charCodeAt(j)>=65 && details[i].charCodeAt(j)<=90) ))
                        {
                            alert("Please enter alphabets only");   
                            return false;
                        }
                    }
                }
                for(var i=3;i<4;i++){
                    for(var j=0;j<details[i].length;j++){
                        if(!((details[i].charCodeAt(j)>=48) && (details[i].charCodeAt(j)<=57))){
                            alert("Please enter numeric digits only");    
                            return false;
                        }
                    }
                }
                var atpos=details[5].indexOf("@");
                var dotpos=details[5].lastIndexOf(".");
                if (atpos<1 || dotpos<atpos+2 || dotpos+2>=details[5].length)
                {
                    alert("Not a valid e-mail address");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <% try{ %>
        <div id="register" class="register" align="center">
            <form action="user_registration.jsp" name="regform" method="post" onsubmit="return check();">
                <table height="500px" width="800px" >

                    <tr height="75">
                        <td colspan="2"><h2> Registration Details: </h2></td>
                    </tr>
                    <tr height="50">
                        <td width="200">User Name :</td>
                        <td><input type="text" id="user_name" name="user_name" size="30" style="height:25px"></td></tr>
                    <tr height="100">
                        <td>Address :</td> 
                        <td><textarea id="user_address" name="user_address" style="width: 300px; height: 120px;"></textarea></tr>
                    <tr height="50">
                        <td >City  :</td> 
                        <td><input type="text" id="user_city" name="user_city" size="30" style="height:25px"></td></tr>
                    <tr height="50">
                        <td>State : </td>
                        <td><input type="text" id="user_state" name="user_state" size="30" style="height:25px"></td></tr>
                    <tr height="50">
                        <td>Country : </td>
                        <td><input type="text" id="user_country" name="user_country" size="30" style="height:25px"></td></tr>
                    <tr height="50">
                        <td>Pincode :</td> 
                        <td><input type="text" id="user_pincode" name="user_pincode" size="30" style="height:25px"></td></tr>
                    <tr height="50"> 
                        <td>Phone Number :</td>
                        <td> <input type="text" id="user_phone" name="user_phone" size="30" style="height:25px"></td></tr>
                    <tr height="50">
                        <td>Email ID :</td> 
                        <td> <input type="text" id="user_emailid" name="user_emailid" size="30" style="height:25px"></td></tr>
                    <tr height="50"> 
                        <td>Password :</td> 
                        <td><input type="password" id="user_password" name="user_password" size="30" style="height:25px"></td></tr>
                    <tr height="50">
                        <td> </td> 
                        <td colspan="2" ><input type="submit" id="submit"  value="Register" ></td>
                    </tr>
                </table>
            </form>
            
        <c:set var="user_name" value="${param.user_name}" />
            <c:set var="user_address" value="${param.user_address}" />
            <c:set var="user_city" value="${param.user_city}"/>
            <c:set var="user_state" value="${param.user_state}"/>
            <c:set var="user_country" value="${param.user_country}"/>
            <c:set var="user_pincode" value="${param.user_pincode}"/>
            <c:set var="user_phone" value="${param.user_phone}"/>
            <c:set var="user_emailid" value="${param.user_emailid}" />
            <c:set var="user_password" value="${param.user_password}" />
            <c:if test="${(user_name!=null) && (user_address!=null) && (user_emailid!=null)&& (user_city!=null)&& (user_state!=null)
                          && (user_country!=null) && (user_pincode!=null)&& (user_phone!=null)}">

                  <sql:update var="result" dataSource="jdbc/myDatasource">
                      INSERT INTO user_registration(user_name, user_address,  user_city,  user_state, 
                      user_country, user_pincode, user_phone, user_emailid,user_password)
                      VALUES (?,?,?,?,?,?,?,?,?)
                      <sql:param value="${user_name}"/>
                      <sql:param value="${user_address}"/>
                      <sql:param value="${user_city}"/>
                      <sql:param value="${user_state}"/>
                      <sql:param value="${user_country}"/>
                      <sql:param value="${user_pincode}"/>
                      <sql:param value="${user_phone}"/>
                      <sql:param value="${user_emailid}"/>
                      <sql:param value="${user_password}"/>
                  </sql:update>

                  <%
                      String user_name = request.getParameter("user_name");
                      Cookie userName = new Cookie("user_name", user_name);
                      userName.setMaxAge(60 * 60 * 24);
                      // Add the cookies in the response header.
                      //response.addCookie(userId);
                      response.addCookie(userName);
                      // Session is not created.
                      request.getSession();
                      session.setAttribute("ID", session.getId());
                      session.setAttribute("username", user_name);
                      session.setMaxInactiveInterval(60 * 60);
                      //response.sendRedirect("index.jsp?status=1");

                      response.sendRedirect("index.jsp?username="+user_name);
%>

            </c:if>
        </div>
            <%}
        catch(Exception e){
            out.println(e);
            }%>
    </body>
</html>
