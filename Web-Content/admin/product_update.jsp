<%@page import="javax.servlet.*" %>
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
        <%-- 
              .text  = actual option value, between option open and end tags, main value of option tags.
              .value = value attribute of option tag.
        --%>                 
        <script type="text/javascript">
            function filltxtbox(){
                var e = document.getElementById("sel");
                return e.options[e.selectedIndex].text;
            }
            
        </script>
    </head> 
    <body bgcolor="green">
        <font color="black" >
        <%--// datetime value  --%>
        <%
            java.util.Date DoB = new java.util.Date();
            DoB = new Timestamp(DoB.getTime());
        %>
        <c:set var="update_datetime" value="<%=DoB%>" />
        <form action="product_update_redirect.jsp" method="POST">
            <table border="0">
                <tbody>
                    <%--// product_name selection  --%>
                    <%! Connection con = null;%>
                    <%! Statement st = null;%>
                    <%! ResultSet rs = null;%> 
                    <%
                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                        con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT  product_id, product_name FROM product");
                        con.setAutoCommit(false);
                    %>
                    <tr>
                        <td>
                            PRODUCT NAME
                        </td>

                        <td>
                            <%-- using select tag  --%>
                            <select id="prodsel" name="prodsel" >
                                <%
                                    String prodname;
                                    int prodid;
                                    while (rs.next()) {
                                        prodid = rs.getInt(1);
                                        prodname = rs.getString(2);

                                        out.println("<option value=" + prodid + ">" + prodname + "</option>");
                                    }
                                    
                                %>
                            </select>
                        </td>
                    </tr>
                    <%-- display GO BUTTON TO DISPLAY REST OF THE DATA IN FORM --%>
                <br>
                <tr> <td>
                        <input type="submit"  value="EDIT AND UPDATE" id="prodgobut" >
                    </td>
                </tr>    

                </tbody>
            </table>
        </form>
        </font>
    </body>
</html>