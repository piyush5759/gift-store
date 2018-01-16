<%-- 
    Document   : category_update
    Created on : May 9, 2013, 10:39:44 AM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <c:set var="category_id" value="${param.category_id}" />
        <c:if test="${(category_id!=null) && (category_id!='select')  }">
            <sql:update var="result" dataSource="jdbc/myDatasource">
                DELETE FROM CATEGORY 
                WHERE CATEGORY_ID=?
                <sql:param value="${category_id}"/>
            </sql:update>  
        </c:if>
                
        <form action="category_delete.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>
                            CATEGORY ID
                        </td>
                        <td>
                            <select name="category_id">
                                <sql:query var="result" dataSource="jdbc/myDatasource">
                                    SELECT CATEGORY_ID FROM CATEGORY
                                </sql:query>
                                <c:forEach var="row" items="${result.rowsByIndex}" >
                                    <c:forEach var="column" items="${row}" >
                                        <option><c:out value="${column}" /></option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>

                <td colspan="2" >
                    <input type="submit" value="DELETE" />
                </td>
                </tbody>
            </table>
        </form><sql:query var="result" dataSource="jdbc/myDatasource">
            SELECT * FROM CATEGORY
        </sql:query>

        <table border="1">
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
