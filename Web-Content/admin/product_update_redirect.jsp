<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="javax.servlet.ServletException" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <%
            int prodid = -1;
            String id = request.getParameter("prodsel");
            if (id != null) {
                prodid = Integer.parseInt(id);
            } else {
                prodid = Integer.parseInt(request.getParameter("product_id"));
            }
        %>      
        <c:set var="product_id" value="${param.product_id}" />
        <c:set var="product_name" value="${param.product_name}" />
        <c:set var="product_imgsrc" value="${param.product_imgsrc}" />
        <c:set var="product_gender" value="${param.product_gender}"/>
        <c:set var="product_price" value="${param.product_price}"/>
        <c:set var="product_desc" value="${param.product_desc}"/>
        <c:set var="product_userid" value="${param.product_userid}"/>
        <c:set var="product_recordstatus" value="${param.product_recordstatus}"/>
        <%--// datetime value  --%>

        <%
            java.util.Date DoB = new java.util.Date();
            DoB = new Timestamp(DoB.getTime());

        %>



        <c:set var="update_datetime" value="<%=DoB%>" />
        <sql:update var="result" dataSource="jdbc/myDatasource">
            UPDATE product
            SET product_id=?, product_name=?, product_imgsrc=? , product_gender=?, product_price=?, update_datetime=?, product_desc=?, 
            product_recordstatus=?
            WHERE product_id=? 
            <sql:param value="${product_id}"/>
            <sql:param value="${product_name}"/>
            <sql:param value="${product_imgsrc}"/>
            <sql:param value="${product_gender}"/>
            <sql:param value="${product_price}"/>
            <sql:param value="${update_datetime}"/>
            <sql:param value="${product_desc}"/>
            <sql:param value="${product_recordstatus}"/>

            <sql:param value="${product_id}"/>
        </sql:update>


        <form action="product_update_redirect.jsp" method="post">
            <div>
                <table border="0">
                    <tbody>
                        <%! Connection con = null;%>
                        <%! ResultSet rs = null;%> 
                        <%  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");

                            String selectSQL = "SELECT product_id, product_name, product_imgsrc, product_gender, "
                                    + "product_price, product_desc, product_recordstatus "
                                    + "FROM product "
                                    + "WHERE product_id = ? ";
                            PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
                            preparedStatement.setInt(1, prodid);
                            ResultSet rs1 = preparedStatement.executeQuery();
                            while (rs1.next()) {
                                int defprodid = rs1.getInt(1);
                                out.print("<tr><td>PRODUCT ID</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;'  name = 'product_id' id='txtselid' value ='" + defprodid + "' size = '30'/></td>  ");


                                String defprodname = rs1.getString(2);
                                out.print("<tr><td>PRODUCT NAME</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'product_name' id='txtselname' value ='" + defprodname + "' size = '30'/> </td> ");


                                String defprodimgsrc = rs1.getString(3);
                                out.print("<tr><td>PRODUCT IMAGE SOURCE</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'product_imgsrc' id='txtsellev' value ='" + defprodimgsrc + "' size = '30'/> </td> ");

                                String defprodgender = rs1.getString(4);
                                out.print("<tr><td>PRODUCT GENDER</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'product_gender' id='txtselparid' value ='" + defprodgender + "' size = '30'/> </td> ");

                                int defprodprice = rs1.getInt(5);
                                out.print("<tr><td>PRODUCT PRICE</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'product_price' id='txtselparid' value ='" + defprodprice + "' size = '30'/> </td> ");


                                String defproddesc = rs1.getString(6);
                                out.print("<tr><td>PRODUCT DESCRIPTION</td><td><textarea name='product_desc' style='font-family: lucida grande; color: black; background-color: green;' rows='10' cols='50' id='txtseldesc'> " + defproddesc + "</textarea></td>");

                                int defprodrecstat = rs1.getInt(7);
                                out.print("<tr><td> RECORD STATUS</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'product_recordstatus' id='txtselrecstat' value ='" + defprodrecstat + "' size = '30'/> </td> ");
                            }
                        %>



                        <tr>  <%--// submit  --%>
                            <td colspan="2" >
                                <input type="submit" value="UPDATE" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>



        <%

                out.print("<h3><tr><td>Image Upload:</td></h3>"
                        + "<td>Select a file to upload: <br />"
                        + "<form action='fileuptest.jsp?prodidtest="+prodid+"'  method='post' enctype='multipart/form-data'>"
                        + "<input type='file' name='file1' size='50' />"
                        + "<input type='hidden' name='prod1' id='prod1' value="+prodid+" />"
                        + "<br /><input type='submit' value='Upload File' /></form></td></tr>");
  
%>



        <sql:query var="result" dataSource="jdbc/myDatasource">
            SELECT * FROM product 
            WHERE product_id=?
            <sql:param value="${product_id}"/>
        </sql:query>

        <%--// displaying all the rows --%>

        <table border = '1'>
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><div  style="height:100px;overflow-y: scroll"><c:out value="${column}"/></div></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
