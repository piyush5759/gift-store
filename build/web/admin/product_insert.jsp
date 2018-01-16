<%-- 
    Document   :  PRODUCT_insert
    Created on : May 9, 2013, 10:39:27 AM
    Author     : rachit
--%>
<%@page import="java.sql.Timestamp;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD A PRODUCT</title>
    </head>
    <body bgcolor="green">
        <font color="black" >

        <c:set var="product_id" value="${param.product_id}" />
        <c:set var="product_name" value="${param.product_name}" />
        <c:set var="product_imgsrc" value="${param.product_imgsrc}"/>
        <c:set var="product_gender" value="${param.product_gender}"/>
        <c:set var="product_price" value="${param.product_price}"/>
        <c:set var="product_desc" value="${param.product_desc}" />
        <c:set var="product_recordstatus" value="${param.product_recordstatus}" />

        <%
            java.util.Date DoB = new java.util.Date();
            DoB = new Timestamp(DoB.getTime());
        %>
        <c:set var="update_datetime" value="<%=DoB%>" />

        <c:if test="${(product_id!=null) && (product_name!=null) && (product_desc!=null)&& (product_price!=null)&& 
                      (product_imgsrc!=null)&& (product_gender!=null)}">

              <sql:update var="result" dataSource="jdbc/myDatasource">
                  INSERT INTO  PRODUCT
                  VALUES (?,?,?,?,?,?,?,?)
                  <sql:param value="${product_id}"/>
                  <sql:param value="${product_name}"/>
                  <sql:param value="${product_imgsrc}"/>
                  <sql:param value="${product_gender}"/>
                  <sql:param value="${product_price}"/>
                  <sql:param value="${update_datetime}"/>
                  <sql:param value="${product_desc}"/>
                  <sql:param value="${product_recordstatus}"/>
              </sql:update>  
        </c:if>
        <form action="product_insert.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>
                            PRODUCT ID
                        </td>
                        <td>
                            <input type="text" name="product_id" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRODUCT NAME
                        </td>
                        <td>
                            <input type="text" name="product_name" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRODUCT IMAGE SOURCE
                        </td>
                        <td>
                            <input type="text" name="product_imgsrc" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRODUCT GENDER
                        </td>
                        <td>
                            <input type="text" name="product_gender" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRODUCT PRICE
                        </td>
                        <td>
                            <input type="text" name="product_price" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRODUCT DESCRIPTION
                        </td>
                        <td>
                            <textarea name="product_desc" rows="10" cols="50"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PRODUCT RECORD STATUS
                        </td>
                        <td> 
                            <input type="text" name="product_recordstatus" size="30" value="1" />
                        </td>
                    </tr>
                <td colspan="2">
                    <input type="submit" value="INSERT PRODUCT" />
                </td>
                </tbody>
            </table>
        </form><sql:query var="result" dataSource="jdbc/myDatasource">
            SELECT * FROM PRODUCT 
        </sql:query>

        <table border="1">
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><div style="height:40px;overflow-y: scroll"><c:out value="${column}"/></div></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        </font> </body>
</html>