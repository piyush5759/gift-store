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
<jsp:useBean id="category" scope="request" class="Bean.CategoryBean" />
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:getProperty name="category" property="catname" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <%
            int catid = -1;
            String cid = request.getParameter("sel");
            if (cid != null) {
                catid = Integer.parseInt(cid);
            } else {
                catid = Integer.parseInt(request.getParameter("category_id"));
            }
            int parid = -1;
            String pid = request.getParameter("parsel");
            if (pid != null) {
                parid = Integer.parseInt(pid);
            } else {
                parid = Integer.parseInt(request.getParameter("category_parentid"));
            }
        %>      
        <c:set var="category_id" value="${param.category_id}" />
        <c:set var="category_name" value="${param.category_name}" />
        <c:set var="category_desc" value="${param.category_desc}" />
        <c:set var="category_parentid" value="${param.category_parentid}"/>
        <c:set var="category_fetchid" value="${param.category_fetchid}"/>
        <c:set var="category_level" value="${param.category_level}"/>
        <c:set var="category_userid" value="${param.category_userid}"/>
        <c:set var="category_recordstatus" value="${param.category_recordstatus}"/>
        <%--// datetime value  --%>

        <%
            java.util.Date DoB = new java.util.Date();
            DoB = new Timestamp(DoB.getTime());

        %>



        <c:set var="update_datetime" value="<%=DoB%>" />
        <sql:update var="result" dataSource="jdbc/myDatasource">
            UPDATE CATEGORY
            SET category_id=?, category_name=?, category_desc=? , category_parentid=?, category_fetchid=?, category_level=?, 
            category_userid=?, category_recordstatus=?, update_datetime=?
            WHERE category_id=? 
            <sql:param value="${category_id}"/>
            <sql:param value="${category_name}"/>
            <sql:param value="${category_desc}"/>
            <sql:param value="${category_parentid}"/>
            <sql:param value="${category_fetchid}"/>
            <sql:param value="${category_level}"/>
            <sql:param value="${category_userid}"/>
            <sql:param value="${category_recordstatus}"/>
            <sql:param value="${update_datetime}"/>
            <sql:param value="${category_id}"/>
        </sql:update>
        <%! Connection con = null;%>
        <%! ResultSet rs = null;%> 

        <form action="category_update_redirect.jsp" method="post">
            <div>
                <table border="0">
                    <tbody>

                        <%  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                            con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");

                            String selectSQL = "SELECT category_id, category_name, category_desc, category_parentid, "
                                    + "category_fetchid, category_level,  category_userid, category_recordstatus "
                                    + "FROM category "
                                    + "WHERE category_id = ? and category_parentid=? " ;
                            PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
                            preparedStatement.setInt(1, catid);
                            preparedStatement.setInt(2, parid);
                            ResultSet rs1 = preparedStatement.executeQuery();
                            while (rs1.next()) {
                                int defcatid = rs1.getInt(1);
                                out.print("<tr><td>CATEGORY ID</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;'  name = 'category_id' id='txtselid' value ='" + defcatid + "' size = '30'/></td>  ");


                                String defcatname = rs1.getString(2);
                                out.print("<tr><td>CATEGORY NAME</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'category_name' id='txtselname' value ='" + defcatname + "' size = '30'/> </td> ");


                                String defcatdesc = rs1.getString(3);
                                out.print("<tr><td>CATEGORY DESC</td><td><textarea name='category_desc' style='font-family: lucida grande; color: black; background-color: green;' rows='10' cols='50' id='txtseldesc'> " + defcatdesc + "</textarea></td>");


                                int defcatparid = rs1.getInt(4);
                                out.print("<tr><td>CATEGORY PARENT ID</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'category_parentid' id='txtselparid' value ='" + defcatparid + "' size = '30'/> </td> ");


                                int defcatfetid = rs1.getInt(5);
                                out.print("<tr><td>CATEGORY FETCH ID</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'category_fetchid' id='txtselparid' value ='" + defcatfetid + "' size = '30'/> </td> ");


                                int defcatlev = rs1.getInt(6);
                                out.print("<tr><td>CATEGORY LEVEL</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'category_level' id='txtsellev' value ='" + defcatlev + "' size = '30'/> </td> ");


                                String defcatusrid = rs1.getString(7);
                                out.print("<tr><td>CATEGORY USER ID</td><td><input  type = 'text' style='font-family: lucida grande color: black; background-color: green;'  name = 'category_userid' id='txtselusrid' value ='" + defcatusrid + "' size = '30'/> </td> ");


                                int defcatrecstat = rs1.getInt(8);
                                out.print("<tr><td> RECORD STATUS</td><td><input  type = 'text' style='font-family: lucida grande; color: black; background-color: green;' name = 'category_recordstatus' id='txtselrecstat' value ='" + defcatrecstat + "' size = '30'/> </td> ");
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
        <sql:query var="result" dataSource="jdbc/myDatasource">
            SELECT * FROM CATEGORY 
            WHERE CATEGORY_id=?
            <sql:param value="${category_id}"/>
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
